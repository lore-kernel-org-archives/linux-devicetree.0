From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/3] gpio: Add Spreadtrum PMIC EIC driver support
Date: Tue, 27 Mar 2018 15:52:28 +0200
Message-ID: <CACRpkdYF_dBi27jHEsO52SZs3sYR9JG_+ZDpH8bmDZ5ew4uskA@mail.gmail.com>
References: <787c9f115db06390549bfee366b7f70faf312286.1520218279.git.baolin.wang@linaro.org>
 <c84c05b6619a17848a11335f881f42153a4e51c0.1520218279.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c84c05b6619a17848a11335f881f42153a4e51c0.1520218279.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 5, 2018 at 3:56 AM, Baolin Wang <baolin.wang@linaro.org> wrote:

> The Spreadtrum PMIC EIC controller contains only one bank of debounce EIC,
> and this bank contains 16 EICs. Each EIC can only be used as input mode,
> as well as supporting the debounce and the capability to trigger interrupts
> when detecting input signals.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes since v2:
>  - Fix coding style issue.
>  - Fix possible overflow.
>  - Use for_each_set_bit().

Patch applied!

Also added Andy's review tag on all of the patches.

Yours,
Linus Walleij
