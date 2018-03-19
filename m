Return-Path: <SRS0=kjAb=GJ=google.com=dianders@kernel.org>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <65fa4ff5-7f37-b6fd-e493-bec18511d334@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-7-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=Wk5apkO9ro+PkLGDS7poJgvTkDA4uSKnMXmK=GMzuMcQ@mail.gmail.com> <65fa4ff5-7f37-b6fd-e493-bec18511d334@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 19 Mar 2018 16:56:27 -0700
Message-ID: <CAD=FV=Vq4Q2LvY_O-YsdyUmQOUANa0ap+U9j7PXSD3_ao6sCdQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: sdm845: Add I2C controller support
Content-Type: text/plain; charset="UTF-8"
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

On Mon, Mar 19, 2018 at 3:15 PM, Sagar Dharia <sdharia@codeaurora.org> wrote:
>>> +                       pinconf {
>>> +                               pins = "gpio55", "gpio56";
>>> +                               drive-strength = <2>;
>>> +                               bias-disable;
>>> +                       };
>>> +               };
>>> +
>>> +               qup-i2c10-sleep {
>>> +                       pinconf {
>>> +                               pins = "gpio55", "gpio56";
>>> +                               bias-pull-up;
>>
>> Are you sure that you want pullups enabled for sleep here?  There are
>> external pulls on this line (as there are on many i2c busses) so doing
>> this will double-enable pulls.  It probably won't hurt, but I'm
>> curious if there's some sort of reason here.
>>
> 1. We need the lines to remain high to avoid slaves sensing a false
> start-condition (this can happen if the SDA goes down before SCL).
> 2. Disclaimer: I'm not a HW expert, but we were told that
> tri-state/bias-disabled lines can draw more current. I will find out
> more about that.

Agreed that they need to remain high, but you've got very strong
pullups external to the SoC.  Those will keep it high.  You don't need
the internal ones too.

As extra evidence that the external pullups _must_ be present on your
board: you specify bias-disable in the active state.  That can only
work if there are external pullups (or if there were some special
extra secret internal pullups that were part of geni).  i2c is an
open-drain bus and thus there must be pullups on the bus in order to
communicate.


>>> +                       };
>>> +               };
>>>         };
>>>  };
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> index 59334d9..9ef056f 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> @@ -209,6 +209,21 @@
>>>                                         pins = "gpio4", "gpio5";
>>>                                 };
>>>                         };
>>> +
>>> +                       qup_i2c10_default: qup-i2c10-default {
>>> +                               pinmux {
>>> +                                       function = "qup10";
>>> +                                       pins = "gpio55", "gpio56";
>>> +                               };
>>> +                       };
>>> +
>>> +                       qup_i2c10_sleep: qup-i2c10-sleep {
>>> +                               pinmux {
>>> +                                       function = "gpio";
>>> +                                       pins = "gpio55", "gpio56";
>>> +                               };
>>> +                       };
>>> +
>>>                 };
>>>
>>>                 timer@17c90000 {
>>> @@ -309,6 +324,20 @@
>>>                                 interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
>>>                                 status = "disabled";
>>>                         };
>>> +
>>> +                       i2c10: i2c@a88000 {
>>
>> Seems like it might be nice to add all the i2c busses into the main
>> sdm845.dtsi file.  Sure, most won't be enabled, but it seems like it
>> would avoid churn later.
>>
>> ...if you're sure you want to add only one i2c controller, subject of
>> this patch should indicate that.
>>
>
> Yes, we typically have a "platform(sdm845 here)-qupv3.dtsi" defining
> most of the serial-bus instances (i2c, spi, and uart with
> status=disabled) that we include from the common header. The boards
> enable instances they need.
> Will that be okay?

Unless you really feel the need to put these in a separate file I'd
just put them straight in sdm845.dtsi.  Yeah, it'll get big, but
that's OK by me.  I _think_ this matches what Bjorn was suggesting on
previous device tree patches, but CCing him just in case.  I'm
personally OK with whatever Bjorn and other folks with more Qualcomm
history would like.

...but yeah, I'm asking for them all to be listed with status="disabled".


-Doug
