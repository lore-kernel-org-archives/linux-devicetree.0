From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Mon, 3 Jun 2013 11:42:05 +0200
Message-ID: <20130603094204.GC31808@ab42.lan>
References: <CACRpkdaxO0q_P2wJFy3zv4F-QM9dZk54qW8ft350XqcBt1Gr1w@mail.gmail.com>
 <20130508164123.GA10248@ab42.lan>
 <518AAF31.8080502@wwwdotorg.org>
 <20130510082521.GA2125@ab42.lan>
 <51942472.9010402@wwwdotorg.org>
 <CACRpkdYtKr5w2=1sONG4Qn2TQue38nV7epWfzxNQz5rjSs0DZQ@mail.gmail.com>
 <20130522142824.GC4789@ab42.lan>
 <CAD6h2NT4FqmEsLvtTDwwDL2YVzXYNpw72hTOcSxSMvHLhWvFPQ@mail.gmail.com>
 <20130524115053.GB5203@ab42.lan>
 <CACRpkdbqzSZefYB2jywkkKDE_Qse83+MDJ+D+UNYnQGFUzwQWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbqzSZefYB2jywkkKDE_Qse83+MDJ+D+UNYnQGFUzwQWQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Shiraz HASHIM <shiraz.hashim@st.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 29, 2013 at 02:21:05PM +0200, Linus Walleij wrote:
> On Fri, May 24, 2013 at 1:50 PM, Christian Ruppert
> <christian.ruppert@abilis.com> wrote:
>=20
> > I haven't understood how to associate GPIOs to
> > other functions, however: Our hardware pin controller makes GPIO pi=
ns
> > available depending on the configuration of the non-GPIO interfaces=
=2E
> > This means that in many configurations, GPIO banks are only partial=
ly
> > available because some pins are used for other purposes. We can't e=
xpect
> > our customers to manually change the pin assignments in the device =
tree
> > in order to take this into account for every PCB.
>=20
> But what is it your customers do when customizing a board then?

Ideally, they just select the pin functions they would like to use on
their PCB using the phandle mechanism outlined in
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt.
We will prepare the nodes to point to in our SOC .dtsi files. Obviously=
,
customers will look at these files, in particular the nodes they point
to. The simpler these nodes are (and the easier to understand) the
better.

> Part of the promise of the device tree is to make it easy for downstr=
eam
> users to customize the kernel, *especially* for different boards/syst=
ems
> using the same SoC, for example. It is very much intended as a
> customization tools for embedded developers getting boards from
> a chipset vendor.

Yes, this is our understanding as well. This is why we would like to
avoid confusion through the exposure of obscure number spaces, even
if a customer is not supposed to modify them.

Ease of use is also the reason why I added the gpio-base property to th=
e
original driver: Finding out the global GPIO number to use in
/sys/class/gpio for a given GPIO of a given bank seems to be a recurrin=
g
headache for our customers and the definition of the bank's base number
in the device tree is an attempt to improve this situation. I am lookin=
g
forward to the patch you said Alexandre is working on which will
probably be a much better solution.

> Maybe I don't understand what is meant by changing the pin
> assignments above ...

Every pin can have exactly one function at a time and is thus assigned
to that function. Ideally, conflicts are cleanly managed in the pinmux
driver and an error message is generated so customers can understand wh=
y
something doesn't work and how to fix it.

Greetings,
  Christian

--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
