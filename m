From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: of/dynamic: Fix test for PPC_PSERIES
Date: Fri, 05 Jun 2015 10:44:48 +0900
Message-ID: <20150605014448.8C8C5C407BD@trevor.secretlab.ca>
References: <20150604105732.77DFE140273@ozlabs.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150604105732.77DFE140273-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu,  4 Jun 2015 20:57:32 +1000 (AEST)
, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
 wrote:
> On Thu, 2015-04-06 at 09:34:41 UTC, Geert Uytterhoeven wrote:
> > "IS_ENABLED(PPC_PSERIES)" always evaluates to false, as IS_ENABLED() is
> > supposed to be used with the full Kconfig symbol name, including the
> > "CONFIG_" prefix.
> > 
> > Add the missing "CONFIG_" prefix to fix this.
> > 
> > Fixes: a25095d451ece23b ("of: Move dynamic node fixups out of powerpc and into common code")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> > ---
> 
> > Did this bug cause any breakage?
> > If yes, the fix should go to stable (for v3.17 and later).
> 
> Yikes. Not that I've heard of. But it's reasonably new so possibly it's not hit
> distros that folks tend to run on those machines.
> 
> I'm also not clear how it would break, it could be subtle and we've not noticed.
> 
> Nathan might have more of an idea (on CC).
> 
> On my machine here everything that has an ibm,phandle also has a linux,phandle,
> so we wouldn't hit that code path. But I'm not sure how representative that box
> is.
> 
> cheers

Still, an obvious bug. I've picked it up and marked for stable.

g.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
