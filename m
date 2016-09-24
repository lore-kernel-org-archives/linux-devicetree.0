From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/4] arm64: dts: Add timer erratum property for
 LS2080A and LS1043A
Date: Sat, 24 Sep 2016 22:11:39 +0800
Message-ID: <20160924141139.GB11051@tiger>
References: <1474533318-7796-1-git-send-email-oss@buserror.net>
 <1474533318-7796-2-git-send-email-oss@buserror.net>
 <57E53FBB.9090208@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57E53FBB.9090208-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 23, 2016 at 03:44:11PM +0100, Marc Zyngier wrote:
> With a commit message along the lines of:
> 
> Both the LS1043A and LS2080A platforms are affected by the Freescale
> A008585 erratum. Advertise it in their respective device trees.

<snip>

> Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>

Thanks, Marc.  I queued up the patch with the suggested commit log
added.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
