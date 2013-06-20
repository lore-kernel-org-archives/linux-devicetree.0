From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] hwmon: (ina2xx) Add device tree support to pass the
 shunt resistor
Date: Wed, 19 Jun 2013 19:40:18 -0700
Message-ID: <20130620024018.GA835@roeck-us.net>
References: <1371624620-14254-1-git-send-email-Yuantian.Tang@freescale.com>
 <20130619154310.GA29516@roeck-us.net>
 <D07C73A334FF604B95B3CBD2A545D07B0B20DC69@039-SN2MPN1-011.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <D07C73A334FF604B95B3CBD2A545D07B0B20DC69@039-SN2MPN1-011.039d.mgd.msft.net>
Sender: linux-doc-owner@vger.kernel.org
To: Tang Yuantian-B29983 <B29983@freescale.com>
Cc: "khali@linux-fr.org" <khali@linux-fr.org>, "lm-sensors@lm-sensors.org" <lm-sensors@lm-sensors.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2013 at 02:27:18AM +0000, Tang Yuantian-B29983 wrote:
>=20
>=20
> > -----Original Message-----
> > From: Guenter Roeck [mailto:linux@roeck-us.net]
> > Sent: 2013=E5=B9=B46=E6=9C=8819=E6=97=A5 =E6=98=9F=E6=9C=9F=E4=B8=89=
 23:43
> > To: Tang Yuantian-B29983
> > Cc: khali@linux-fr.org; lm-sensors@lm-sensors.org; devicetree-
> > discuss@lists.ozlabs.org; linux-doc@vger.kernel.org
> > Subject: Re: [PATCH v2] hwmon: (ina2xx) Add device tree support to =
pass
> > the shunt resistor
> >=20
> > On Wed, Jun 19, 2013 at 02:50:20PM +0800, Yuantian.Tang@freescale.c=
om
> > wrote:
> > > From: Tang Yuantian <yuantian.tang@freescale.com>
> > >
> > > Adding another way that is device tree to pass the shunt resistor
> > > value to driver except for platform data.
> > >
> > > Signed-off-by: Tang Yuantian <Yuantian.Tang@freescale.com>
> >=20
> > I noticed that of.h include was missing. No need to re-send; I adde=
d it
> > myself.
> > Applied to -next.
> >=20
>=20
> Thanks for your help. Of.h is already included in i2c.h.
> If it is really needed, I should have seen the warning or error when =
compile.
> Including it explicitly is also a good point.
>=20
Common rule is to include a file if its definitions are used. We can no=
t rely
on some other file including it for us, since it is not guaranteed that=
 this
will always be the case.

Thanks,
Guenter
