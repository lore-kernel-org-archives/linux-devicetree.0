From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] gpio - Add EXAR XRA1403 SPI GPIO expander driver
Date: Fri, 31 Mar 2017 07:38:01 -0500
Message-ID: <20170331123801.tqpbgllqvnlubaq2@rob-hp-laptop>
References: <cover.1490595641.git.nandor.han@ge.com>
 <6bf04ba1761f0692cb461558f0c8836f0d1f7ad8.1490595641.git.nandor.han@ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6bf04ba1761f0692cb461558f0c8836f0d1f7ad8.1490595641.git.nandor.han@ge.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Nandor Han <nandor.han@ge.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Semi Malinen <semi.malinen@ge.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 27, 2017 at 09:23:00AM +0300, Nandor Han wrote:
> This is a simple driver that provides a /sys/class/gpio
> interface for controlling and configuring the GPIO lines.
> It does not provide support for chip select or interrupts.
> 
> Signed-off-by: Nandor Han <nandor.han@ge.com>
> Signed-off-by: Semi Malinen <semi.malinen@ge.com>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +

This should go with the binding patch or by itself.

>  drivers/gpio/Kconfig                               |   5 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-xra1403.c                        | 252 +++++++++++++++++++++
>  4 files changed, 259 insertions(+)
>  create mode 100644 drivers/gpio/gpio-xra1403.c
