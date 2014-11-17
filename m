From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v3 0/3] Amlogic Meson pinctrl driver
Date: Mon, 17 Nov 2014 10:57:45 -0800
Message-ID: <7d408e1ab6ad46b9ba9010dd18b0df54@BY2FFO11FD038.protection.gbl>
References: <1416168856-12747-1-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1416168856-12747-1-git-send-email-b.galvani@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Carlo Caione <carlo@caione.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jerry Cao <jerry.cao@amlogic.com>, Victor Wan <victor.wan@amlogic.com>
List-Id: devicetree@vger.kernel.org

Hi Beniamino,

On Sun, 2014-11-16 at 09:14PM +0100, Beniamino Galvani wrote:
> Hi,
>=20
> this is the third version of the pinctrl driver for Amlogic Meson. It
> provides a common infrastructure than can be used by all the SoCs of
> the family and configuration data specific for Meson8. Adding support
> for other SoCs should be only matter of defining new pins and banks.
>=20
> The driver uses generic DT properties for the definition of mux and
> configuration nodes; since there is an ongoing effort to centralize
> the parsing to generic code, I've reused the patch "pinctrl:
> pinconf-generic: Infer map type from DT property" [1] posted a few
> days ago by Soren Brinkmann. I will update the series if that patch i=
s
> going to change after the mailing list discussion.

Looks really nice to me and it's great that you use my patch as basis.
Looks like it works for more people than just me :)
I hope we can convince Linus to take that patch more or less as is. Eve=
n
though "kludgy" I don't see an easy way for addressing Linus' comments
without breaking current users of the interface. It may be easier/bette=
r
to gradually migrate to the newly defined bindings and remove the
kludgyness as user that rely on the current behavior disappear.

	Thanks,
	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
