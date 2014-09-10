From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] checkpatch: struct of_device_id should usually be const
Date: Wed, 10 Sep 2014 09:29:35 +0200
Message-ID: <20140910072935.GA3755@pengutronix.de>
References: <1410333346-29062-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1410333797.24028.29.camel@joe-AO725>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1410333797.24028.29.camel@joe-AO725>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 10, 2014 at 12:23:17AM -0700, Joe Perches wrote:
> On Wed, 2014-09-10 at 09:15 +0200, Uwe Kleine-K=F6nig wrote:
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -4941,6 +4941,7 @@ sub process {
> >  				mtrr_ops|
> >  				neigh_ops|
> >  				nlmsvc_binding|
> > +				of_device_id|
> >  				pci_raw_ops|
> >  				pipe_buf_operations|
> >  				platform_hibernation_ops|
>=20
> Fine by me, there are ~1200 or so const uses.
>=20
> There are also ~350 of these that are not const.
>=20
> Are most all of those supposed to be const?
Yeah, I'm working on a patch series to fix most of these. I thought I
sent out the checkpatch patch first to slow down the occurences to fix.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
