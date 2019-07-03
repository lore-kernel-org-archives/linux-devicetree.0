From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: phy: add binding for the Lantiq VRX200
 and ARX300 PCIe PHYs
Date: Wed, 3 Jul 2019 07:30:00 -0600
Message-ID: <CAL_JsqK4t+M69CJ3Q+Sf9Q10jheDzHsMoNdjPCQ7x5rfGGq6Kw@mail.gmail.com>
References: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
 <20190702203523.2412-2-martin.blumenstingl@googlemail.com>
 <CAL_Jsq+3H-cbrUna27RJ1o0w5MxaubkA9hcZjpWsaEYnx6bWQg@mail.gmail.com> <CAFBinCCWzLyhzVcqHR0RY9+cSqDZ3EdJEim8SP4Mr2Q3M=OKTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCCWzLyhzVcqHR0RY9+cSqDZ3EdJEim8SP4Mr2Q3M=OKTg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, Mark Rutland <mark.rutland@arm.com>, Martin Schiller <ms@dev.tdt.de>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 3, 2019 at 2:58 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Rob,
>
> On Wed, Jul 3, 2019 at 1:34 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Tue, Jul 2, 2019 at 2:35 PM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > Add the bindings for the PCIe PHY on Lantiq VRX200 and ARX300 SoCs.
> > > The IP block contains settings for the PHY and a PLL.
> > > The PLL mode is configurable through a dedicated #phy-cell in .dts.
> > >
> > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > ---
> > >  .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  | 87 +++++++++++++++++++
> > >  .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  | 11 +++
> > >  2 files changed, 98 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > >  create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > > new file mode 100644
> > > index 000000000000..b7b222e772d0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > > @@ -0,0 +1,87 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> >
> > The preference is (GPL-2.0 OR BSD-2-Clause) for new bindings.
> to make sure I understand this correctly:
> the license is then only valid for the bindings - is it fine if the
> driver uses GPL-2.0-only?

Yes, as this isn't derived from the driver code nor used by the driver
code (though that would be fine).

BTW, 'GPL-2.0-only' is the newer, preferred form of 'GPL-2.0', so I
guess we should be using (GPL-2.0-only OR BSD-2-Clause).

> I don't have any datasheet for these SoCs so all my knowledge is based
> on the GPL-2.0-only driver from the Lantiq board support package
> (called "UGW").
> the .yaml file is 100% my own work so I'm fine with having GPL-2.0 OR
> BSD-2-Clause
> however, that still has to be compatible with my driver, which I chose
> to be GPL-2.0-only because that's the license from the Lantiq board
> support package
>
>
> Martin
