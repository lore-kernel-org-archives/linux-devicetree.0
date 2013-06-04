From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: DT bindings for the palmas family MFD
Date: Tue, 4 Jun 2013 08:21:15 +0100
Message-ID: <20130604072115.GI3370@gmail.com>
References: <1370261333-5121-1-git-send-email-j-keerthy@ti.com>
 <20130603141851.GG3370@gmail.com>
 <51ACFECA.10209@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51ACFECA.10209@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: J Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, rob.herring@calxeda.com, rob@landley.net, mturquette@linaro.org, sameo@linux.intel.com, wim@iguana.be, lgirdwood@gmail.com, gg@slimlogic.co.uk, t-kristo@ti.com, Ian Lartey <ian@slimlogic.co.uk>
List-Id: devicetree@vger.kernel.org

On Mon, 03 Jun 2013, Stephen Warren wrote:

> On 06/03/2013 08:18 AM, Lee Jones wrote:
> > On Mon, 03 Jun 2013, J Keerthy wrote:
> >> Add the various binding files for the palmas family of chips. Ther=
e is a
> >> top level MFD binding then a seperate binding for regulators IP bl=
ocks on chips.
>=20
> >> diff --git a/Documentation/devicetree/bindings/mfd/palmas.txt b/Do=
cumentation/devicetree/bindings/mfd/palmas.txt
>=20
> >> +Example:
> >> +
> >> +palmas {
> >=20
> > Should this be 'palmas@48 {', as it has an address?
>=20
> It's common to only include the unit-address (@48) if it's needed to
> make the node name unique (i.e. if you had multiple palmas devices).

I was working on the basis of, if it has a 'reg' value, it should be
highlighted in the node name, but if this is the common way of doing
things then fair enough.

> >> diff --git a/Documentation/devicetree/bindings/regulator/palmas-pm=
ic.txt b/Documentation/devicetree/bindings/regulator/palmas-pmic.txt
>=20
> > See: Documentation/devicetree/bindings/regulator/gpio-regulator.txt
> >=20
> >> +	       ti,sleep-mode - mode to adopt in pmic sleep 0 - off, 1 - =
auto,
> >> +	       2 - eco, 3 - forced pwm
> >=20
> > I've seen lots of sleep-mode properties, can't we define a generic
> > one?
>=20
> Isn't it HW-specific?

Yes, they're not all identical. I haven't studied them all in detail,
but I assumed a we would be able to do something in order to
consolidate them somewhat. If they are vastly different then no
problem, it was just an idea to cut down on vendor specific
properties.=20

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
