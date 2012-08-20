From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 01/11] pinctrl: mvebu: pinctrl driver core
Date: Mon, 20 Aug 2012 14:51:48 +0200
Message-ID: <20120820145148.47a69ba4@skate>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1344689809-6223-2-git-send-email-sebastian.hesselbarth@gmail.com>
	<CACRpkda0wUW4E3y=ucGRFu5fwwyFWo2dc=4qBaH6CFSOW2ZL_A@mail.gmail.com>
	<CABJ1b_TCF=Jfb0uuoh-M87n6faezj4OqZ4S_nJLA0yKga2-ioQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CABJ1b_TCF=Jfb0uuoh-M87n6faezj4OqZ4S_nJLA0yKga2-ioQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jason Cooper <jason@lakedaemon.net>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

Hello,

Le Mon, 20 Aug 2012 11:46:14 +0200,
Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> a =C3=A9crit :

> >> +uart1: serial@12100 {
> >> +       compatible =3D "ns16550a";
> >> +       reg =3D <0x12100 0x100>;
> >> +       reg-shift =3D <2>;
> >> +       interrupts =3D <7>;
> >> +       clock-frequency =3D <166666667>;
> >
> > It's got nothing to do with this patch, but getting a clock frequen=
cy
> > out of the DT instead of getting it from the clk_get_rate(clk) and
> > the clock tree seems absurd... (But maybe this platform does not
> > even have a clk implementation?)
>=20
> It's of_serial's implementation. I patched that once for getting
> frequency out of "clocks" property but then I got busy with
> porting mach-dove and pinctrl.. Marvell SoCs do have a clk
> implementation and as soon as of_serial can handle "clocks"
> property it will be used for sure. I can remove "clock-frequency"
> from the example anyway as it is not really part of pinctrl
> binding documentation.

We are also working on using the clk framework for the 370/XP support
(my colleague Gr=C3=A9gory in Cc has started working on this last week)=
, and
we also want to be able to get the serial clock-frequency from the clk
framework instead of an explicit value in the DT node. But that's a
separate topic :)

> > Is it possible to use devm_* managed devm_kzalloc() for this map
> > so you don't need to free it explicitly?
> >
> > (Maybe not, just checking.)
>=20
> Hmm, I guess not as I thought I've read not to use devm_kfree when
> you allocate _and_ free stuff on runtime without removing the device
> itself, right?

It is also my understanding that devm_*() functions should be used to
allocate things that should persist until the device is removed. But I
might be wrong here.

> >> +struct mvebu_mpp_ctrl {
> >> +       const char *name;
> >> +       u8 pid;
> >> +       u8 npins;
> >
> > So, there will never be > 256 pins on a Marvell platform?
>=20
> Well, with all current platforms we are well below 100. I guess
> 256 max (muxable) pins will be enough.

Agreed, and this structure is completely internal to the kernel, so we
can easily change it in the future if needed.

> >> + * struct mvebu_mpp_ctrl_setting - describe a mpp ctrl setting
> >> + * @val: ctrl setting value
> >
> > It is not obvious to me what this means, it it possible to elaborat=
e
> > on how this member is defined and used?
>=20
> Well, I see if I can clarify the description but wrt the datasheet it
> _should_ be quite obvious.

I think the setting/function/group/control terminology would benefit
from an explanation, as it isn't very easy to figure out what all these
words mean in the context of the pinctrl-mvebu driver.

> In some internal review with Andrew I also added a spinlock to
> mvebu_pinconf_get/_set that will protect all calls to generic and spe=
cific
> _get/_set register accesses. Moreover, I replaced clk_get_sys in pinc=
trl-dove
> with the devm_ counterpart and removed the explicit clk_put.

Yes, I had seen this discussion, but I am not sure it is needed: it
seems the pinctrl core calls all the pinconf_set/pinconf_get methods
with the pinctrl_mutex held. When I wrote an initial pinctrl driver for
370/XP I had the same question as Andrew and my conclusion was that the
locking done by the pinctrl subsystem core was sufficient.

Best regards,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
