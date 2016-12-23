From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: Add support for QUSB2 phy
Date: Fri, 23 Dec 2016 10:22:18 +0530
Message-ID: <CAFp+6iESYfFrLpidhAXrPm7LQtYa6dV1xOL=AjdMfLXgL8Fv8g@mail.gmail.com>
References: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
 <1482253431-23160-2-git-send-email-vivek.gautam@codeaurora.org> <20161222211633.ldk3ykqiat6peyw7@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161222211633.ldk3ykqiat6peyw7@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: kishon <kishon@ti.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,


On Fri, Dec 23, 2016 at 2:46 AM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Dec 20, 2016 at 10:33:48PM +0530, Vivek Gautam wrote:
>> Qualcomm chipsets have QUSB2 phy controller that provides
>> HighSpeed functionality for DWC3 controller.
>> Adding dt binding information for the same.
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> ---
>>
>> Changes since v2:
>>  - Removed binding for "ref_clk_src" since we don't request this
>>    clock in the driver.
>>  - Addressed s/vdda-phy-dpdm/vdda-phy-dpdm-supply.
>>  - Addressed s/ref_clk/ref. Don't need to add '_clk' suffix to clock names.
>>  - Addressed s/tune2_hstx_trim_efuse/tune2_hstx_trim. Don't need to add
>>    'efuse' suffix to nvmem cell.
>>  - Addressed s/qusb2phy/phy for the node name.
>>
>> Changes since v1:
>>  - New patch, forked out of the original driver patch:
>>    "phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips"
>>  - Updated dt bindings to remove 'hstx-trim-bit-offset' and
>>    'hstx-trim-bit-len' bindings.
>>
>>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     | 53 ++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>> new file mode 100644
>> index 000000000000..594f2dcd12dd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>> @@ -0,0 +1,53 @@
>> +Qualcomm QUSB2 phy controller
>> +=============================
>> +
>> +QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
>> +
>> +Required properties:
>> + - compatible: compatible list, contains "qcom,msm8996-qusb2-phy".
>> + - reg: offset and length of the PHY register set.
>> + - #phy-cells: must be 0.
>> +
>> + - clocks: a list of phandles and clock-specifier pairs,
>> +        one for each entry in clock-names.
>> + - clock-names: must be "cfg_ahb" for phy config clock,
>> +                     "ref" for 19.2 MHz ref clk,
>> +                     "iface" for phy interface clock (Optional).
>> +
>> + - vdd-phy-supply: Phandle to a regulator supply to PHY core block.
>> + - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
>> + - vdda-phy-dpdm-supply: Phandle to 3.1V regulator supply to Dp/Dm port signals.
>> +
>> + - resets: a list of phandles and reset controller specifier pairs,
>> +        one for each entry in reset-names.
>> + - reset-names: must be "phy" for reset of phy block.
>
> -names is pointless when only one.

Sure, will drop the -names property, and get the reset control by index.

>
>> +
>> +Optional properties:
>> + - nvmem-cells: a list of phandles to nvmem cells that contain fused
>> +             tuning parameters for qusb2 phy, one for each entry
>> +             in nvmem-cell-names.
>> + - nvmem-cell-names: must be "tune2_hstx_trim" for cell containing
>> +                  HS Tx trim value.
>
> ditto.

nvmem doesn't allow, at this point, to get the cells by index.
Its APIs take 'const char' cell id and get the cell.

We should add this support to get the cell by index.
Will create a patch for that, and drop the '-names' property from bindings.

>
> With those dropped,
>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks for the Ack.

>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
