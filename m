From: Sergei Ianovich <ynvich@gmail.com>
Subject: Re: [PATCH v1] arm: pxa: fix DT node name for PXA27X usb
Date: Tue, 23 Feb 2016 15:01:41 +0300
Message-ID: <1456228901.23036.9.camel@gmail.com>
References: <1456139297-5854-1-git-send-email-ynvich@gmail.com>
	 <87oab8wyfe.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87oab8wyfe.fsf@belgarion.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:PXA2xx/PXA3xx SUPPORT" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Robert,=C2=A0

On Mon, 2016-02-22 at 16:35 +0100, Robert Jarzmik wrote:
> You're right, I haven't seen the pxa2xx.dtsi statement before.
>=20
> As such, could you amend a bit your patch please to :
> =C2=A0- add:
> Fixes: 0ec1939668e5 ("ARM: dts: pxa: add the usb host controller")
> =C2=A0- make the same change in pxa3xx.dtsi, as the same error is the=
re
> =C2=A0- and more globally align pxa2xx.dtsi, pxa27x.dtsi and pxa3xx.d=
tsi
> =C2=A0- remove the compatible, reg, interrupts and status from both p=
xa27x.dtsi and
> =C2=A0=C2=A0=C2=A0pxa3xx.dtsi as they are redundant with the included=
 pxa2xxx.dsti one

No problem. Let's figure out the best approach.

> I'm even wondering if the proper change wouldn't be to scrap the ohci
> declarations from pxa27x.dtsi and pxa3xx.dtsi, and only add the "cloc=
ks"
> property to pxa2xx.dtsi ...

Since clocks are declared in pxa27x.dtsi and=C2=A0pxa3xx.dtsi, there is=
 a
stronger ground to have node clocks properties set in pxa27x.dtsi
and=C2=A0pxa3xx.dtsi as well. However, there is already nodes with cloc=
ks
properties in pxa2xx.dtsi.

I cannot choose, you should make a decision.


--=20
Sergei Ianovich <ynvich@gmail.com>
