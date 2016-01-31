From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: Re: [RFC v3 08/14] MIPS: dts: qca: introduce AR9331 devicetree
Date: Sun, 31 Jan 2016 23:59:54 +0300
Message-ID: <20160131235954.255ec9cb48ab36f6dc64a67f@gmail.com>
References: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
        <1453580251-2341-9-git-send-email-antonynpavlov@gmail.com>
        <20160125234630.16098b7f@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20160125234630.16098b7f@tock>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alban <albeu@free.fr>
Cc: linux-mips@linux-mips.org, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, 25 Jan 2016 23:46:30 +0100
Alban <albeu@free.fr> wrote:

> On Sat, 23 Jan 2016 23:17:25 +0300
> Antony Pavlov <antonynpavlov@gmail.com> wrote:
>=20
> > This patch introduces devicetree for Atheros AR9331 SoC (AKA Hornet=
).
> > The AR9331 chip is a Wi-Fi System-On-Chip (WiSOC),
> > typically used in very cheap Access Points and Routers.
> >=20
> > Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> > Cc: Gabor Juhos <juhosg@openwrt.org>
> > Cc: Alban Bedel <albeu@free.fr>
> > Cc: linux-mips@linux-mips.org
> > Cc: devicetree@vger.kernel.org
> > ---
> >  arch/mips/boot/dts/qca/ar9331.dtsi | 123 +++++++++++++++++++++++++=
++++++++++++
> >  1 file changed, 123 insertions(+)
> >=20
> > diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dt=
s/qca/ar9331.dtsi
> > new file mode 100644
> > index 0000000..bf128a2
> > --- /dev/null
> > +++ b/arch/mips/boot/dts/qca/ar9331.dtsi
> > @@ -0,0 +1,123 @@
> > +#include <dt-bindings/clock/ath79-clk.h>
> > +
> > +/ {
> > +	compatible =3D "qca,ar9331";
> > +
>=20
> [...]
>=20
> > +
> > +	extosc: oscillator {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +	};
>=20
> This oscillator is on the board and not in the SoC, so it should
> be in the board DTS.

This oscillator is always has to be connected to the SoC, it's abligato=
ry thing.
So there no logic incosistency in adding this oscillator node template =
to SoC's dtsi file.

This oscillator node is not describes oscillator completely but this no=
de
makes it possible to introduce oscillator early so we can make referenc=
e on
it just in ar9331.dtsi file. So we have no need to make full oscillator=
 description
in every board dts file.
=46uther is we make full oscillator' description in a board dts file th=
en we have
to additionally describe binding of the oscillator to SoC's clk block.



--=A0
Best regards,
=A0 Antony Pavlov
