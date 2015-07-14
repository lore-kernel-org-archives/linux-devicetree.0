From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 5/8] ARM: dts: add i.mx6ul pin function include file
Date: Tue, 14 Jul 2015 09:53:02 +0200
Message-ID: <CACRpkdbwHD02QMxrOH4hM3FuiWiLVPrmTW7XOPbjijK4L8Adew@mail.gmail.com>
References: <1434727951-4852-1-git-send-email-Frank.Li@freescale.com>
	<1434727951-4852-6-git-send-email-Frank.Li@freescale.com>
	<CACRpkdbgKhXgcnncrHKDPC1hC1QEdhTyxFH61J4vG8ftoasHPQ@mail.gmail.com>
	<20150714011617.GA3264@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150714011617.GA3264@tiger>
Sender: linux-gpio-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Frank.Li@freescale.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bai Ping <b51503@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?5p2O5pm6?= <lznuaa@gmail.com>, Anson Huang <b20788@freescale.com>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 14, 2015 at 3:16 AM, Shawn Guo <shawnguo@kernel.org> wrote:
> On Mon, Jul 13, 2015 at 10:40:57PM +0200, Linus Walleij wrote:
>> On Fri, Jun 19, 2015 at 5:32 PM,  <Frank.Li@freescale.com> wrote:
>>
>> > From: Frank Li <Frank.Li@freescale.com>
>> >
>> > add pin mux define file
>> >
>> > Signed-off-by: Bai Ping <b51503@freescale.com>
>> > Signed-off-by: Anson Huang <b20788@freescale.com>
>> > Signed-off-by: Frank Li <Frank.Li@freescale.com>
>>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Are you taking this through the ARM SoC tree?
>
> Yes, I plan to take it via IMX tree.

OK awesome. I put the pinctrl subdriver patch into the pinctrl
tree, it should work to merge them orthogonally, if you see any
problems then tell me.

Yours,
Linus Walleij
