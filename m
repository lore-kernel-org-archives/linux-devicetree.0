From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: dwapb: Add support for 32 interrupts
Date: Fri, 6 Apr 2018 11:57:19 +0200
Message-ID: <CAMuHMdX34f1pDCVqNV43_qtzqZ-fruOcUsUN_Ysz4ihJwe-56A@mail.gmail.com>
References: <1522246950-9110-1-git-send-email-phil.edworthy@renesas.com>
 <CAHp75VeOTjZ30ok1JOW0cefZfxqUM-f0-zpTnC5TonyeqQVUKg@mail.gmail.com> <TY1PR01MB1769064C77AE3E5ABA4993DAF5BB0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TY1PR01MB1769064C77AE3E5ABA4993DAF5BB0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michel Pollet <michel.pollet@bp.renesas.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Phil,

On Thu, Apr 5, 2018 at 11:42 AM, Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> On 30 March 2018 22:26 Andy Shevchenko wrote:
>> On Wed, Mar 28, 2018 at 5:22 PM, Phil Edworthy wrote:
>> > The DesignWare GPIO IP can be configured for either 1 or 32
>> > interrupts,
>>
>> 1 to 32, or just a choice between two?
> Just a choice of 1 or 32.
> Note that by 'configured' I am talking about the hardware being configured in
> RTL prior to manufacturing a device. Once made, you cannot change it.
> This configuration affects the number of output interrupt signals from the GPIO
> Controller block that are connected to an interrupt controller.

Differentiating between different versions of an IP block using DT properties
is usually a bad idea, for several reasons:
  - What if you discover another difference later?
  - You cannot add differentiating properties retroactively, because
of backwards
     compatibility with old DTBS.

Hence I think you should introduce a new compatible value instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
