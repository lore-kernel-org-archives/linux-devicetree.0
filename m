From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI config register
Date: Thu, 05 Sep 2019 17:03:18 -0700
Message-ID: <5d71a247.1c69fb81.2146f.7ed2@mx.google.com>
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-6-ilina@codeaurora.org> <5d6d1b72.1c69fb81.ee88.efcf@mx.google.com> <102c9268-c4ce-6133-3b0a-67c2fcba1e7a@arm.com> <20190903170722.GA31716@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903170722.GA31716@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh@kernel.org>, evgreen@chromium.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, mkshah@codeaurora.org, linux-gpio@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Lina Iyer (2019-09-03 10:07:22)
> On Mon, Sep 02 2019 at 07:58 -0600, Marc Zyngier wrote:
> >On 02/09/2019 14:38, Rob Herring wrote:
> >> On Thu, Aug 29, 2019 at 12:11:54PM -0600, Lina Iyer wrote:
> >>> In addition to configuring the PDC, additional registers that interfa=
ce
> >>> the GIC have to be configured to match the GPIO type. The registers on
> >>> some QCOM SoCs are access restricted, while on other SoCs are not. Th=
ey
> >>> SoCs with access restriction to these SPI registers need to be written
> >>
> >> Took me a minute to figure out this is GIC SPI interrupts, not SPI bus.
> >>
> >>> from the firmware using the SCM interface. Add a flag to indicate if =
the
> >>> register is to be written using SCM interface.
> >>>
> >>> Cc: devicetree@vger.kernel.org
> >>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> >>> ---
> >>>  .../bindings/interrupt-controller/qcom,pdc.txt           | 9 +++++++=
+-
> >>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/q=
com,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,p=
dc.txt
> >>> index 8e0797cb1487..852fcba98ea6 100644
> >>> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc=
.txt
> >>> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc=
.txt
> >>> @@ -50,15 +50,22 @@ Properties:
> >>>                 The second element is the GIC hwirq number for the PD=
C port.
> >>>                 The third element is the number of interrupts in sequ=
ence.
> >>>
> >>> +- qcom,scm-spi-cfg:
> >>> +   Usage: optional
> >>> +   Value type: <bool>
> >>> +   Definition: Specifies if the SPI configuration registers have to =
be
> >>> +               written from the firmware.
> >>> +
> >>>  Example:
> >>>
> >>>     pdc: interrupt-controller@b220000 {
> >>>             compatible =3D "qcom,sdm845-pdc";
> >>> -           reg =3D <0xb220000 0x30000>;
> >>> +           reg =3D <0xb220000 0x30000>, <0x179900f0 0x60>;
> >>
> >> There needs to be a description for reg updated. These aren't GIC
> >> registers are they? Because those go in the GIC node.
> >
> They are not GIC registers. I will update this documentation.
>=20
> >This is completely insane. Why are the GIC registers configured as
> >secure the first place, if they are expected to be in control of the
> >non-secure?
> These are not GIC registers but located on the PDC interface to the GIC.
> They may or may not be secure access controlled, depending on the SoC.
>=20

It looks like it falls under this "mailbox" device which is really the
catch all bucket for bits with no home besides they're related to the
apps CPUs/subsystem.

	apss_shared: mailbox@17990000 {
		compatible =3D "qcom,sdm845-apss-shared";
		reg =3D <0 0x17990000 0 0x1000>;
		#mbox-cells =3D <1>;
	};

Can you point to this node with a phandle and then parse the reg
property out of it to use in the scm readl/writel APIs? Maybe it can be
a two cell property with <&apps_shared 0xf0> to indicate the offset to
the registers to read/write? In non-secure mode presumably we need to
also write these registers? Good news is that there's a regmap for this
driver already, so maybe that can be acquired from the pdc driver.
