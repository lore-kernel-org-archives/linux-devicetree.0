Return-Path: <SRS0=uURk=GJ=codeaurora.org=sdharia@kernel.org>
Subject: Re: [PATCH v4 6/6] arm64: dts: sdm845: Add I2C controller support
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-7-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=Wk5apkO9ro+PkLGDS7poJgvTkDA4uSKnMXmK=GMzuMcQ@mail.gmail.com>
From: Sagar Dharia <sdharia@codeaurora.org>
Message-ID: <65fa4ff5-7f37-b6fd-e493-bec18511d334@codeaurora.org>
Date: Mon, 19 Mar 2018 16:15:50 -0600
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Wk5apkO9ro+PkLGDS7poJgvTkDA4uSKnMXmK=GMzuMcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Doug Anderson <dianders@chromium.org>, Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org
List-ID: <devicetree@vger.kernel.org>

Hi Doug,
Thanks for reviewing the patch.

On 3/16/2018 5:54 PM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 14, 2018 at 4:58 PM, Karthikeyan Ramasubramanian
> <kramasub@codeaurora.org> wrote:
>> Add I2C master controller support for a built-in test I2C slave.
>>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 19 +++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 29 +++++++++++++++++++++++++++++
>>  2 files changed, 48 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> index ea3efc5..69445f1 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> @@ -27,6 +27,10 @@
>>                 serial@a84000 {
>>                         status = "okay";
>>                 };
>> +
>> +               i2c@a88000 {
>> +                       status = "okay";
> 
> Any idea what clock frequency is appropriate for MTP?  You've got some
> pretty beefy 2.2K external pulls I think, so presumably 400 KHz is
> what you're aiming for?  It would be nice to specify one so you don't
> end up the the spam in the log "Bus frequency not specified ..."
> 
> 

Yes, we plan to use 400Khz. We will specify it here.

>> +               };
>>         };
>>
>>         pinctrl@3400000 {
>> @@ -50,5 +54,20 @@
>>                                 bias-pull-down;
>>                         };
>>                 };
>> +
>> +               qup-i2c10-default {
> 
> nit: probably in the pinctrl section we want to sort alphabetically?
> We could try to sort by "lowest numbered pin", but IMHO alphabetical
> makes the most sense.
> 
Sure.
> 
>> +                       pinconf {
>> +                               pins = "gpio55", "gpio56";
>> +                               drive-strength = <2>;
>> +                               bias-disable;
>> +                       };
>> +               };
>> +
>> +               qup-i2c10-sleep {
>> +                       pinconf {
>> +                               pins = "gpio55", "gpio56";
>> +                               bias-pull-up;
> 
> Are you sure that you want pullups enabled for sleep here?  There are
> external pulls on this line (as there are on many i2c busses) so doing
> this will double-enable pulls.  It probably won't hurt, but I'm
> curious if there's some sort of reason here.
> 
1. We need the lines to remain high to avoid slaves sensing a false
start-condition (this can happen if the SDA goes down before SCL).
2. Disclaimer: I'm not a HW expert, but we were told that
tri-state/bias-disabled lines can draw more current. I will find out
more about that.

> 
>> +                       };
>> +               };
>>         };
>>  };
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 59334d9..9ef056f 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -209,6 +209,21 @@
>>                                         pins = "gpio4", "gpio5";
>>                                 };
>>                         };
>> +
>> +                       qup_i2c10_default: qup-i2c10-default {
>> +                               pinmux {
>> +                                       function = "qup10";
>> +                                       pins = "gpio55", "gpio56";
>> +                               };
>> +                       };
>> +
>> +                       qup_i2c10_sleep: qup-i2c10-sleep {
>> +                               pinmux {
>> +                                       function = "gpio";
>> +                                       pins = "gpio55", "gpio56";
>> +                               };
>> +                       };
>> +
>>                 };
>>
>>                 timer@17c90000 {
>> @@ -309,6 +324,20 @@
>>                                 interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
>>                                 status = "disabled";
>>                         };
>> +
>> +                       i2c10: i2c@a88000 {
> 
> Seems like it might be nice to add all the i2c busses into the main
> sdm845.dtsi file.  Sure, most won't be enabled, but it seems like it
> would avoid churn later.
> 
> ...if you're sure you want to add only one i2c controller, subject of
> this patch should indicate that.
> 

Yes, we typically have a "platform(sdm845 here)-qupv3.dtsi" defining
most of the serial-bus instances (i2c, spi, and uart with
status=disabled) that we include from the common header. The boards
enable instances they need.
Will that be okay?

Thanks
Sagar
> 
>> +                               compatible = "qcom,geni-i2c";
>> +                               reg = <0xa88000 0x4000>;
>> +                               clock-names = "se";
>> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
>> +                               pinctrl-names = "default", "sleep";
>> +                               pinctrl-0 = <&qup_i2c10_default>;
>> +                               pinctrl-1 = <&qup_i2c10_sleep>;
>> +                               interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               status = "disabled";
>> +                       };
>>                 };
>>         };
>>  };
>> --
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
