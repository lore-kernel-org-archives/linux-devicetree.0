From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: "memory" binding issues
Date: Mon, 16 Sep 2013 10:17:46 -0600
Message-ID: <52372F2A.2050003@wwwdotorg.org>
References: <1379300274.4098.77.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379300274.4098.77.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/15/2013 08:57 PM, Benjamin Herrenschmidt wrote:
> [resent to the right list this time around]
> 
> Hi folks !
> 
> So I don't have the bandwidth to follow closely what's going on, but I
> just today noticed the crackpot that went into 3.11 as part of commit:
> 
> 9d8eab7af79cb4ce2de5de39f82c455b1f796963
> drivers: of: add initialization code for dma reserved memory
> 
> Fist of all, do NOT add (or change) a binding as part of a patch
> implementing code, it's gross.

Personally, I would argue the opposite; it's much easier to see what's
going on when it's all together in one patch. Ensuring ABI stability can
only be achieved through code review, i.e. splitting into separate
DT/code patches won't achieve that, so that argument doesn't affect this.

...
> Additionally, it has the following issues:
> 
>  - It describes the "memory" node as /memory, which is WRONG
> 
> It should be "/memory@unit-address, this is important because the Linux
> kernel of_find_device_by_path() isn't smart enough to do partial
> searches (unlike the real OFW one) and thus to ignore the unit address
> for search purposes, and you *need* the unit address if you have
> multiple memory nodes (which you typically do on NUMA machines).

Perhaps /memory should have had a unit-address, but it never has had on
ARM; see arch/arm/boot/dts/skeleton.dtsi which says:

        memory { device_type = "memory"; reg = <0 0>; };

... and the fact that reg in /memory can have multiple entries seems to
support the expectation we only have a single node here. I'm not sure
how we could possibly change this now it's become so entrenched?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
