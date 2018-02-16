From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH V3] ARM: dts: stout: Initial r8a7790 Stout board support
Date: Fri, 16 Feb 2018 14:47:36 +0100
Message-ID: <20180216134736.lv6nuz7xxuhym63h@verge.net.au>
References: <20180215184919.31617-1-marek.vasut+renesas@gmail.com>
 <20180215193302.dhpvyvyr6ez37dm3@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180215193302.dhpvyvyr6ez37dm3@katana>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 15, 2018 at 08:33:02PM +0100, Wolfram Sang wrote:
> On Thu, Feb 15, 2018 at 07:49:19PM +0100, Marek Vasut wrote:
> > Stout base board support making use of 1 GiB of memory,
> > the Renesas H2 r8a7790 SoC with the SCIFA0 serial port
> > and CA15 with ARM architected timer.
> > 
> > Furthermore, this device tree contains entries for:
> >   - 4x LEDs
> >   - SDHI SD/MMC controller
> >   - Display unit with HDMI output
> >   - SH fast ethernet controller
> >   - QSPI controller with S25FL512S attached to it
> >   - I2C controller with DA9210 and DA 9063 PMICs
> > 
> > Signed-off-by: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Looks good, at least for the things I know best of all those:
> 
> Acked-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>

Thanks, applied.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
