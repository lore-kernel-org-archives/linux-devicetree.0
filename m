From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v5 33/44] ARM: davinci: switch to common clock framework
Date: Thu, 18 Jan 2018 20:56:25 +0530
Message-ID: <6a694c9e-243a-5fce-03fa-989d8bb783d2@ti.com>
References: <1515378238-23105-1-git-send-email-david@lechnology.com>
 <1515378238-23105-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515378238-23105-4-git-send-email-david@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 08 January 2018 07:53 AM, David Lechner wrote:
> diff --git a/arch/arm/mach-davinci/Makefile b/arch/arm/mach-davinci/Makefile
> index 4e81780..8a8f413 100644
> --- a/arch/arm/mach-davinci/Makefile
> +++ b/arch/arm/mach-davinci/Makefile
> @@ -5,7 +5,7 @@
>  #
>  
>  # Common objects
> -obj-y 			:= time.o clock.o serial.o psc.o \
> +obj-y 			:= time.o serial.o \
>  			   usb.o common.o sram.o aemif.o

The line break seems too early now.

Thanks,
Sekhar
