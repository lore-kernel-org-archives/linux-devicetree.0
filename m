From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 4/7] pinctrl: freescale: imx: allow mux_reg offset zero
Date: Fri, 2 Oct 2015 14:42:05 -0700
Message-ID: <CACRpkdazoSnxv3UGnneuvEcNV5EZ7W-1M15YheSq5-fydi21Vg@mail.gmail.com>
References: <1443629469-12294-1-git-send-email-aalonso@freescale.com>
	<1443629469-12294-4-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1443629469-12294-4-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?B?5p2O5pm6?= <lznuaa@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "Anson.Huang@freescale.com" <Anson.Huang@freescale.com>, Frank Li <Frank.Li@freescale.com>, yibin.gong@freescale.com, nitin.garg@freescale.com, Dong Aisheng <Aisheng.Dong@freescale.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 30, 2015 at 9:11 AM, Adrian Alonso <aalonso@freescale.com> wrote:

> Allow mux_reg offset zero to be a valid pin_id, on imx7d
> mux_conf reg offset is zero for iomuxc-lspr controller
>
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>
> ---
> Changes for V2: Resend
> Changes for V3: Resend
> Changes for V4: Simplify pin_id assigment when ZERO_OFFSET_VALID is set
> Changes for V5:
> - Drop patch pinctrl: freescale: imx: add ZERO_OFFSET_VALID flag
> - Allow mux_reg ZERO OFFSET as pin_id
> Changes for V6: Restore ZERO_OFFSET_VALID flag
> Changes for V7: Resend
> Changes for V8: Resend

Ugh patches come out quickly. I see this is identical to the
v6 I applied so keeping the applied version.

Yours,
Linus Walleij
