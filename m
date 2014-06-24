From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] phy: miphy365x: Add Device Tree bindings for the
 MiPHY365x
Date: Tue, 24 Jun 2014 13:46:34 +0100
Message-ID: <20140624124634.GO13803@lee--X1>
References: <1400766819-22286-1-git-send-email-lee.jones@linaro.org>
 <53A160D1.8000908@ti.com>
 <20140618100411.GL23945@lee--X1>
 <6599289.0ZjjaMbRqj@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6599289.0ZjjaMbRqj@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> > > > converting all addresses to to resources so drivers can easily =
pull
> > > > them out using platform_get_resource() and friends.  Pushing th=
e reg
> > >=20
> > > right. Can't we use of_address_to_resource here?
> >=20
> > We could, but that would be an extra layer.  We'd be pulling the
> > address, putting it into a resource, then pulling it from the resou=
rce
> > for use.  If we're going to be pulling addresses out manually, we'r=
e
> > probably better off using of_get_address().  But again, we're just
> > carrying out functionality which is already provided by the
> > framework.
>=20
> there is also of_ioremap().

Isn't this SPARK only?  And doesn't it require a populated resource? =20
Which is what I'm saying is the issue here i.e. we don't have one.

> > > > properties down into a child node means that we have to now ite=
rate
> > > > over the sub-nodes and pull them out manually.  This will lead =
to a
> > >=20
> > > You anyway iterate while creating PHYs based on some constant. No=
w you have to
> > > iterate over the sub-nodes.
> > > > pretty messy implementation IMHO.
> >=20
> > This much is true.
> >=20
> > > > Can you point me in the direction of previous implementations w=
here you
> > > > have stipulated the same set of constraints please?
> > >=20
> > > ah.. there isn't any. The author of the other multi-phy driver [1=
] also feels
> > > this will just add to the complexity of the driver.
> >=20
> > =3D:)
> >=20
> > > Maybe we should ask the opinion of others?
> >=20
> > We could.  I'll CC Arnd as he likes this PHY stuff. :)
> >=20
> > > [1] -> http://www.spinics.net/lists/linux-sh/msg32087.html
>=20
> Having sub-nodes for each individual PHY managed by a controller seem=
s
> very reasonable to me. Making them show up as separate platform devic=
es
> seems less useful though.

Are there any examples of other nodes with reg properties, but not
compatible strings i.e. ones that aren't probed independently and
aren't platform devices that I can use for reference.  I'm having a
hard time figuring out how to _easily_ obtain indexed addresses
without adding a bunch of new code.  Perhaps if we did something in
the core there would be less overhead overall?=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
