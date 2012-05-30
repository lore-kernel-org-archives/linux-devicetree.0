From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v4 6/6] pinctrl: add pinctrl gpio binding support
Date: Wed, 30 May 2012 15:29:55 +0800
Message-ID: <20120530072955.GA3438@b29396-Latitude-E6410>
References: <1337952980-14621-1-git-send-email-b29396@freescale.com>
 <1337952980-14621-6-git-send-email-b29396@freescale.com>
 <20120526002950.062683E14F7@localhost>
 <CAA+hA=QT83wqe8MOi4B4xY4zTGbQPVhKxwuU_A+cPg-U3JicGw@mail.gmail.com>
 <20120530064641.26D383E065C@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120530064641.26D383E065C@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Dong Aisheng <b29396@freescale.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Wed, May 30, 2012 at 02:46:41PM +0800, Grant Likely wrote:
> On Sat, 26 May 2012 09:58:06 -0700, Dong Aisheng <dongas86@gmail.com>=
 wrote:
> > On Fri, May 25, 2012 at 5:29 PM, Grant Likely <grant.likely@secretl=
ab.ca> wrote:
> > > On Fri, 25 May 2012 21:36:20 +0800, Dong Aisheng <b29396@freescal=
e.com> wrote:
> > >> From: Dong Aisheng <dong.aisheng@linaro.org>
> > >>
> > >> This patch implements a standard common binding for pinctrl gpio=
 ranges.
> > >> Each SoC can add gpio ranges through device tree by adding a gpi=
o-maps property
> > >> under their pinctrl devices node with the format:
> > >> <&gpio $gpio-specifier $pin_offset $count>
> > >> while the gpio phandle and gpio-specifier are the standard appro=
ach
> > >> to represent a gpio in device tree.
> > >> Then we can cooperate it with the gpio xlate function to get the=
 gpio number
> > >> from device tree to set up the gpio ranges map.
> > >>
> > >> Then the pinctrl driver can call pinctrl_dt_add_gpio_ranges(pctl=
dev, node)
> > >> to parse and register the gpio ranges from device tree.
> > >>
> > >> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> > >> ---
> > >> Personally i'm not very satisfied with current solution due to a=
 few reasons:
> > >> 1) i can not user standard gpio api to get gpio number
> > >> 2) i need to reinvent a new api of_parse_phandles_with_args_ext =
which i'm not
> > >> sure if it can be accepted by DT maintainer.
> > >
> > > Right, as mentioned in my other email, doing it this way complete=
ly
> > > breaks the way the phandle-with-args pattern works. =A0That patte=
rn
> > > depends on the phandle node to have a #-cells property telling it=
 how
> > > many cells to process for the binding. =A0Adding additional data =
cells
> > > means the kernel is no longer able to parse multiple entries in t=
he
> > > gpios property.
> > Hmm, it can still parse multiple entries in the gpios property exce=
pt
> > that it adds two args although it's not related to gpio, but it is =
useful
> > for users for special case like pinctrl gpio ranges map.
>=20
> Really?  How exactly does it know that each record is longer than
> #gpio-cells specifies (I'm speaking from the binding level; not havin=
g
> custom code that just "knows" the the records have additional
> padding).
>=20
I'm not sure i understood your question correctly,
but yes, binding level does not know it.
Customer should call the correct of_parse_phandle_with_args or
of_parse_phandles_with_args_ext to do parsing.

> I have no interest in creating exceptions to the phandle-with-args
> pattern since it adds yet more implicit knowledge about how to parse.
Yes, i admit that's a problem.
But i did not know if any better solution.

> For example, the common gpio code can no longer parse a gpios propert=
y
> that is padded out because the common code doesn't know anything abou=
t
> padding.
>=20
I guess the common gpio code won't break since we already have the
standard gpio format for dt.
Users shouldn't use the wrong format to represent gpios.

> g.
>=20
> > > Hmmm.... I need more information about this gpio-maps property. =A0=
How
> > > is it arranged? =A0What kind of data is in it. =A0Can you give so=
me
> > > specific examples of how hardware would be described with a gpio-=
maps
> > > property?
> > >
> > For exampe:
> > MX6Q_PAD_SD2_DAT2__GPIO_1_13 means MX6Q_PAD_SD2_DAT2 can be used as=
 GPIO_1_13,
> > For reference gpio1,13, we usually do: xx-gpios =3D <gpio1 13 0> in=
 device tree.
> > Here we want to create a pin map of gpio1,13 to MX6Q_PAD_SD2_DAT2 f=
or
> > pinctrl gpio ranges map,
> > the format should be <GPIO_NUMBER PIN_ID NPINS>, then the pinctrl c=
ore
> > can automatically mux
> > the PIN_ID to gpio function by refer to this map.
> > For GPIO_NUMBER, we want to use the standard gpio dt represent way
> > since the gpio base may
> > be dynamically.
> > Assume MX6Q_PAD_SD2_DAT2 pin id is 1 and only one pin starting from=
 it
> > can be used as gpio.
> > Then the gpio-maps for MX6Q_PAD_SD2_DAT2 can be:
> > gpio-maps =3D <gpio1 13 0 1 1>
> >=20
> > We may have several pins can be used as gpio on mx6q.
> > Then the gpio-maps may becomes:
> > gpio-maps =3D <gpio1 13 0 1 1>,
> >                    <gpio1 14 0 5 1>,
> >                    <gpio2 0 0 20 1>,
> >                    ................
> >=20
> > Since the format is a little different from the standard gpio
> > represent way, so i can not use the standard gpio
> > api to parse the gpio number. That's why i need to invent
> > of_parse_phandle_args_ext function for this special
> > format.
> >=20
> > we still did not find any better way to do that.
> > Do you have any suggestion for this special case?
>=20
> Oh, I see....  Does this gpio-maps property sit beside a normal
> "gpios" property?  Or is it in a completely separate node?  If it sit=
s
no, currently it is in a completely separate node and is recommended
to be under pinctrl device node since pinctrl driver needs to use it.

> beside a normal "gpios" property and lines up with the gpio propertie=
s
> there, then I would just make it a tuple for each gpio.  Ie:
>=20
> gpios =3D <&gpio1 13 0>, <&gpio1 14 0>, <&gpio2 0 0>;
> gpio-pinmux =3D <1 1>,   <5 1>,         <20 1>;
>=20
I've had the same idea before but seemed Stephen did not like that sinc=
e
it's nature to put them at the same line with the format of
<GPIO PIN_ID COUNT>. (Here the GPIO is standard gpio dt format)
See:
http://www.spinics.net/lists/arm-kernel/msg176830.html

And above format may be hard to read if the tuples get big.

Regards
Dong Aisheng
