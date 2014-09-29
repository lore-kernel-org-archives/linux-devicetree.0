From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] ARM: DT: apq8064 DT patches.
Date: Mon, 29 Sep 2014 10:14:04 +0100
Message-ID: <1411982044-7873-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These patches adds dt nodes for RPM, USB and SATA IPs found in APQ8064.
All the driver support for these IPs are already available in v3.17, except
the RPM driver which is now accepted by Lee and Mark.

These patches depend on the header file from 
http://www.spinics.net/lists/arm-kernel/msg364310.html
for regulators.

Now that the RPM patch is accepted, should RPM patch go via arm-soc tree?
so that we can get more functionality on IFC6410 board in v3.18 mainline.

All these patches are tested on IFC6410 board.
Am hoping to get these patches for v3.18, as these patches were sitting in
my dev tree since last 3 merge windows.

Thanks,
srini

Srinivas Kandagatla (4):
  ARM: DT: apq8064: add rpm support
  ARM: DT: apq8064: Add usb host support.
  ARM: DT: apq8064: Add USB OTG support
  ARM: DT: apq8064: Add SATA controller support.

 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts |  30 +++++
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 190 +++++++++++++++++++++++++++++
 2 files changed, 220 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
