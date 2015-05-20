From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1] ARM: dts: nitrogen6x: add CAN support
Date: Wed, 20 May 2015 19:26:18 -0300
Message-ID: <CAOMZO5Cazk3TGSF1c4pt0WhY2stmJzHWfTyySnf_NyHxaAfgDA@mail.gmail.com>
References: <1432158569-4415-1-git-send-email-ps.report@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432158569-4415-1-git-send-email-ps.report@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Seiderer <ps.report@gmx.net>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 20, 2015 at 6:49 PM, Peter Seiderer <ps.report@gmx.net> wrote:

> +               pinctrl_can1_1: can1grp-1 {
> +                       fsl,pins = <
> +                               MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX 0x80000000
> +                               MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX 0x80000000

Better not to pass 0x80000000. Use the real PAD settings instead.
