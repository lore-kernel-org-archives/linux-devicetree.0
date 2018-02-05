From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx25-pinfunc: Always set SION for SD CMD
Date: Mon, 5 Feb 2018 09:32:35 +0100
Message-ID: <20180205083235.okfm2rjk3uskdbrh@pengutronix.de>
References: <20180127000752.2879-1-benoit.thebaudeau.dev@gmail.com>
 <20180127153733.7ziaq6frli3jemc7@pengutronix.de>
 <CA+sos78H1_ihvVghJcpZQZmB6rE2nfgXF8gq8kqK=cQE9Qs0mw@mail.gmail.com>
 <20180205081018.GQ31354@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180205081018.GQ31354@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?iso-8859-1?Q?Beno=EEt_Th=E9baudeau?= <benoit.thebaudeau.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Michael Nazzareno Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 05, 2018 at 04:10:20PM +0800, Shawn Guo wrote:
> On Sat, Jan 27, 2018 at 09:37:11PM +0100, Benoît Thébaudeau wrote:
> > On Sat, Jan 27, 2018 at 4:37 PM, Uwe Kleine-König
> > <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > > On Sat, Jan 27, 2018 at 01:07:52AM +0100, Benoît Thébaudeau wrote:
> > >> The eSDHC does not work properly if the SION bit is not set for the
> > >> bidirectional CMD signal, whatever the eSDHC instance and the selected
> > >> pad. Therefore, setting SION is mandatory for all eSDHC CMD ports. Do
> > >> this for MX25_PAD_*__SD*_CMD in imx25-pinfunc.h in order to enforce this
> > >> behavior for all boards.
> > >>
> > >> This had already been done for eSDHC1, but not for eSDHC2. Also, define
> > >> MX25_PAD_FEC_MDC__SDHC2_CMD so that all the possible cases are covered
> > >> from now on.
> > >
> > > There is an inconsistency in the naming. The eSDHC1 CMD constants are
> > > named:
> > >
> > >         MX25_PAD_SD1_CMD__SD1_CMD
> > >
> > > The reference calls this:
> > >
> > >         CMD of instance: esdhc1.
> > >
> > > The register name is correct though. Not sure it's worth to fix this to
> > > use consistent naming (which would result in:
> > >
> > >         MX25_PAD_SD1_CMD__ESDHC1_CMD
> > >
> > > which looks ugly, too).
> > 
> > Indeed. I had also noticed this. I can send a patch to apply before
> > this one. But that would break the out-of-tree DT files using these
> > definitions. Would that be OK?
> 
> That's OK, I would say.  It could be a reminder of that they should
> upstream their files.

I assume you saw v2 which introduced some defines to give those guys a
bit of time, which IMHO is still better. Then we can remove these compat
defines in (say) a year and so trigger this reminder.

Also one of the advantages of dt that was advertised when ARM was
converted to dt was, that upstreaming the dt isn't necessary any more. I
personally like this and still consider not upstreaming the dtb part of
a machine a sane approach.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
