From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: pwrseq: add support for Marvell SD8787 chip
Date: Mon, 28 Nov 2016 16:54:58 +0100
Message-ID: <CAPDyKFr=TE+EuZ9rZV3ygsjBFN_mRrE2imkFa-wQs_ykM5d+cQ@mail.gmail.com>
References: <1479434109-8745-1-git-send-email-matt@ranostay.consulting> <20161128141513.agnkyz6ronigbukn@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <20161128141513.agnkyz6ronigbukn@rob-hp-laptop>
Sender: linux-mmc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Matt Ranostay <matt@ranostay.consulting>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

[...]

>> +
>> +Example:
>> +
>> +     wifi_pwrseq: wifi_pwrseq {
>> +             compatible = "mmc-pwrseq-sd8787";
>> +             pwrdn-gpio = <&twl_gpio 0 GPIO_ACTIVE_LOW>;
>> +             reset-gpio = <&twl_gpio 1 GPIO_ACTIVE_LOW>;
>> +     }
>> diff --git a/Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt b/Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt
>> index c421aba0a5bc..08fd65d35725 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt
>> @@ -32,6 +32,9 @@ Optional properties:
>>                so that the wifi chip can wakeup host platform under certain condition.
>>                during system resume, the irq will be disabled to make sure
>>                unnecessary interrupt is not received.
>> +  - vmmc-supply: a phandle of a regulator, supplying VCC to the card
>
> This is why pwrseq is wrong. You have some properties in the card node
> and some in pwrseq node. Everything should be in the card node.

Put "all" in the card node, just doesn't work for MMC. Particular in
cases when we have removable cards, as then it would be wrong to have
a card node.

The mmc pwrseq DT bindings just follows the legacy approach for MMC
and that's why the pwrseq handle is at the controller node. Yes, would
could have done it differently, but this is the case now, so we will
have to accept that.

[...]

Kind regards
Uffe
