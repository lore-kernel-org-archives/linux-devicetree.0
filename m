From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARC: dts: Remove leading 0x from node unit addresses
Date: Tue, 19 Jun 2018 08:09:13 +0200
Message-ID: <CAJKOXPdXv0449yHmsw9w4ASnjkwm2tF5hLc_F3VjvopD7LbJmQ@mail.gmail.com>
References: <20180618191645.15247-1-krzk@kernel.org> <8268db75d4698a4fba9aa11de7e8f6d6f20a0515.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8268db75d4698a4fba9aa11de7e8f6d6f20a0515.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vineet Gupta <vgupta@synopsys.com>, Alexey Brodkin <abrodkin@synopsys.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 18 June 2018 at 22:07, Joe Perches <joe@perches.com> wrote:
> On Mon, 2018-06-18 at 21:16 +0200, Krzysztof Kozlowski wrote:
>> Remove leading 0x from all node unit addresses with a sed command:
>>
>>     sed -E -i -e "s/@0x([0-9a-fA-F\.]+)\s?\{/@\L\1 \{/g" arch/arc/boot/dts/*.dts*
>>
>> This fixes DTC warnings like:
>>
>>     Warning (unit_address_format): /cpu_card/dw-apb-gpio@0x2000: unit name should not have leading "0x"
>
> Do all of these need fixing?
>
> Aren't there dozens of these in arch/arm and elsewhere too?

Yeah, all of them need fixing too... and now I found patch from
Mathieu doing this for Arc:
https://patchwork.kernel.org/patch/10112715/
He also sent patches for other archs.

This patch can be ignored then.

Best regards,
Krzysztof
