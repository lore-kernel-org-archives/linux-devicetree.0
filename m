From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: berlin: add SMP support
Date: Tue, 3 Jun 2014 16:02:39 +0800
Message-ID: <20140603160239.38defafe@xhacker>
References: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
	<1401700866-24804-2-git-send-email-antoine.tenart@free-electrons.com>
	<20140602094715.GG28090@lunn.ch>
	<20140602100048.GA12162@kwain>
	<20140602100332.GH28090@lunn.ch>
	<20140602102750.GB13681@kwain>
	<20140603141913.710a1f7e@xhacker>
	<20140603075011.GA22742@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140603075011.GA22742-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jimmy Xu <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Tue, 3 Jun 2014 00:50:11 -0700
Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

> > We don't support independently power off cpu on BG2 and BG2Q in linux
> > kernel. So we can assume that bootloader has powered on the CPUs
> 
> Can i assume from your answer that the hardware does actually support
> independent power off/on of CPUs? It could be added sometime in the
> future.
> 

The BG2 and BG2Q HW doesn't support independent power off/on CPUs.

Sorry for confusion,
Jisheng
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
