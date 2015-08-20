From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/2] Add VIN and ADV7180 device tree support for
 R8A7794/SILK board
Date: Thu, 20 Aug 2015 22:04:13 +0300
Message-ID: <55D624AD.7060801@cogentembedded.com>
References: <1750082.WpWf34HsI6@wasted.cogentembedded.com>
 <20150820185435.GE18990@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150820185435.GE18990-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/20/2015 09:54 PM, Simon Horman wrote:

>>     Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
>> 'renesas-devel-20150819-v4.2-rc7' tag. Here we add the VIN and ADV7180
>> video decoder device tree support on the R8A7794/SILK board. The patchset
>> requires previously posted SILK SDHI1 support patch in order to apply and
>> R8A7794/SILK I2C1 support in order to apply and build.
>>
>> [1/2] ARM: shmobile: r8a7794: add VIN DT support
>> [2/2] ARM: shmobile: silk: add VIN0/ADV7180 DT support
>
> Thanks, I have queued these up for v4.4.

    Perhaps a bit too early: the PFC VIN patch hasn't been merged yet. Sorry 
for not specifying the PFC dependency...

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
