From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Overlays and aliases
Date: Fri, 8 May 2015 15:20:24 +0200
Message-ID: <CAMuHMdVK0oLR2UPh-A=-mNayX5HwHoiUrvrKkgmW9=7yZOEJSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Kalimera Pantelis,

I'm trying to use an overlay to enable an additional serial port on an
expansion port. The serial driver relies on of_alias_get_id() to find the
serial index, so I have to update /aliases.

My first naive try:

        fragment@0 {
                target-path = "/aliases";

                __overlay__ {
                        serial3 = <&scif3>;
                };
        };

didn't work, as now /aliases/serial3 is a phandle, not a string.

Next try:

                        serial3 = &scif3;

That one isn't liked by dtc:

    ERROR (path_references): Reference to non-existent node or label "scif3"

Am I correct in assuming that fixup_path_references() needs updating to
support this, cfr. fixup_phandle_references()?

Finally, let's hardcode the path:

                        serial3 = "/serial@e6ea8000";

Now /sys/firmware/devicetree/base/aliases/serial3 is correct, but it
still doesn't
work, as the list of aliases is created only once (by of_alias_scan_aliases()),
after unpacking the device tree. I guess of_alias_add() should be called when
adding a property to /aliases.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
