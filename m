From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] GR-Peach DTS update
Date: Thu, 24 Aug 2017 10:48:39 +0200
Message-ID: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Simon,
   now that RZ/A1 pin controller is merged, it's time to enable some peripheral
devices on GR-Peach has it has been done for Genmai and RSK boards.

The series is based on Simon's "renesas-dt2-for-v4.14" tag release, so it should
be ideally applied after v4.14-rc1 is out, as it needs pin controller nodes to
be defined in r7s72100.dtsi.

Patch 2/4 enables EHTER interface, even if I've not been able to exchange any
traffic on that. I can set the ip address and probe the device and double
checked the pin configuration process against u-boot sources (where the
interface is working instead). Sending the patch anyway and let you decide what
to do with that.

Thanks
   j

Jacopo Mondi (4):
  arm: dts: gr-peach: Remove empty line
  arm: dts: gr-peach: Add SCIF2 pin group
  arm: dts: gr-peach: Add ETHER pin group
  arm: dts: gr-peach: Add user led device nodes

 arch/arm/boot/dts/r7s72100-gr-peach.dts | 57 ++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
