From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/4] arm64: dts: Add timer erratum property for
 LS2080A and LS1043A
Date: Sat, 24 Sep 2016 22:08:17 +0800
Message-ID: <20160924140817.GA11051@tiger>
References: <1474533318-7796-1-git-send-email-oss@buserror.net>
 <1474533318-7796-2-git-send-email-oss@buserror.net>
 <20160923162755.GG6397@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160923162755.GG6397-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 23, 2016 at 05:27:56PM +0100, Will Deacon wrote:
> On Thu, Sep 22, 2016 at 03:35:16AM -0500, Scott Wood wrote:
> > Signed-off-by: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 1 +
> >  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 1 +
> >  2 files changed, 2 insertions(+)
> 
> This patch conflicts with mainline,

Thanks for the heads-up.

> but I've queued the other three
> patches in the series in the arm64 tree.
> 
> Please send the updated .dts changes via arm-soc.

I will send this to arm-soc when v4.9-rc1 comes out with driver changes
in place.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
