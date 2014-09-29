From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/6] Documentation: DT: Add bindings for Spreadtrum serial
Date: Mon, 29 Sep 2014 15:39:23 +0200
Message-ID: <5399512.qxHSYW7FgQ@wuerfel>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com> <1411992293-7729-2-git-send-email-zhang.lyra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411992293-7729-2-git-send-email-zhang.lyra@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zhang.lyra@gmail.com
Cc: catalin.marinas@arm.com, gregkh@linuxfoundation.org, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, galak@codeaurora.org, broonie@linaro.org, mark.rutland@arm.com, m-karicheri2@ti.com, pawel.moll@arm.com, artagnon@gmail.com, rrichter@cavium.com, robh+dt@kernel.org, will.deacon@arm.com, orsonzhai@gmail.com, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "chunyan.zhang" <chunyan.zhang@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

On Monday 29 September 2014 20:04:48 zhang.lyra@gmail.com wrote:
> diff --git a/Documentation/devicetree/bindings/serial/of-serial.txt b/Documentation/devicetree/bindings/serial/of-serial.txt
> index 7705477..a0bb1d1 100644
> --- a/Documentation/devicetree/bindings/serial/of-serial.txt
> +++ b/Documentation/devicetree/bindings/serial/of-serial.txt
> @@ -14,6 +14,7 @@ Required properties:
>         - "altr,16550-FIFO32"
>         - "altr,16550-FIFO64"
>         - "altr,16550-FIFO128"
> +       - "sprd,serial"
>         - "serial" if the port type is unknown.
>  - reg : offset and length of the register set for the device.
>  - interrupts : should contain uart interrupt.
> 

This file is really only for 8250 compatible UART implementations, please
add a new file with a proper binding for your serial port. It would be
nice if you could rename this file to 8250.txt to avoid confusing the
next person.

Please also add the "sprd" prefix to
Documentation/devicetree/bindings/vendor-prefixes.txt

	Arnd
