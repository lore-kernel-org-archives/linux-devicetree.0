From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v7 02/10] dt-bindings: introduce RPMH RSC bindings for Qualcomm
 SoCs
Date: Wed, 02 May 2018 13:37:52 -0700
Message-ID: <152529347285.138124.5939045845945488373@swboyd.mtv.corp.google.com>
References: <20180502193749.31004-1-ilina@codeaurora.org>
 <20180502193749.31004-3-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180502193749.31004-3-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: rnayak@codeaurora.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Lina Iyer (2018-05-02 12:37:41)
> diff --git a/Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt b/Do=
cumentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt
> new file mode 100644
> index 000000000000..950d56325284
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt
> @@ -0,0 +1,132 @@
[...]
> +
> +- qcom,drv-id:
> +       Usage: required
> +       Value type: <u32>
> +       Definition: The id of the DRV in the RSC block that will be used =
by
> +                   this controller.

used by the OS? instead of by this controller?

> +
> +- qcom,tcs-config:
> +       Usage: required
> +       Value type: <prop-encoded-array>
> +       Definition: The tuple defining the configuration of TCS.
> +                   Must have 2 cells which describe each TCS type.
> +                   <type number_of_tcs>.
> +                   The order of the TCS must match the hardware
> +                   configuration.
> +       - Cell #1 (TCS Type): TCS types to be specified -
> +                   SLEEP_TCS
> +                   WAKE_TCS
> +                   ACTIVE_TCS
> +                   CONTROL_TCS
> +       - Cell #2 (Number of TCS): <u32>
> +
> +- label:
> +       Usage: optional
> +       Value type: <string>
> +       Definition: Name for the RSC. The name would be used in trace log=
s.
> +
> +Drivers that want to use the RSC to communicate with RPMH must specify t=
heir
> +bindings as child nodes of the RSC controllers they wish to communicate =
with.
> +
> +Example 1:
> +
> +For a TCS whose RSC base address is is 0x179C0000 and is at a DRV id of =
2, the
> +register offsets for DRV2 start at 0D00, the register calculations are l=
ike

0xd00? Instead of what looks like octal.

> +this -
> +DRV0: 0x179C0000
> +DRV2: 0x179C0000 + 0x10000 =3D 0x179D0000
> +DRV2: 0x179C0000 + 0x10000 * 2 =3D 0x179E0000
> +TCS-OFFSET: 0xD00
> +
> +       apps_rsc: rsc@179c0000 {
> +               label =3D "apps_rsc";
> +               compatible =3D "qcom,rpmh-rsc";
> +               reg =3D <0x179c0000 0x10000>, <0x179d0000 0x10000>,
> +                     <0x179e0000 0x10000>, <0xd00 0>;
> +               reg-names =3D "drv-0", "drv-1", "drv-2", "tcs-offset";

tcs-offset should be a property, not a reg property value.

> +               interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;

There should be three interrupts? Not 1?

> +               qcom,drv-id =3D <2>;
> +               qcom,tcs-config =3D <SLEEP_TCS   3>,
> +                                 <WAKE_TCS    3>,
> +                                 <ACTIVE_TCS  2>,
> +                                 <CONTROL_TCS 1>;
> +       };
> +
