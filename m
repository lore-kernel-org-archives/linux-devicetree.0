Return-Path: <SRS0=wXcc=LU=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 1/2] watchdog: rza_wdt: Support longer timeouts
Date: Thu, 6 Sep 2018 21:39:30 +0000
Message-ID: 
 <TY1PR01MB1562E9684200CF49FFD095F38A010@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180906183738.81238-1-chris.brandt@renesas.com>
 <20180906183738.81238-2-chris.brandt@renesas.com>
 <20180906185247.GA25433@roeck-us.net> <20180906185643.GA25704@roeck-us.net>
In-Reply-To: <20180906185643.GA25704@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On Thursday, September 06, 2018, Guenter Roeck wrote:
> > > +	u16 counter;
> > > +
> > > +	if (priv->cks =3D=3D CKS_4BIT) {
> > > +		counter =3D DIV_ROUND_UP((timeout * rate),  4194304) + 1;
> >
> > two spaces ?
> >
> > Also, I am not sure how this prevents overflows. Was't the concern
> > that timeout * rate might overflow an int ?

Actually, I don't have to care about math overflows for large timeout=20
values because the driver sets a max timeout value.

	if (priv->cks =3D=3D CKS_4BIT) {
		/* Assume slowest clock rate possible (CKS=3D0xF) */
		priv->wdev.max_timeout =3D (4194304 * U8_MAX) / rate;


So if a user sends a timeout greater than that, the upper layer returns=20
'Invalid argument' before it ever gets to the driver.

I guess that technically means I don't really have to do the
	if (counter > 256)
		counter =3D 256;
either because I will never get a timeout value greater than my max.

  (but, I might keep it in there anyway)

Chris
