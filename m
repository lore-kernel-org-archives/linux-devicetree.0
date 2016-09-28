From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: of: dt-overlay configfs status
Date: Wed, 28 Sep 2016 14:12:07 +0200
Message-ID: <CAAMH-ysawX29vKsqkjjNG=YNTuxjZoAeax2RCycWq_Me7Gz2Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I was wondering if there was a place where the status of this patch
could be found. Is this patch about to hit mainline?

It seems that it is now up to v7 according to the renesas tree[1] but
I couldn't find this patch in the archives or in patchwork.

I've ported those configfs changes to a NXP 4.1.15 kernel and it works
fine, been able to add spi/i2c devices using overlays. However I hit a
roadblock regarding the pinmuxing. I can't seem to be able to have a
new pinctrl group in the overlay.

By that I mean that the overlay pinctrl node appears in sysfs as
expected but is not registered in the pinctrl driver as an available
group. This results in the pinctrl driver not applying the pin muxing
when the i2c or spi driver is loaded.

Looking at the source code it looks like the pinctrl subsystem is
missing a notifier registration for of reconfiguration. Is this the
right way to go in order to have an overlay pinctrl node work from an
overlay driver node?

It seems that the BBB tree offers such feature according to this site
[2] but I can't seem to find where in the pinctrl-single a new node
would be parsed.

Hoping the above makes sense.

Regards,
Gary

[1] https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/overlays&id=3cc2e4a7
[2] http://elinux.org/BeagleBone_and_the_3.8_Kernel#Device_Tree_Overlays
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
