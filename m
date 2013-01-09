From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/5] capemgr: Beaglebone DT overlay based cape manager
Date: Wed, 9 Jan 2013 08:11:31 +0000
Message-ID: <20130109081131.GH21994@gmail.com>
References: <1357584666-17374-1-git-send-email-panto@antoniou-consulting.com>
 <201301081212.29089.arnd@arndb.de>
 <51A6DFCC-BBC8-475D-88C4-1B22186339C1@antoniou-consulting.com>
 <201301081612.59292.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201301081612.59292.arnd@arndb.de>
Sender: linux-omap-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Pantelis Antoniou <panto@antoniou-consulting.com>, Tony Lindgren <tony@atomide.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Jon Loeliger <jdl@jdl.com>, Stephen Warren <swarren@wwwdotorg.org>, David Gibson <david@gibson.dropbear.id.au>, Benoit Cousson <b-cousson@ti.com>, Mitch Bradley <wmb@firmworks.com>, Alan Tull <atull@altera.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-omap@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Porter <mporter@ti.com>, Russ Dill <Russ.Dill@ti.com>, Koen Kooi <koen@dominion.thruhere.net>, Joel A Fernandes <agnel.joel@gmail.com>, Rob Clark <robdclark@gmail.com>, Jason Kridner <jkridner@beagleboard.org>, Matt Ranostay <mranostay@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Linu
List-Id: devicetree@vger.kernel.org

On Tue, 08 Jan 2013, Arnd Bergmann wrote:

> On Tuesday 08 January 2013, Pantelis Antoniou wrote:
> > On Jan 8, 2013, at 2:12 PM, Arnd Bergmann wrote:
> >=20
> > > On Tuesday 08 January 2013, Lee Jones wrote:
> > >>> If there is not, there is no way to automatically load the over=
lays; you can always
> > >>> use the kernel command line, or have the a user space applicati=
on to request the loading
> > >>> of a specific board's overlay.
> > >>=20
> > >> Unfortunately, there is no way to probe the UIBs. :(
> > >=20
> > > I thought that some of the newer UIBs had it, just not the old on=
es.
> > > As Pantelis says, we could at least detect the ones that have an =
EEPROM
> > > on them, and use a command line option or device tree attribute f=
or the others.
> > >=20
> > >       Arnd
> >=20
> > So I gather the new ones have an eeprom?
>=20
> I don't remember the details unfortunately. Lee should be the one who=
 can find out.
> IIRC there was at least a single integeger number on them.

Not as far as I can remember. There was (is?) a crude method of
identifying UIBs, but attempting to obtain certain I2C lines and
testing which ones were accessible. However, if there is an issue
with I2C, the wrong UIB was 'probed'.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-omap" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
