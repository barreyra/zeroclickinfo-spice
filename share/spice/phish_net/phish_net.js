function ddg_spice_phish_net(api_result) {
    "use strict";

    // Validate the response (customize for your Spice)
    if (!api_result || api_result.error) {
        return Spice.failed('phish_net');
    }

    // Render the response
    Spice.add({
        id: "phish_net",

        // Customize these properties
        name: "Setlist",
        data: api_result[0],
        meta: {
            sourceName: "phish.net",
            sourceUrl: api_result[0].url,
            sourceIcon: true
        },
        templates: {
            group: 'base',
            options: {
                content: Spice.phish_net.content,
                moreAt: true
            }
        }
    });
};
