From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: ux500: Move ab8500 nodes to ste-ab8500.dtsi
Date: Thu, 22 Aug 2019 17:15:06 +0200
Message-ID: <CACRpkdY=XS4RMufBy8GCB1wGU+hwa64sFMprE-94TcT06xAZgg@mail.gmail.com>
References: <20190822110720.118828-1-stephan@gerhold.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822110720.118828-1-stephan@gerhold.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 1:08 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> Some Ux500 devices use the newer AB8505 PMIC instead of AB8500.
> Although they are very similar, there are subtle differences
> like the number of regulators or the available GPIO pins.
>
> At the moment, ste-dbx5x0.dtsi always configures the AB8500 PMIC.
> To support devices with AB8505, it is necessary to split the
> AB8500-specific parts into a separate .dtsi file. Boards can then
> select the PMIC by including either ste-ab8500.dtsi or ste-ab8505.dtsi.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Patch applied to the Ux500 tree!

Thanks!
Linus Walleij
