From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V12 1/2] gpio: add DT binding doc for gpio of PMIC max77620/max20024
Date: Tue, 24 May 2016 13:07:20 +0200
Message-ID: <CACRpkdbtZDVn1DauxOPP5kMy+0TLCWCYxvaeCCZOw14nvXgfdg@mail.gmail.com>
References: <1463116755-30469-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463116755-30469-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 13, 2016 at 7:19 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Maxim Semiconductor's PMIC MAX77620/MAX20024 has 8 GPIO pins
> which act as GPIO as well as special function mode.
>
> Add DT binding document to support these pins in GPIO
> mode via GPIO framework.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> ---
> This as part of the max77620 series and mfd patch are already applied.
> This can go in subsystem branch.

Patch applied to the GPIO tree.

Yours,
Linus Walleij
