From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: Introduce soc sleep stats bindings for Qualcomm SoCs
Date: Thu, 08 Aug 2019 09:20:04 -0700
Message-ID: <5d4c4bb6.1c69fb81.db640.7518@mx.google.com>
References: <20190808061228.16573-1-mkshah@codeaurora.org> <20190808061228.16573-2-mkshah@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808061228.16573-2-mkshah@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bjorn.andersson@linaro.org, evgreen@chromium.org, dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org, mkshah@codeaurora.org, devicetree@vger.kernel.org, Mahesh Sivasubramanian <msivasub@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Maulik Shah (2019-08-07 23:12:27)
> Add device binding documentation for Qualcomm Technology Inc's (QTI)
> SoC sleep stats driver. The driver is used for displaying SoC sleep
> statistic maintained by Always On Processor or Resource Power Manager.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Your SoB chain is odd. The author is Mahesh? Otherwise, use the
Co-Developed-by tag.

> ---
>  .../bindings/soc/qcom/soc-sleep-stats.txt     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-=
stats.txt
>=20
> diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.t=
xt b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.txt
> new file mode 100644
> index 000000000000..ee40687ded34
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.txt
> @@ -0,0 +1,36 @@
> +* SoC Sleep Stats
> +
> +Always On Processor/Resource Power Manager maintains statistics of the S=
oC
> +sleep modes involving lowering or powering down of the backbone rails - =
Cx

What is a 'backbone' rail?

> +and Mx and the oscillator clock, XO.

Drop the comma? XO is the oscillator clock.

> +
> +Statistics includes SoC sleep mode type, number of times low power mode =
were
> +entered, time of last entry, time of last exit and accumulated sleep dur=
ation.
> +SoC Sleep Stats driver provides sysfs interface to display this informat=
ion.

Can this document be YAML? Then it can be validated.

> +
> +PROPERTIES
> +
> +- compatible:
> +       Usage: required
> +       Value type: <string>
> +       Definition: Should be "qcom,rpmh-sleep-stats" or "qcom,rpm-sleep-=
stats".
> +
> +- reg:
> +       Usage: required
> +       Value type: <prop-encoded-array>
> +       Definition: The base address on the Always On Processor or Resour=
ce Power
> +                   Manager from where the stats are read.
> +
> +EXAMPLE 1:
> +
> +       rpmh_sleep_stats: soc-sleep-stats@c3f0000 {
> +               compatible =3D "qcom,rpmh-sleep-stats";
> +               reg =3D <0 0xc3f0000 0 0x400>;

Is this memory region in DDR? Or some specific IMEM location? I wonder
if it would be better to just have a pointer from the RPM node to this
memory region and then populate some stats if so.

> +       };
> +
