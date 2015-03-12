From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 2/4] soc: Mediatek: Add SCPSYS power domain driver
Date: Thu, 12 Mar 2015 08:21:54 +0100
Message-ID: <20150312072154.GB24885@pengutronix.de>
References: <1425888603-25800-1-git-send-email-s.hauer@pengutronix.de>
 <1425888603-25800-3-git-send-email-s.hauer@pengutronix.de>
 <7h61a94zy0.fsf@deeprootsystems.com>
 <20150310094142.GD24885@pengutronix.de>
 <1426043791.24243.9.camel@mtksdaap41>
 <20150311090345.GR24885@pengutronix.de>
 <7hbnjzxxqo.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7hbnjzxxqo.fsf@deeprootsystems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Wed, Mar 11, 2015 at 10:14:23AM -0700, Kevin Hilman wrote:
> Sascha Hauer <s.hauer@pengutronix.de> writes:
>=20
> >> I asked our designer about the bus protection feature, here is his
> >> response:
> >>=20
> >> "
> >> It's for unexpected signal glitch in Power switch process.
> >>=20
> >> During Power switch process, we have clock switch, reset, isolatio=
n
> >> enable/disable and  power switch involved where the transition of
> >> asynchronous reset and  isolation is the most critical one,  which=
 have
> >> risk to introduce a unexpected short period signal transition from
> >> MTCMOS=E2=80=99s interface to other alive HW .=20
> >> "
> >>=20
> >> That means it protects unexpected bus accessing from HW, not from =
SW. So
> >> it will not hide bugs from wrong SW access.
> >
> > Ok, thanks for clarifying. This means we should enable this feature
> > sooner or later. Since the audio driver which is likely the first u=
ser
> > of this driver doesn't need the protection bits I think we have som=
e
> > time and can add the protection bits once the clock patches have be=
en
> > merged.
>=20
> Sounds OK to me.
>=20
> But I still think it belongs in the infracfg layer, and not in the PM
> domain layer.

I already have plans how to put the code into the infracfg driver. Wher=
e
the code is going to be called from remains to be seen. The power domai=
n
driver might or might not be a good place for it.

Sascha

--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
