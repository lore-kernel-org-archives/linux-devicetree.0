From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v2 5/5] tty/serial: Add earlycon support for Spreadtrum
 serial driver
Date: Sat, 18 Oct 2014 22:06:15 +0100
Message-ID: <20141018220615.33643542@alan.etchedpixels.co.uk>
References: <sprd-1017-v2>
	<1413539665-11484-1-git-send-email-chunyan.zhang@spreadtrum.com>
	<1413539665-11484-6-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413539665-11484-6-git-send-email-chunyan.zhang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: catalin.marinas@arm.com, gregkh@linuxfoundation.org, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, galak@codeaurora.org, broonie@linaro.org, mark.rutland@arm.com, m-karicheri2@ti.com, pawel.moll@arm.com, artagnon@gmail.com, rrichter@cavium.com, robh+dt@kernel.org, will.deacon@arm.com, orsonzhai@gmail.com, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sprdlinux@freelists.org
List-Id: devicetree@vger.kernel.org

On Fri, 17 Oct 2014 17:54:25 +0800
Chunyan Zhang <chunyan.zhang@spreadtrum.com> wrote:

> Add serial driver for spreadtrum sharkl platform with earlycon
> support at first.

> +#define UART_TXD	0x0000
> +#define UART_RXD	0x0004
> +#define UART_STS0	0x0008
> +#define UART_STS1	0x000C
> +#define UART_IEN	0x0010
> +#define UART_ICLR	0x0014
> +#define UART_CTL0	0x0018
> +#define UART_CTL1	0x001C
> +#define UART_CTL2	0x0020
> +#define UART_CLKD0	0x0024
> +#define UART_CLKD1	0x0028
> +#define UART_STS2	0x002C
> +
> +/*line status */
> +#define UART_LSR_TX_OVER	(0x1<<15)

Given we use UART_ for all the 8250 defines it might be better to use
something else - SHARK_LSR_TX_OVER etc to avoid future confusion

> +static void serial_sprd_putc(struct uart_port *port, int c)
> +{
> +	while (!(readl(port->membase + UART_STS0) & UART_LSR_TX_OVER))
> +		;
> +	writeb(c, port->membase + UART_TXD);
> +}
> +
> +static void serial_sprd_early_write(struct console *con, const char *s,
> +				    unsigned n)
> +{
> +	struct earlycon_device *dev = con->data;
> +
> +	uart_console_write(&dev->port, s, n, serial_sprd_putc);
> +}
> +
> +static int __init serial_sprd_early_console_setup(
> +				struct earlycon_device *device,
> +				const char *opt)
> +{
> +	if (!device->port.membase)
> +		return -ENODEV;
> +
> +	device->con->write = serial_sprd_early_write;
> +	return 0;
> +}

This seems fine but it would be useful to see both the earlycon and the
main uart/console driver and how they fit together.

Alan
