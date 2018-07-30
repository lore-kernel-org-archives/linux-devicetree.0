From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 1/2] MIPS: mscc: ocelot: add interrupt controller
 properties to GPIO controller
Date: Mon, 30 Jul 2018 10:35:22 -0700
Message-ID: <20180730173521.fr6be2kw7irk5jbp@pburton-laptop>
References: <20180725122621.31713-1-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180725122621.31713-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, ralf@linux-mips.org, jhogan@kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

Hi Quentin,

On Wed, Jul 25, 2018 at 02:26:20PM +0200, Quentin Schulz wrote:
> The GPIO controller also serves as an interrupt controller for events
> on the GPIO it handles.
> 
> An interrupt occurs whenever a GPIO line has changed.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  arch/mips/boot/dts/mscc/ocelot.dtsi | 3 +++
>  1 file changed, 3 insertions(+)

Thanks - applied to mips-next for 4.19.

Paul
