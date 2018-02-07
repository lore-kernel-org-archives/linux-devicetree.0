From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 1/2] arm64: dts: sdm845: Add minimal dts/dtsi files for
 sdm845 SoC and MTP
Date: Wed, 7 Feb 2018 10:17:03 +0530
Message-ID: <43b34b44-f613-79c6-1fe4-01c9dfe85e62@codeaurora.org>
References: <20180125163216.29018-1-rnayak@codeaurora.org>
 <20180125163216.29018-2-rnayak@codeaurora.org>
 <CAL_JsqLb4PQ+NkA_RBAgB-5MzFKd+6wBvfCjXvoH-i8pGzzdTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqLb4PQ+NkA_RBAgB-5MzFKd+6wBvfCjXvoH-i8pGzzdTg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

[]..

>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +       model = "Qualcomm Technologies, Inc. SDM845";
> 
> This should only be in the board level file.

thanks, will fix.

> 
>> +
>> +       interrupt-parent = <&intc>;
>> +
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
>> +
>> +       chosen { };
>> +
>> +       memory {
>> +               device_type = "memory";
>> +               /* We expect the bootloader to fill in the reg */
> 
> The start address is variable? If not you should populate the base and
> have a unit-address.

sure, I'll check and update.

> 
>> +               reg = <0 0 0 0>;
>> +       };
>> +

[]..
>> +
>> +       soc: soc {
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               ranges = <0 0 0 0xffffffff>;
>> +               compatible = "simple-bus";
>> +
>> +               intc: interrupt-controller@17a00000 {
>> +                       compatible = "arm,gic-v3";
>> +                       #interrupt-cells = <3>;
>> +                       interrupt-controller;
>> +                       #redistributor-regions = <1>;
>> +                       redistributor-stride = <0x0 0x20000>;
>> +                       reg = <0x17a00000 0x10000>,     /* GICD */
>> +                             <0x17a60000 0x100000>;    /* GICR * 8 */
>> +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +               };
>> +
>> +               gcc: clock-controller@100000 {
>> +                       compatible = "qcom,gcc-sdm845";
> 
> sdm845-gcc is the preferred order.

This is still proposed as part of the GCC patch for sdm845 [1]
(which looks like has neither you nor the DT list copied :/ )
Also looking at Documentation/devicetree/bindings/clock/qcom,gcc.txt,
I see we seem to follow the gcc-<soc> convention for compatible all along :(

                        "qcom,gcc-apq8064"
                        "qcom,gcc-apq8084"
                        "qcom,gcc-ipq8064"
                        "qcom,gcc-ipq4019"
                        "qcom,gcc-ipq8074"
                        "qcom,gcc-msm8660"
                        "qcom,gcc-msm8916"
                        "qcom,gcc-msm8960"
                        "qcom,gcc-msm8974"
                        "qcom,gcc-msm8974pro"
                        "qcom,gcc-msm8974pro-ac"
                        "qcom,gcc-msm8994"
                        "qcom,gcc-msm8996"
                        "qcom,gcc-mdm9615"

[1] https://patchwork.kernel.org/patch/10193895/ 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
