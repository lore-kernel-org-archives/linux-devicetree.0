From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI
 config register
Date: Wed, 11 Sep 2019 09:19:48 -0600
Message-ID: <20190911151847.GA30053@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-6-ilina@codeaurora.org>
 <CACRpkdaReFzjb_hcDbQwqMX+whzscLpeZpJPHKqOo+9tANzemA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaReFzjb_hcDbQwqMX+whzscLpeZpJPHKqOo+9tANzemA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Evan Green <evgreen@chromium.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, mkshah@codeaurora.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 11 2019 at 04:05 -0600, Linus Walleij wrote:
>On Thu, Aug 29, 2019 at 8:47 PM Lina Iyer <ilina@codeaurora.org> wrote:
>
>> +- qcom,scm-spi-cfg:
>> +       Usage: optional
>> +       Value type: <bool>
>> +       Definition: Specifies if the SPI configuration registers have to be
>> +                   written from the firmware.
>> +
>>  Example:
>>
>>         pdc: interrupt-controller@b220000 {
>>                 compatible = "qcom,sdm845-pdc";
>> -               reg = <0xb220000 0x30000>;
>> +               reg = <0xb220000 0x30000>, <0x179900f0 0x60>;
>>                 qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
>>                 #interrupt-cells = <2>;
>>                 interrupt-parent = <&intc>;
>>                 interrupt-controller;
>> +               qcom,scm-spi-cfg;
>
>You can probably drop this bool if you just give names to the registers.
>
>Like
>reg = <0xb220000 0x30000>, <0x179900f0 0x60>;
>reg-names = "gic", "pdc";
>
>Then jus check explicitly for a "pdc" register and in that case
>initialize the PDC.
>
Well the address remains the same. The bool defines how to access that
register address - from linux or from the firmware using SCM calls. But
I get your point, I could have different register namess - pdc-linux or
pdc-scm and request by name. I can then use that to determine the mode
for accessing the register.

Thanks,
Lina
