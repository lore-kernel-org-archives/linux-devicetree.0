From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 1/9] pinctrl: mvebu: pinctrl driver core
Date: Wed, 12 Sep 2012 18:01:54 +0200
Message-ID: <20120912180154.3e620d18@skate>
References: <1345623750-10645-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1347266386-16229-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1347266386-16229-2-git-send-email-sebastian.hesselbarth@gmail.com>
	<20120911164409.4c030bd8@skate>
	<504FB869.60201@wwwdotorg.org>
	<20120912085423.21af58d5@skate>
	<CACRpkdYVMTbfA++eqRrq6JM0phjN-X-f3N==oXbyVxCyYUVOOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYVMTbfA++eqRrq6JM0phjN-X-f3N==oXbyVxCyYUVOOA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Lior Amsalem <alior@marvell.com>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Ben Dooks <ben.dooks@codethink.co.uk>, Rob Landley <rob@landley.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Le Wed, 12 Sep 2012 17:50:48 +0200,
Linus Walleij <linus.walleij@linaro.org> a =C3=A9crit :

> This is a valid reason to keep it as is in my book.
> Readability along with a datasheet is important, most important
> is that it has a good structure for those maintaining the driver.
>=20
> Is this datasheet available so I can get the picture?

All publicly available datasheets for Marvell ARM SoCs are referenced
in Documentation/arm/Marvell/README.

See for example
http://www.marvell.com/embedded-processors/kirkwood/assets/HW_88F6281_O=
penSource.pdf,
which is the hardware datasheet for the 88F6281 Marvell SoC (Kirkwood
family). Table 26 on page 53 of the PDF is a good example. It lists all
the pins, on per row, and then has columns for each function identifier
(from 0x0 to 0x7). Then each cell says when pin X is muxed in function
Y, it provides this functionality.

So clearly, this representation is a list of pins, and for each pin, a
list of possible functions that this pin can take.

Best regards,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
