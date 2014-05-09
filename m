From: Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RFC] Describing arbitrary bus mastering relationships in DT
Date: Fri, 9 May 2014 07:59:44 -0700
Message-ID: <CANEJEGuBD7RH32=YTjPmBt=Ykq21bSQ6gMtfU4H1qTbFPcWLYA@mail.gmail.com>
References: <20140501173248.GD3732@e103592.cambridge.arm.com>
	<6555552.UqkKQIAsih@wuerfel>
	<20140502174301.GE3805@e103592.cambridge.arm.com>
	<4735818.FvYoTFuExd@wuerfel>
	<20140509103309.GA3875@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140509103309.GA3875-M5GwZQ6tE7x5pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Linux DeviceTree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Grant Grundler <grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dave,
Mostly agree with your assessment. My $0.02 on one comment:


On Fri, May 9, 2014 at 3:33 AM, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org> wrote:
....
> The downside is that is any path flows through a dynamically
> configurable component, such as an IOMMU or a bridge that can be
> remapped, turned off etc., then unless we describe how the path is
> really linked together the kernel will need all sorts of baked-in
> knowledge in order to manage the system safely.

Absolutely. Some knowledge (assumptions) will be "baked in" as code
and some knowledge (explicit parameters) as device tree.

My understanding of device tree is it essentially specifies
"parameters" and "methods" (code provided in the kernel). All methods
make some assumptions about the behavior of the HW it's operating on
and as long as all users of a method share that assumption, all is
well. We don't need device tree to describe those assumptions.

cheers,
grant
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
