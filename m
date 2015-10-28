From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: Add BRCM IPROC NAND DT node for NS2
Date: Tue, 27 Oct 2015 17:39:35 -0700
Message-ID: <20151028003935.GZ13239@google.com>
References: <1445577373-21252-1-git-send-email-anup.patel@broadcom.com>
 <1445577373-21252-3-git-send-email-anup.patel@broadcom.com>
 <20151028001920.GY13239@google.com>
 <563015FC.9040006@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <563015FC.9040006-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Linux MTD <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pramod KUMAR <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 05:25:32PM -0700, Ray Jui wrote:
> On 10/27/2015 5:19 PM, Brian Norris wrote:
> >On Fri, Oct 23, 2015 at 10:46:13AM +0530, Anup Patel wrote:
> >>diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
> >>index f603277..9610822 100644
> >>--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
> >>+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
> >>@@ -212,5 +212,19 @@
> >>  			compatible = "brcm,iproc-rng200";
> >>  			reg = <0x66220000 0x28>;
> >>  		};
> >>+
> >>+		nand: nand@66460000 {
> >>+			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
> >
> >Technically, the binding says you should also have "brcm,brcmnand" as a
> >last resort. Otherwise (for the NAND parts):
> >
> 
> I believe Anup was seeing issues when both "brcm,nand-iproc" and
> "brcm,brcmnand" are present.
> 
> Note "brcm,nand-iproc" invokes 'iproc_nand_probe', which calls
> 'brcmnand_probe' in the end.
> 
> "brcm,brcmnand" invokes 'brcmstb_nand_probe', which also calls
> 'brcmstb_probe', but without all the prep configuration required for
> "brcm,nand-iproc".

Ah, I forgot about that problem. That seems like an OF infrastructure
issue that could be fixed. We could lump these drivers back together,
and make sure that "brcm,nand-iproc" gets the priority in the
of_device_id list.

Or we could just relax the DT binding.

But wait, wouldn't cygnus already have that problem? You're using the
binding I suggested in arch/arm/boot/dts/bcm-cygnus.dtsi.

Oh, and I see we hacked this one in drivers/mtd/nand/brcmnand/Makefile:

  # link order matters; don't link the more generic brcmstb_nand.o before the
  # more specific iproc_nand.o, for instance

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
