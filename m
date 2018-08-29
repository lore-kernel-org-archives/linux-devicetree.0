From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/5] Add Actions Semi S700 pinctrl support
Date: Wed, 29 Aug 2018 09:35:38 +0200
Message-ID: <CACRpkda=q+LZMUN5xJ777ZGWxYRBdZTvG0naNqr5BoLnVQ1=aA@mail.gmail.com>
References: <0180729200038.11795-1-sravanhome@gmail.com> <20180731194743.13678-1-sravanhome@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180731194743.13678-1-sravanhome@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sravanhome@gmail.com
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, pn@denx.de, mp-cs@actions-semi.com, Jeff Chen <jeff.chen@actions-semi.com>, "Thomas C. Liau" <thomas.liau@actions-semi.com>, linux@cubietech.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 31, 2018 at 9:48 PM Saravanan Sekar <sravanhome@gmail.com> wrote:

> This patchset adds pinctrl support for Actions Semi S700 SoC.
> Pinmux functions are only accessible for pin groups while pinconf
> parameters are available for both pin groups and individual pins.
>
> pinctrl driver is verified using the Cubieboard7.
>
> common functionalities from s900 is moved for all Actions Semi
> SoC's usage.
> Common pad control configurations are moved to SoC specific
>
> dts entry for pinctrl depends on clock driver which is still under review:
> https://patchwork.kernel.org/patch/10533959/

So what is the status of this patch set?

I am happy to apply it once you have the right buildtime dependencies
and Manivannan's ACK on the patch set! (Looks good to me.)

Maybe you want to rebase on v4.19-rc1 and resend as v5 before
I do that though?

Yours,
Linus Walleij
