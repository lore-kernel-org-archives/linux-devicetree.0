From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Add R8A7743/SK-RZG1M PFC support
Date: Wed, 5 Jul 2017 15:06:59 +0300
Message-ID: <1ef81381-d558-7cad-0df4-bbd63d7055e1@cogentembedded.com>
References: <20170420185132.258111787@cogentembedded.com>
 <20170424061217.GC14843@verge.net.au> <20170705103308.GA29876@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170705103308.GA29876-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/05/2017 01:33 PM, Simon Horman wrote:

>>>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
>>> 'renesas-devel-20170420-v4.11-rc7' tag.  We're adding the R8A7743 PFC node
>>> and then describing the pins for SCIF0 and Ether devices declared earlier.
>>> These patches depend on the R8A7743 PFC suport in order to work properly.
>>
>> Thanks. I have marked these as deferred pending acceptance of the PFC
>> driver changes. Please repost or otherwise let me know when dependency
>> is satisfied.
>
> It appears that the driver changes have been acceptedi[1] so
> I have queued these up for v4.14.
>
> [1] https://www.mail-archive.com/linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg15744.html

    This points to Biju Das' patch acceptance, not mine. :-)

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
