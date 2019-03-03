From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [PATCH v3 bus+gpio 5/5] dt-bindings: gpio: Document GPIOs via
 Moxtet bus
Date: Mon, 4 Mar 2019 00:17:01 +0100
Message-ID: <20190304001701.0b1b9986@nic.cz>
References: <20190301035852.26780-1-marek.behun@nic.cz>
        <20190301035852.26780-6-marek.behun@nic.cz>
        <CACRpkdYpjjpVNUXRgT=XY758FGtDYow2fvwpah37T_GjTvLauQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYpjjpVNUXRgT=XY758FGtDYow2fvwpah37T_GjTvLauQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

do you know who is responsible for merging into drivers/bus?

I have received reviews for this and for previous versions only from
you and Rob.

Also, please do not merge yet. I have prepared a fourth version with
debugging over debugfs, fixed some checkpatch issues, and most
importantnly added interrupt reading support from moxtet.

I will send after proper testing is done for this new version.

Marek

On Fri, 1 Mar 2019 15:36:09 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Fri, Mar 1, 2019 at 4:59 AM Marek Beh=C3=BAn <marek.behun@nic.cz> wrot=
e:
>=20
> > This patch adds documentation of the device tree bindings for GPIOs
> > on the devices connected via Moxtet bus.
> >
> > Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org =20
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> > +               compatible =3D "cznic,moxtet-gpio"; =20
>=20
> Is cznic registered in
> Documentation/devicetree/bindings/vendor-prefixes.txt?
>=20
> Yours,
> Linus Walleij
