From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 6/7] dt-bindings: phy-qcom-usb2: Add support to
 override tuning values
Date: Mon, 7 May 2018 08:57:26 -0700
Message-ID: <CAD=FV=XC+P1-iUp1mgVbMt9-0xhyCuU+fyGgkG0Jr3NmVw4oTA@mail.gmail.com>
References: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org>
 <1525295174-15995-7-git-send-email-mgautam@codeaurora.org> <20180507155313.GA9696@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180507155313.GA9696@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Manu Gautam <mgautam@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Rob,

On Mon, May 7, 2018 at 8:53 AM, Rob Herring <robh@kernel.org> wrote:
> On Thu, May 03, 2018 at 02:36:13AM +0530, Manu Gautam wrote:
>> To improve eye diagram for PHYs on different boards of same SOC,
>> some parameters may need to be changed. Provide device tree
>> properties to override these from board specific device tree
>> files. While at it, replace "qcom,qusb2-v2-phy" with compatible
>> string for USB2 PHY on sdm845 which was earlier added for
>> sdm845 only.
>>
>> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
>> ---
>>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     | 23 +++++++++++++-
>>  include/dt-bindings/phy/phy-qcom-qusb2.h           | 37 ++++++++++++++++++++++
>>  2 files changed, 59 insertions(+), 1 deletion(-)
>>  create mode 100644 include/dt-bindings/phy/phy-qcom-qusb2.h
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>> index 42c9742..03025d9 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>> @@ -6,7 +6,7 @@ QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
>>  Required properties:
>>   - compatible: compatible list, contains
>>              "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
>> -            "qcom,qusb2-v2-phy" for QUSB2 V2 PHY.
>> +            "qcom,sdm845-qusb2-phy" for 10nm PHY on sdm845.
>>
>>   - reg: offset and length of the PHY register set.
>>   - #phy-cells: must be 0.
>> @@ -27,6 +27,27 @@ Optional properties:
>>               tuning parameter value for qusb2 phy.
>>
>>   - qcom,tcsr-syscon: Phandle to TCSR syscon register region.
>> + - qcom,imp-res-offset-value: It is a 6 bit value that specifies offset to be
>> +             added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
>> +             tuning parameter that may vary for different boards of same SOC.
>> +             This property is applicable to only QUSB2 v2 PHY (sdm845).
>> + - qcom,hstx-trim-value: It is a 4 bit value that specifies tuning for HSTX
>> +             output current.
>> +             Possible range is - 15mA to 24mA (stepsize of 600 uA).
>> +             See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
>> +             This property is applicable to only QUSB2 v2 PHY (sdm845).
>> +             Default value is 22.2mA for sdm845.
>> + - qcom,preemphasis-level: It is a 2 bit value that specifies pre-emphasis level.
>> +             Possible range is 0 to 15% (stepsize of 5%).
>> +             See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
>> +             This property is applicable to only QUSB2 v2 PHY (sdm845).
>> +             Default value is 10% for sdm845.
>> +- qcom,preemphasis-width: It is a 1 bit value that specifies how long the HSTX
>> +             pre-emphasis (specified using qcom,preemphasis-level) must be in
>> +             effect. Duration could be half-bit of full-bit.
>
> s/of/or/
>
> But I'd just make this a boolean instead: qcom,preemphasis-half-bit

I had this same comment in the post of v4.  See
<https://patchwork.kernel.org/patch/10314923/>.  Specifically, I said:

> Perhaps just make this a boolean property.  If it exists then you get
> the non-default case.  AKA: if the default is full bit width, then
> you'd allow a boolean property "qcom,preemphasis-half-width" to
> override.  If the default is half bit width then you'd allow
> "qcom,preemphasis-full-width" to override.

Manu replied:

> Default property value for an SOC is specified in driver and could vary from
> soc to soc. Hence, from board devicetree for different SOCs we might need
> to select separate widths overriding default driver values.
> Alternative is to have two bool properties each for half and full-width. Did
> you actually mean that?


IMHO given Manu's argument it seems fine to specify it the way he did.
Please advise if you agree or disagree.

-Doug
