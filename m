From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH anybus v1 2/4] dt-bindings: anybus-bridge: document
 devicetree binding.
Date: Thu, 25 Oct 2018 12:16:32 +0200
Message-ID: <CACRpkdbXPWH4FS5205ML0UmuATuZf087Y6ueVUdp_Lfc5Nu8Hw@mail.gmail.com>
References: <20181024142456.10084-1-svendev@arcx.com> <20181024142456.10084-3-svendev@arcx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024142456.10084-3-svendev@arcx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, john.garry@huawei.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, yuanzhichang@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Sven,

thanks for your patch!

On Wed, Oct 24, 2018 at 4:25 PM Sven Van Asbroeck <svendev@arcx.com> wrote:

> +  - pwms : the pwm connected to the bridge's 'pwm input'.

That is really unintuitive and needs a detailed explanation. What
is a bridge doing with a PWM? Is it 100% certain this is a PWM,
it's not just a .... clock? A pwm is a pule WIDTH modulator and
I can't for my life understand why a bus bridge needs a signal
with variable pulse width, but surprise me! :D

> +               fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
> +                               0x00000000 0xa0000240 0x00000000>;

Is it just a copy/paste from
Documentation/devicetree/bindings/bus/imx-weim.txt
leftover?

It was mentioned as undocumented but it is also pretty terse
with these opaque hex numbers. I would never let the
Freescale binding pass if I was reviewing it.

Look at my bindings for Qualcomm EBI in
Documentation/devicetree/bindings/bus/qcom,ebi2.txt
for example.

But maybe it's not even supposed to be there.

Yours,
Linus Walleij
