From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: device trees for Energy Micro's EFM32 Cortex-M3
 SoCs
Date: Tue, 17 Dec 2013 17:16:34 +0100
Message-ID: <20131217161634.GK14866@pengutronix.de>
References: <20131216190953.GB14866@pengutronix.de>
 <1387221123-6794-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20131217113750.GB5307@netboy>
 <20131217131730.GI14866@pengutronix.de>
 <20131217153136.GA5564@netboy>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131217153136.GA5564@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Richard,

On Tue, Dec 17, 2013 at 04:31:38PM +0100, Richard Cochran wrote:
> On Tue, Dec 17, 2013 at 02:17:30PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Tue, Dec 17, 2013 at 12:37:51PM +0100, Richard Cochran wrote:
> > > On Mon, Dec 16, 2013 at 08:12:03PM +0100, Uwe Kleine-K=F6nig wrot=
e:
> > >=20
> > > > +		cmu: cmu@400c8000 {
> > > > +			compatible =3D "efm32gg,cmu";
> > >=20
> > > I was able to run this on the EFM32LG without problems.  Are you =
sure
> > > this CMU node is specific to the GG, or can it be shared?
> > I remember me being grumpy because I found some differences between=
 the
> > GG and some other efm32 device. After looking again I cannot find t=
he
> > problem. Maybe the LG is compatible but some other is not.
>=20
> It looked like to me that the only differences are flash and ram
> sizes, and presence or absence of peripherals, but I don't know all o=
f
> the many EM parts that well, just these two.
I asked my contact at Silabs, and he told that LG, GG and WG are
similar. Looking at the reference manual of the Gecko Series you can se=
e
that for example the bits in CMU_HFPERCLKEN0 are different.
A tool to judge about differences of the different SoCs would be nice.
=20
> > Can I assume your feedback as Tested-by:?
>=20
> Yes, by all means, please do.
Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
