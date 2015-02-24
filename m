From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/2] Add R8A7794 GPIO DT support
Date: Tue, 24 Feb 2015 17:43:19 +0300
Message-ID: <54EC8E07.1030301@cogentembedded.com>
References: <6954455.LyoCrfjM8R@wasted.cogentembedded.com> <20150223220030.GA29878@verge.net.au> <20150223231901.GD29878@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150223231901.GD29878-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 02/24/2015 02:19 AM, Simon Horman wrote:

>>>     Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
>>> 'renesas-devel-20150220-v3.19' tag. Here we add the GPIO device tree support
>>> for the R8A7794 SoC. It depends on the R8A7794 PFC/MMCIF device tree patches
>>> posted recently in order to apply.

>>> [1/2] ARM: shmobile: r8a7794: add GPIO clocks
>>> [2/2] ARM: shmobile: r8a7794: add GPIO DT support

>> Thanks,  I have queued these up with Geert's Acks.

> Sorry, I was too hasty again. I have dropped these pending the
> dependencies being queued up.

    Ah, I just didn't mention that the PFC patch is necessary for the latter 
patch to compile (but I don't expect it to change, so IMHO you can apply the 
PFC patch now). The former patch still can be merged, I think.

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
