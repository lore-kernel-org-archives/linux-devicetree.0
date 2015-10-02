From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 4/6] pinctrl: freescale: imx: add shared input select
 reg support
Date: Fri, 2 Oct 2015 14:39:02 -0700
Message-ID: <CACRpkdZOoBBo9=yWfHWXjxL0ipgFFJAPXBsYDvHK693+FAX9cA@mail.gmail.com>
References: <1443215162-13716-1-git-send-email-aalonso@freescale.com>
	<1443215162-13716-4-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1443215162-13716-4-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?B?5p2O5pm6?= <lznuaa@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "Anson.Huang@freescale.com" <Anson.Huang@freescale.com>, Frank Li <Frank.Li@freescale.com>, yibin.gong@freescale.com, nitin.garg@freescale.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 25, 2015 at 2:06 PM, Adrian Alonso <aalonso@freescale.com> wrote:

> - Add shared input select register support
> - imx7d has two iomux controllers iomuxc and iomuxc-lpsr
>   which share select_input register for daisy chain settings
>
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>
> ---
> Changes for V2: Resend
> Changes for V3:
> - Use of_parse_phandle instead of of_get_child_by_name to get input select
>   base register address
> Changes for V4: Resend
> Changes for V5:
> - Remove SHARE_INPUT_SELECT_REG flag
> - Use fsl,input-sel to check if shared input select register support is used
> Changes for V6: Resend

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
