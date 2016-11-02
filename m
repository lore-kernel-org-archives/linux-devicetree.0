From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 1/2] phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips
Date: Wed, 2 Nov 2016 13:41:41 +0530
Message-ID: <CAFp+6iGe5XBjyUJQ48f5G=z+ctuPFZcDYWC2pd5XOtQC98zmEg@mail.gmail.com>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
 <1476873827-7191-2-git-send-email-vivek.gautam@codeaurora.org> <20161026211611.3rl7mas75ju4x77w@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161026211611.3rl7mas75ju4x77w@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: kishon <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,


On Thu, Oct 27, 2016 at 2:46 AM, Rob Herring <robh@kernel.org> wrote:
> On Wed, Oct 19, 2016 at 04:13:46PM +0530, Vivek Gautam wrote:
>> PHY transceiver driver for QUSB2 phy controller that provides
>> HighSpeed functionality for DWC3 controller present on
>> Qualcomm chipsets.
>>
>> This driver is based on phy-msm-qusb driver available in
>> msm-4.4 kernel @codeaurora[1]
>>
>> [1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/log/?h=caf/3.18/msm-3.18
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> Cc: Kishon Vijay Abraham I <kishon@ti.com>
>> ---
>>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  37 ++
>
> It's preferred the bindings are a separate patch.

Sure, will prepare a separate patch for bindings doc for both the phy patches.

>
>>  drivers/phy/Kconfig                                |  10 +
>>  drivers/phy/Makefile                               |   1 +
>>  drivers/phy/phy-qcom-qusb2.c                       | 577 +++++++++++++++++++++
>>  4 files changed, 625 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>>  create mode 100644 drivers/phy/phy-qcom-qusb2.c
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>> new file mode 100644
>> index 0000000..97c9ce7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>> @@ -0,0 +1,37 @@
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
>> +                     "ref_clk" for 19.2 MHz ref clk,
>> +                     "ref_clk_src" reference clock source.
>> +                     "iface" for phy interface clock (Optional).
>> +
>> + - vdd-phy-supply: Phandle to a regulator supply to PHY core block.
>> + - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
>> + - vdda-phy-dpdm: Phandle to 3.1V regulator supply to Dp/Dm port signals.
>> +
>> + - resets: a list of phandles and reset controller specifier pairs,
>> +        one for each entry in reset-names.
>> + - reset-names: must be "phy" for reset of phy block.
>> +
>> +Optional properties:
>> + - nvmem-cells: a list of phandles to nvmem cells that contain fused
>> +             tuning parameters for qusb2 phy, one for each entry
>> +             in nvmem-cell-names.
>> + - nvmem-cell-names: must be "tune2_hstx_trim_efuse" for cell containing
>> +                  HS Tx trim value.
>> + - qcom,hstx-trim-bit-offset: bit offset within nvmem cell for
>> +                           HS Tx trim value.
>> + - qcom,hstx-trim-bit-len: bit length of HS Tx trim value within nvmem cell.
>
> When does this change? Why is it not just a different nvmem cell?

This is per-controller bit fields. So for example, msm8996 that
has couple of controllers, has these bits as a part of same
cell of 32bits. Bits 21:24 for controller-1, and 25-28 for controller-2.

I thought of using the 'reg' and 'bit' properties of nvmem cell,
but was unsuccessful in using the same.

Hi Srini,
Can you please help me with this ? We have one register of 32 bits
(representing one nvmem cell), that has the value for both the
QUSB2 controllers. So, we just need to read the values that are placed
in two different nibbles, for the two controllers, using nvmem cell
device tree properties (may be 'reg' and 'bit' properties).


Thanks
Vivek

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
