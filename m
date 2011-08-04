From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2] of/address: Add of_iomap_nocache
Date: Thu, 4 Aug 2011 17:58:42 +0100
Message-ID: <CACxGe6uNK5KdXH2YFMyx1A+qcRGF-XHjZhhRZmk2KEq7hJo-og@mail.gmail.com>
References: <1312454196-31028-1-git-send-email-davidb@codeaurora.org> <4E3ACF3F.4040106@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <4E3ACF3F.4040106@freescale.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Cc: David Brown <davidb@codeaurora.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 4, 2011 at 5:56 PM, Scott Wood <scottwood@freescale.com> wr=
ote:
>> +#ifndef SPARC
>> +extern void __iomem *of_iomap_nocache(struct device_node *device, i=
nt
>> index);
>> +#else
>> +static inline void __iomem *of_iomap_nocache(struct device_node *de=
vice,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int index)
>> +{
>> + =A0 =A0 =A0 return of_iomap(device, index);
>> +}
>> +#endif
>
> Why is sparc special? =A0It looks like it defines ioremap_nocache() a=
s
> ioremap() just like powerpc and some others, so shouldn't the normal
> of_iomap_nocache just work?

No, the implementation is completely different.  SPARC preparses all
the reg properties.  Everyone else does not.

g.
