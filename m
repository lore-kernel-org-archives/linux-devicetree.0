From: "Sugaya, Taichi" <sugaya.taichi@socionext.com>
Subject: Re: [PATCH v2 11/15] dt-bindings: pinctrl: milbeaut: Add Milbeaut
 M10V pinctrl description
Date: Wed, 13 Feb 2019 14:10:51 +0900
Message-ID: <00b70c95-362c-e286-a7cf-1b38d6de7993@socionext.com>
References: <1549629187-3177-1-git-send-email-sugaya.taichi@socionext.com>
 <CACRpkdYgTWffL3RcW7Xs7ve=9HhYyndth7RDX7sedeXytCZC1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYgTWffL3RcW7Xs7ve=9HhYyndth7RDX7sedeXytCZC1g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

Thank you for your comments.

On 2019/02/08 22:32, Linus Walleij wrote:
> Hi Sugaya,
> 
> thanks for your patch!
> 
> On Fri, Feb 8, 2019 at 1:32 PM Sugaya Taichi
> <sugaya.taichi@socionext.com> wrote:
> 
>> Add DT bindings document for Milbeaut M10V pinctrl.
>>
>> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
> 
> (...)
>> +- interrupts: three interrupts specifer.
>> +- interrupt-names: corresponds "interrupts" factor.
> (...)
>> +               interrupts = <0 54 4>, <0 55 4>, <0 56 4>, <0 57 4>,
>> +                               <0 58 4>, <0 59 4>, <0 60 4>, <0 61 4>,
>> +                               <0 62 4>, <0 63 4>, <0 64 4>, <0 65 4>,
>> +                               <0 66 4>, <0 67 4>, <0 68 4>, <0 69 4>;
>> +               interrupt-names = "pin-48", "pin-49", "pin-50", "pin-51",
>> +                               "pin-52", "pin-53", "pin-54", "pin-55",
>> +                               "pin-56", "pin-57", "pin-58", "pin-59",
>> +                               "pin-60", "pin-61", "pin-62", "pin-63";
> 
> As mentioned in the review of the driver, don't do this.
> 
> This is a hierarchical interrupt controller, so these
> GIC-offset-to-GPIO-interrupt-offests should be hardcoded in
> the driver.
> 
> If these interrupt offsets differ between difference instances of
> this pin controller, they should have different compatible strings.
> 
> Yours,
> Linus Walleij
> 

I understand.
I am sure the content of bindings will change as a whole as driver changes.
Try it.

Thanks,
Sugaya Taichi
