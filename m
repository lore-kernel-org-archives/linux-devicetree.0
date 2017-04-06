From: Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] of/fdt: introduce of_scan_flat_dt_subnodes and
 of_get_flat_dt_phandle
Date: Thu, 6 Apr 2017 10:38:29 +1000
Message-ID: <20170406103829.67d462e1@roar.ozlabs.ibm.com>
References: <20170405123706.6081-1-npiggin@gmail.com>
        <20170405123706.6081-3-npiggin@gmail.com>
        <CAL_JsqK4zbACwWVb-rsrvBb4hjBCexrqKRKrzSiZrZH5w=bKqQ@mail.gmail.com>
        <20170406003251.533e2845@roar.ozlabs.ibm.com>
        <CAL_JsqLEvjb8S-+-JEa4ALHeCWHiR1A_4ur9kd3pBRJaFYWVKw@mail.gmail.com>
        <1491425881.4166.90.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491425881.4166.90.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 06 Apr 2017 06:58:01 +1000
Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:

> On Wed, 2017-04-05 at 10:58 -0500, Rob Herring wrote:
> > Well, I'd like to avoid expanding usage of flat DT parsing in the
> > kernel. But you could just put this function into arch/powerpc and I'd
> > never see it, but I like that even less. Mainly, I just wanted to
> > raise the point.
> > 
> > Your argument works until you need that setup in assembly code, then
> > you are in the situation that you need to either handle the setup in
> > bootloader/firmware or have an simple way to determine that condition.  
> 
> The main issue is that changing that is a very very invasive change in
> an extremely fragile and rather nasty area of code shared by 32 and 64-
> bit for which we don't even have easy access to all the machines to
> test with anymore :)
> 
> It's probably not impossible, but it would delay the new cpu feature
> stuff that Nick is making by a lot, probably monthes, making it nearly
> impossible to get back into distros etc... 
> 
> So while it might be something to consider, I would definitely keep
> that as a separate unit of work to do later.

Yeah, it's no longer a "drop in" replacement for existing features
testing if we do this, which makes it hard to backport too (we will
need this for compatibility with future firmware, so it will have to
go into distro kernels.)

Given that it's quite a small addition to of/fdt code, hopefully
that gives you a reasonable justification to accept it.

If you prefer not to, that's okay, but I think we would have to carry
it in arch/powerpc at least for a time, because of the schedule we're
working to for POWER9 enablement. As a longer term item I agree with you
and Ben, it would be worth considering unflattening earlier.

Thanks,
Nick
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
