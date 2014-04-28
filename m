From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] mfd: bcm590xx: add support for second i2c slave
 address space
Date: Mon, 28 Apr 2014 10:29:48 +0100
Message-ID: <20140428092947.GN6264@lee--X1>
References: <1397501428-8857-1-git-send-email-mporter@linaro.org>
 <1397501428-8857-3-git-send-email-mporter@linaro.org>
 <20140416110603.GA19671@lee--X1>
 <20140416213141.GD12304@sirena.org.uk>
 <20140417065753.GC28725@lee--X1>
 <20140417222616.GK23695@beef>
 <20140422082139.GF17657@lee--X1>
 <20140423220126.GC4164@beef>
 <20140423220500.GA1127@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140423220500.GA1127@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > > > > > > s/regmap/Regmap
> > > > > >=20
> > > > > > It's consistently written regmap in all the documentation a=
nd so on :)
> > > > >=20
> > > > > Furry muff; but the comments still stand for the acronyms.
> > > > >=20
> > > > > > > addmap{0,1} doesn't quite sit right with me.
> > > > > >=20
> > > > > > > REVISIT: Ah, it's address-map, rather than add map. Okay,=
 not as bad
> > > > > > > as I first thought, but still, is there a better naming c=
onvention you
> > > > > > > could use?
> > > > > >=20
> > > > > > addrmap or something?
> > > > >=20
> > > > > Right, that was what I was thinking. However, I prefer someth=
ing along
> > > > > the lines of 'i2c' and 'i2c_sec' or 'client' and 'client_slv'=
 etc.
> > > >=20
> > > > FWIW, the reason it's addmap{0,1} is that the datasheet has doc=
uments
> > > > ADDMAP=3D0 and the first bank of registers and ADDMAP=3D1 as th=
e second bank
> > > > of registers. I adopted that to match the docs for the part.
> > > >=20
> > > > I guess we could do i2c and i2c_sec, I'll just have to put a co=
mment
> > > > correlating it to the h/w. Calling it 'slv' implies something e=
lse
> > > > so we should avoid that here. The notion of a "secondary" i2c d=
evice
> > > > is completely a Linux I2C subsystem fabrication which wouldn't =
exist
> > > > if it allowed multiple slave addresses per device. From a h/w
> > > > perspective there is really no primary and secondary relationsh=
ip.
> > > >=20
> > > > I'm fine with i2c/i2c_sec or addrmap0/1 and I will just comment=
 to
> > > > correlate with the datasheet..pick one.
> > >=20
> > > Let's stick method fabricated by the I2C subsystem. It may seem s=
trange
> > > from a h/w perspective, but it is the way we (you) have coded it,=
 as
> > > the first parameter of i2c_new_dummy() is the 'managing' (primary=
,
> > > parent, master, whatever) device, so '_sec' would suit as an
> > > identifying appendage for the resultant device.
> >=20
> > That works, I'll also switch to addrmap_[pri|sec] which touches the
> > regulator driver as well. That will keep the relationship  between =
device
> > and regmap clear.
>=20
> Misspoke...I'm switching regmap[0|1] to regmap_[pri|sec] to keep that
> synced with i2c_[pri|sec]

Sounds good, thanks Matt.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
