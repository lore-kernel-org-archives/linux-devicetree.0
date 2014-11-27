From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [glikely:devicetree/next 40/44] drivers/tty/serial/8250/8250_early.c:49:3:
 error: implicit declaration of function 'ioread32be'
Date: Thu, 27 Nov 2014 17:32:06 +0000
Message-ID: <CACxGe6tYc7-HCqrQ-H1jgVVk=kowVd0sy2tg7oCzTTSvyJochg@mail.gmail.com>
References: <201411272359.6wg3lvlX%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201411272359.6wg3lvlX%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kevin,

Unfortunately it looks like m32r doesn't have the io{read,write}32be
accessors. I don't know if any other architechture is affected by
that, but I've dropped the series from my tree for the time being.
There will need to be a solution, either to added the accessors to
m32r, or to not build that code if the accessors aren't there.

g.

On Thu, Nov 27, 2014 at 3:40 PM, kbuild test robot
<fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux devicetree/next
> head:   5dc5a90285d8b0c0e86323c93afea80e833e49fb
> commit: afc7b7e1a610044f7806956ac8a5c6b491bca859 [40/44] serial: 8250: Add support for big-endian MMIO accesses
> config: m32r-usrv_defconfig (attached as .config)
> reproduce:
>   wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>   chmod +x ~/bin/make.cross
>   git checkout afc7b7e1a610044f7806956ac8a5c6b491bca859
>   # save the attached .config to linux build tree
>   make.cross ARCH=m32r
>
> All error/warnings:
>
>    drivers/tty/serial/8250/8250_early.c: In function 'serial8250_early_in':
>>> drivers/tty/serial/8250/8250_early.c:49:3: error: implicit declaration of function 'ioread32be' [-Werror=implicit-function-declaration]
>       return ioread32be(port->membase + (offset << 2));
>       ^
>    drivers/tty/serial/8250/8250_early.c: In function 'serial8250_early_out':
>>> drivers/tty/serial/8250/8250_early.c:67:3: error: implicit declaration of function 'iowrite32be' [-Werror=implicit-function-declaration]
>       iowrite32be(value, port->membase + (offset << 2));
>       ^
>    cc1: some warnings being treated as errors
>
> vim +/ioread32be +49 drivers/tty/serial/8250/8250_early.c
>
>     43          switch (port->iotype) {
>     44          case UPIO_MEM:
>     45                  return readb(port->membase + offset);
>     46          case UPIO_MEM32:
>     47                  return readl(port->membase + (offset << 2));
>     48          case UPIO_MEM32BE:
>   > 49                  return ioread32be(port->membase + (offset << 2));
>     50          case UPIO_PORT:
>     51                  return inb(port->iobase + offset);
>     52          default:
>     53                  return 0;
>     54          }
>     55  }
>     56
>     57  void __weak __init serial8250_early_out(struct uart_port *port, int offset, int value)
>     58  {
>     59          switch (port->iotype) {
>     60          case UPIO_MEM:
>     61                  writeb(value, port->membase + offset);
>     62                  break;
>     63          case UPIO_MEM32:
>     64                  writel(value, port->membase + (offset << 2));
>     65                  break;
>     66          case UPIO_MEM32BE:
>   > 67                  iowrite32be(value, port->membase + (offset << 2));
>     68                  break;
>     69          case UPIO_PORT:
>     70                  outb(value, port->iobase + offset);
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
