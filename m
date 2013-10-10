From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH 2/5] usb: gadget: s3c-hsotg: support configurable UTMI
 PHY width
Date: Thu, 10 Oct 2013 17:57:54 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E030458E16893@US01WEMBX2.internal.synopsys.com>
References: <1381140752-312-1-git-send-email-matt.porter@linaro.org>
 <1381140752-312-3-git-send-email-matt.porter@linaro.org>
 <20131010152922.GF28375@radagast> <5256DBD0.8030008@linaro.org>
 <20131010174620.GC19802@radagast>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131010174620.GC19802@radagast>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: Felipe Balbi [mailto:balbi-l0cyMroinI0@public.gmane.org]
> Sent: Thursday, October 10, 2013 10:46 AM
> 
> On Thu, Oct 10, 2013 at 12:54:40PM -0400, Matt Porter wrote:
> > On 10/10/2013 11:29 AM, Felipe Balbi wrote:
> > >On Mon, Oct 07, 2013 at 06:12:29AM -0400, Matt Porter wrote:
> > >>Extend dwc2 binding with an optional utmi phy width property.
> > >>Enable the s3c-hsotg.c driver to use standard dwc2 binding
> > >>and enable configuration of the UTMI phy width based on the
> > >>property.
> > >>
> > >>Signed-off-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >>Reviewed-by: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >>Reviewed-by: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >>---
> > >>  Documentation/devicetree/bindings/staging/dwc2.txt |  4 ++++
> > >>  drivers/usb/gadget/s3c-hsotg.c                     | 18 +++++++++++++++++-
> > >>  drivers/usb/gadget/s3c-hsotg.h                     |  1 +
> > >>  3 files changed, 22 insertions(+), 1 deletion(-)
> > >>
> > >>diff --git a/Documentation/devicetree/bindings/staging/dwc2.txt
> b/Documentation/devicetree/bindings/staging/dwc2.txt
> > >>index 1a1b7cf..fb6b8ee 100644
> > >>--- a/Documentation/devicetree/bindings/staging/dwc2.txt
> > >>+++ b/Documentation/devicetree/bindings/staging/dwc2.txt
> > >>@@ -6,10 +6,14 @@ Required properties:
> > >>  - reg : Should contain 1 register range (address and length)
> > >>  - interrupts : Should contain 1 interrupt
> > >>
> > >>+Optional properties:
> > >>+- snps,phy-utmi-width: Must contain the UTMI data width (either 8 or 16)
> > >
> > >isn't this available in any of the configuration registers ?
> >
> > Yes and no. HWCFG4 has a UTMI data width field. However, it has 3
> > valid states, "8", "16", or "8 or 16". The BCM281xx implementation is
> > set to the latter and the attached phy is 8-bit.
> >
> > Looking at dwc2 prior to Matthijs Kooijman's patch [1] which starts
> > validating the value of phy_utmi_width in that driver, the pci.c
> > dwc2_module_params .phy_utmi_width field there even had the comment,
> > "/* 16 bits - NOT DETECTABLE */". The autodetect code in
> > dwc2_set_param_phy_utmi_width() will fail if HWCFG4 has the "8 or 16"
> > option as it just decides to default to a phy width of 16 if nothing
> > is configured by the platform glue. This property would also allow
> > this issue to be addressed in that driver.
> 
> fair enough, but I'd really like to hear from DT folks if your suggested
> binding is acceptable. It seems like we can equally argue that it's a SW
> configuration or HW description.

It's definitely a HW description - the width of the UTMI data connection.

But, which PHY is this? Does it have a register that could tell what
the data width is? The dwc2 core has an (optional) PHY Vendor Control
Register that allows reading the PHY registers.

-- 
Paul

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
