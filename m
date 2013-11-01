From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] arm: correct GIC cpu interface range for Cortex
 A15/GIC 400
Date: Fri, 1 Nov 2013 17:43:22 -0500
Message-ID: <CAL_JsqL4TA48ZhrMuxd+DNUF_O28wRLiX=o08To4WHRSTkwNVw@mail.gmail.com>
References: <1383300776.4332.3.camel@hastur.hellion.org.uk>
	<1383300809-7527-1-git-send-email-ian.campbell@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383300809-7527-1-git-send-email-ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 1, 2013 at 5:13 AM, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org> wrote:
> GICv2 (Cortex A15/GIC 400) have CPU interface registers up to offset 0x1004
> (the 32-bit GICC_DIR register a 0x1000). The GIC 400 documentation specifies
> the CPU interface region as being 0x2000 in size.
>
> Update all DTS entries claiming "arm,cortex-a15-gic" compatibility. Of these I
> only have personal experience with the vexpress a Calxeda (ecx) platforms and
> annecdotal evidence for omap and exynos. For the others I'm just assuming.
>
> Also update the example a15 binding in the documentation.
>
> The "Texas Instruments Keystone 2 SoC" platform which claim to have an a15
> compatible GIC but does not include the GICH/GICV registers. I've not touched
> that here.
>
> Signed-off-by: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
