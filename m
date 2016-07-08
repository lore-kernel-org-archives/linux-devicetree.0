From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 00/15] ARM: dts: sunxi: Add reference-design-tablet.dtsi files + 2 new tablets
Date: Fri,  8 Jul 2016 18:05:41 +0200
Message-ID: <1467993956-19535-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime, Chen-Yu,

Here is a series based on Chen-Yu's suggestion to add a
reference-design-tablet.dtsi file. This works out quite
nicely, resulting in much simpler tablet .dts files, as
well as enabling a bunch of extra features on some tablets,
showing that having to add the same dts bits over and over
again for all model tablets is not a good idea.

This also includes a v2 submission of the new tablet dts
files which sparked the reference-design-tablet.dtsi
discussion.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
