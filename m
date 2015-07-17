From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v3 1/3] ARM: dts: qcom: Add binding for the qcom coincell charger
Date: Fri, 17 Jul 2015 10:42:00 -0500
Message-ID: <CAL_Jsq+5zzw1+gper6uwac-3P9zVN=rjjPb7Za27t=RbPU2-1w@mail.gmail.com>
References: <1437090933-1232-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1437090933-1232-1-git-send-email-tim.bird@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tim Bird <tim.bird@sonymobile.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 16, 2015 at 6:55 PM, Tim Bird <tim.bird@sonymobile.com> wrote:
> This binding is used to configure the driver for the coincell charger
> found in Qualcomm PMICs.
>
> Signed-off-by: Tim Bird <tim.bird@sonymobile.com>

Reviewed-by: Rob Herring <robh@kernel.org>

> ---
>
> Changes in v3:
>  - change charge-enable property to charger-disable
> Changes in v2:
>  - remove 'qcom,' from example node name
>  - Added reference to parent node pm8941@0 and binding doc for it
>
>  .../bindings/power/qcom,coincell-charger.txt       | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
> new file mode 100644
> index 0000000..0e6d875
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
> @@ -0,0 +1,48 @@
> +Qualcomm Coincell Charger:
> +
> +The hardware block controls charging for a coincell or capacitor that is
> +used to provide power backup for certain features of the power management
> +IC (PMIC)
> +
> +- compatible:
> +       Usage: required
> +       Value type: <string>
> +       Definition: must be: "qcom,pm8941-coincell"
> +
> +- reg:
> +       Usage: required
> +       Value type: <u32>
> +       Definition: base address of the coincell charger registers
> +
> +- qcom,rset-ohms:
> +       Usage: required
> +       Value type: <u32>
> +       Definition: resistance (in ohms) for current-limiting resistor
> +               must be one of: 800, 1200, 1700, 2100
> +
> +- qcom,vset-millivolts:
> +       Usage: required
> +       Value type: <u32>
> +       Definition: voltage (in millivolts) to apply for charging
> +               must be one of: 2500, 3000, 3100, 3200
> +
> +- qcom,charger-disable:
> +       Usage: optional
> +       Value type: <boolean>
> +       Definition: definining this property disables charging
> +
> +This charger is a sub-node of one of the 8941 PMIC blocks, and is specified
> +as a child node in DTS of that node.  See ../mfd/qcom,spmi-pmic.txt and
> +../mfd/qcom-pm8xxx.txt
> +
> +Example:
> +
> +       pm8941@0 {
> +               coincell@2800 {
> +                       compatible = "qcom,pm8941-coincell";
> +                       reg = <0x2800>;
> +
> +                       qcom,rset-ohms = <2100>;
> +                       qcom,vset-millivolts = <3000>;
> +               };
> +       };
> --
> 1.8.2.2
>
