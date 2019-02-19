From: "Sugaya, Taichi" <sugaya.taichi@socionext.com>
Subject: Re: [PATCH v2 13/15] ARM: dts: milbeaut: Add device tree set for the
 Milbeaut M10V board
Date: Tue, 19 Feb 2019 14:11:21 +0900
Message-ID: <ba5bb646-7fa6-e98f-4ac2-47c55c8f82ba@socionext.com>
References: <1549628920-32623-1-git-send-email-sugaya.taichi@socionext.com>
 <CAK8P3a15mLEgVAh1+jQ+GqOcQa0zhrePWofo8iGkTs5_bd=TmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a15mLEgVAh1+jQ+GqOcQa0zhrePWofo8iGkTs5_bd=TmQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,
Thank you for you comments.

On 2019/02/18 21:09, Arnd Bergmann wrote:
> On Fri, Feb 8, 2019 at 1:28 PM Sugaya Taichi
> <sugaya.taichi@socionext.com> wrote:
>> +
>> +       aliases {
>> +               serial1 = &uart1;
>> +       };
> 
> Maybe start with serial0 here? It seems unusual to start
> counting at 1.
> 

The M10V evaluation board(EVB) uses a console with uart ch1, so this 
alias number is derived from the used channel one.
Therefore it is no problem to change the alias number to 0.

>> +       chosen {
>> +               bootargs = "init=/sbin/finit rootwait earlycon";
> 
> The /sbin/finit argument seems user space specific, so you probably don't
> want this in the dts file but rather pass it from the boot loader.
> Possible drop the bootargs entirely.
> 

Okay, remove the arg from the dts and add to bootargs instead.

Thanks,
Sugaya Taichi

>       Arnd
> 
