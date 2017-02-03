From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH v2] EDAC: mpc85xx: Add T2080 l2-cache support
Date: Fri, 03 Feb 2017 16:12:05 +1100
Message-ID: <874m0bc0yi.fsf@concordia.ellerman.id.au>
References: <20170201231624.28843-1-chris.packham@alliedtelesis.co.nz> <20170201232735.byk7bnpeoqtcc7mh@pd.tnic> <01fe1af463c640a8bd48e45c2752b52c@svr-chch-ex1.atlnz.lc> <20170202173005.gqesvy5owtsbrviu@pd.tnic> <87h94cb11m.fsf@concordia.ellerman.id.au> <de8ec9087f214f2fae67b8ea9be92cdc@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <de8ec9087f214f2fae67b8ea9be92cdc-5g7mGxlPNYb6GjIOKuZY+ItlCAj8ZROq@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: "linux-edac@vger.kernel.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "morbidrsa@gmail.com" <morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> writes:

> On 03/02/17 12:55, Michael Ellerman wrote:
>> Chris if you want to send a patch to add the compatible string to the
>> l2cache.txt I would merge that, but honestly it doesn't achieve much
>> other than possibly catching a typo in the compatible name.
>
> I think catching a typo might be worthwhile. It's 5 minutes work for me 
> to grep/sed through the code to find existing compatible strings and 
> update the document. Which might save someone else a lot of time 
> debugging only to find out they've transposed some digits in the dts.
>
> I'll whip something up and send it out shortly.

Thanks.

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
