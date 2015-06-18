From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 0/2] mfd: flexcom: add a driver for Flexcom
Date: Thu, 18 Jun 2015 15:09:45 +0200
Message-ID: <20150618150945.5cc698be@bbrezillon>
References: <cover.1434632230.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1434632230.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 18 Jun 2015 15:05:08 +0200
Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:

> ChangeLog
> 
> v2:
> - enhance the documentation of DT bindings and change the way the "ranges"
>   property is used.
> - replace __raw_readl() and __raw_writel() by readl() and writel().
> - change the module license to "GPL" for v2 or later
> - print the selected flexcom mode after the hardware version
> 
> v1:
> This series of patches a support to the Atmel Flexcom, a wrapper which
> integrates an USART, a SPI controller and a TWI controller. Only one
> peripheral can be used at a time. The active function is selected though
> the Flexcom Mode Register.

For the whole series,

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> 
> Cyrille Pitchen (2):
>   mfd: devicetree: add bindings for Atmel Flexcom
>   mfd: flexcom: add a driver for Atmel Flexible Serial Communication
>     Unit
> 
>  .../devicetree/bindings/mfd/atmel-flexcom.txt      | 58 +++++++++++++
>  drivers/mfd/Kconfig                                | 11 +++
>  drivers/mfd/Makefile                               |  1 +
>  drivers/mfd/atmel-flexcom.c                        | 97 ++++++++++++++++++++++
>  4 files changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
>  create mode 100644 drivers/mfd/atmel-flexcom.c
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
