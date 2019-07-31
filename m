Return-Path: <SRS0=P7Yg=V4=gmail.com=open.sudheer@kernel.org>
MIME-Version: 1.0
References: <1564147640-30753-1-git-send-email-open.sudheer@gmail.com>
 <1564147640-30753-2-git-send-email-open.sudheer@gmail.com> <20190730154759.GA26425@kroah.com>
In-Reply-To: <20190730154759.GA26425@kroah.com>
From: sudheer v <open.sudheer@gmail.com>
Date: Wed, 31 Jul 2019 17:06:08 +0530
Message-ID: <CAE-5=DQ8p9WAhjrmZ8ye8GjoHrcxkHkjJPRNRFtvgeF5SdqwVQ@mail.gmail.com>
Subject: Re: [patch v4 1/5] AST2500 DMA UART driver
Content-Type: multipart/alternative; boundary="000000000000acaa3c058ef888c9"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, ShivahShankar Shakarnarayan rao <shivahshankar.shankarnarayanrao@aspeedtech.com>, Sudheer V <sudheer.veliseti@aspeedtech.com>, sudheer veliseti <sudheer.open@gmail.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-ID: <devicetree@vger.kernel.org>

--000000000000acaa3c058ef888c9
Content-Type: text/plain; charset="UTF-8"

Hi  Greg,
 After modifying [ patch v4 1/5 ] , should i submit whole patchset as  v5 ?
 or replying  with this single patch modified will be enough?
 how is this done in linux community ?.

Regards
Sudheer

On Tue, Jul 30, 2019 at 9:18 PM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Jul 26, 2019 at 06:57:16PM +0530, sudheer.v wrote:
> > From: sudheer veliseti <sudheer.open@gmail.com>
> >
> > UART driver for Aspeed's bmc chip AST2500
> >
> > Design approch:
> > AST2500 has dedicated Uart DMA controller which has 12 sets of Tx and RX
> channels
> > connected to UART controller directly.
> > Since the DMA controller have dedicated buffers and registers,
> > there would be little benifit in adding DMA framework overhead.
> > So the software for DMA controller is included within the UART driver
> itself.
> >
> > implementation details:
> > 'struct ast_uart_port' is populated and registered with uart_core.
> > code is organised into two layers UART-layer and DMA-Layer,both of them
> are
> > in the same file.UART-layer requests Rx and Tx dma channels
> > and registers callbacks with DMA controller software Layer
> > Interrupt service routine for DMA controller is the crucial one for
> Handling all
> > the tx and rx data. ISRs installed for individual uarts are just
> dummy,and are helpful
> > only to report any spurious interrupts in hardware.
> >
> >
> > Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
> > ---
> >
> > Changes from v3->v4:
> > - per port uart structures are registerd directly with uart core
> >   Instead of registering through 8250 Frame work,
> >   ast_uart_port is registered using uart_add_one_port
> > -SDMA_RX_FIX macro replaced with CONFIG_AST_UART_DMA_RX_INTERRUPT
> > -ast_uart_sdma_isr : DMA interrupt handler code is improvised
> > -replaced pr_debug with ftrace wherever appropriate
> > -dev_err is used in all error return cases
> > -uart driver structure ast25xx_uart_reg is modified
> > -driver name changed to ast2500-uart-dma-drv
> > -rx_timer initialisation and callback fn modified
> >
> > Changes from v2->v3:
> > -custom debug replaced by in kerenl dynamic debug: pr_debug
> > -change-logs added
> >
> >
> > .../tty/serial/8250/8250_ast2500_uart_dma.c   | 1901 +++++++++++++++++
> >  1 file changed, 1901 insertions(+)
> >  create mode 100644 drivers/tty/serial/8250/8250_ast2500_uart_dma.c
> >
> > diff --git a/drivers/tty/serial/8250/8250_ast2500_uart_dma.c
> b/drivers/tty/serial/8250/8250_ast2500_uart_dma.c
> > new file mode 100644
> > index 000000000000..bc830d605372
> > --- /dev/null
> > +++ b/drivers/tty/serial/8250/8250_ast2500_uart_dma.c
> > @@ -0,0 +1,1901 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + *  DMA UART Driver for ASPEED BMC chip: AST2500
> > + *
> > + *  Copyright (C) 2019 sudheer Kumar veliseti, Aspeed technology Inc.
> > + *  <open.sudheer@gmail.com>
>
> What was the copyright on the file you copied?  Please properly
> attribute that here.
>
>
> > + *
> > + */
> > +#include <linux/clk.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/tty.h>
> > +#include <linux/tty_flip.h>
> > +#include "8250.h"
> > +
> > +#define SERIAL8250_CONSOLE NULL
> > +#define TTY_AST_MAJOR 204
> > +#define TTY_AST_MINOR 68
>
> Where did you get this minor number from?
>
> > +
> > +#define DMA_BUFF_SIZE                0x1000
> > +#define SDMA_RX_BUFF_SIZE    0x10000
> > +#define PASS_LIMIT 256
> > +#define UART_DMA_NR CONFIG_AST_NR_DMA_UARTS
> > +#define AST_UART_SDMA_CH 12
> > +
> > +/* enum ast_uart_chan_op
> > + * operation codes passed to the DMA code by the user, and also used
> > + * to inform the current channel owner of any changes to the system
> state
> > + */
> > +enum ast_uart_chan_op {
> > +     AST_UART_DMAOP_TRIGGER,
> > +     AST_UART_DMAOP_STOP,
> > +     AST_UART_DMAOP_PAUSE,
> > +};
> > +
> > +/* ast_uart_dma_cbfn: buffer callback routinei type */
> > +typedef void (*ast_uart_dma_cbfn)(void *dev_id, u16 len);
> > +
> > +struct ast_sdma_info {
> > +     u8 ch_no;
> > +     u8 direction;
> > +     u8 enable;
> > +     void *priv;
> > +     char *sdma_virt_addr;
> > +     dma_addr_t dma_phy_addr;
> > +     /* cdriver callbacks */
> > +     ast_uart_dma_cbfn callback_fn; /* buffer done callback */
> > +};
> > +
> > +struct ast_sdma_ch {
> > +     struct ast_sdma_info tx_dma_info[AST_UART_SDMA_CH];
> > +     struct ast_sdma_info rx_dma_info[AST_UART_SDMA_CH];
> > +};
> > +
> > +struct ast_sdma {
> > +     void __iomem *reg_base;
> > +     int dma_irq;
> > +     struct ast_sdma_ch *dma_ch;
> > +     struct regmap *map;
> > +};
> > +
> > +#define UART_TX_SDMA_EN              0x00
> > +#define UART_RX_SDMA_EN              0x04
> > +#define UART_SDMA_CONF               0x08 /* Misc, Buffer size  */
> > +#define UART_SDMA_TIMER              0x0C
> > +#define UART_TX_SDMA_REST    0x20
> > +#define UART_RX_SDMA_REST    0x24
> > +#define UART_TX_SDMA_IER     0x30
> > +#define UART_TX_SDMA_ISR     0x34
> > +#define UART_RX_SDMA_IER     0x38
> > +#define UART_RX_SDMA_ISR     0x3C
> > +#define UART_TX_R_POINT(x)   (0x40 + ((x) * 0x20))
> > +#define UART_TX_W_POINT(x)   (0x44 + ((x) * 0x20))
> > +#define UART_TX_SDMA_ADDR(x) (0x48 + ((x) * 0x20))
> > +#define UART_RX_R_POINT(x)   (0x50 + ((x) * 0x20))
> > +#define UART_RX_W_POINT(x)   (0x54 + ((x) * 0x20))
> > +#define UART_RX_SDMA_ADDR(x) (0x58 + ((x) * 0x20))
> > +#define SDMA_CH_EN(x)                BIT(x)
> > +
> > +#define SDMA_TX_BUFF_SIZE_MASK       (0x3)
> > +#define SDMA_SET_TX_BUFF_SIZE(x)(x)
> > +#define SDMA_BUFF_SIZE_1KB   (0x0)
> > +#define SDMA_BUFF_SIZE_4KB   (0x1)
> > +#define SDMA_BUFF_SIZE_16KB  (0x2)
> > +#define SDMA_BUFF_SIZE_64KB  (0x3)
> > +#define SDMA_RX_BUFF_SIZE_MASK       (0x3 << 2)
> > +#define SDMA_SET_RX_BUFF_SIZE(x)((x) << 2)
> > +#define SDMA_TIMEOUT_DIS     BIT(4)
> > +
> > +#define UART_SDMA11_INT              BIT(11)
> > +#define UART_SDMA10_INT              BIT(10)
> > +#define UART_SDMA9_INT               BIT(9)
> > +#define UART_SDMA8_INT               BIT(8)
> > +#define UART_SDMA7_INT               BIT(7)
> > +#define UART_SDMA6_INT               BIT(6)
> > +#define UART_SDMA5_INT               BIT(5)
> > +#define UART_SDMA4_INT               BIT(4)
> > +#define UART_SDMA3_INT               BIT(3)
> > +#define UART_SDMA2_INT               BIT(2)
> > +#define UART_SDMA1_INT               BIT(1)
> > +#define UART_SDMA0_INT               BIT(0)
> > +
> > +/*
> > + * Configuration:
> > + *   share_irqs - whether we pass IRQF_SHARED to request_irq().
> > + *   This option is unsafe when used on edge-triggered interrupts.
> > + */
> > +static unsigned int share_irqs = SERIAL8250_SHARE_IRQS;
> > +
> > +static unsigned int nr_uarts = CONFIG_AST_RUNTIME_DMA_UARTS;
> > +
> > +struct ast_uart_port {
> > +     struct uart_port port;
> > +     unsigned short capabilities; /* port capabilities */
> > +     unsigned short bugs;         /* port bugs */
> > +     unsigned int tx_loadsz;      /* transmit fifo load size */
> > +     unsigned char acr;
> > +     unsigned char ier;
> > +     unsigned char lcr;
> > +     unsigned char mcr;
> > +     unsigned char mcr_mask;  /* mask of user bits */
> > +     unsigned char mcr_force; /* mask of forced bits */
> > +     struct circ_buf rx_dma_buf;
> > +     struct circ_buf tx_dma_buf;
> > +     unsigned char dma_channel;
> > +     dma_addr_t dma_rx_addr; /* Mapped ADMA descr. table */
> > +     dma_addr_t dma_tx_addr; /* Mapped ADMA descr. table */
> > +#ifdef CONFIG_AST_UART_DMA_RX_INTERRUPT
> > +     struct tasklet_struct rx_tasklet;
> > +#else
> > +     struct timer_list rx_timer;
> > +     unsigned int workaround;
> > +#endif
> > +     struct tasklet_struct tx_tasklet;
> > +     spinlock_t lock;
> > +     int tx_done;
> > +     int tx_count;
> > +     struct platform_device *ast_uart_pdev;
> > +/*
> > + * Some bits in registers are cleared on a read, so they must
> > + * be saved whenever the register is read but the bits will not
> > + * be immediately processed.
> > + */
> > +#define LSR_SAVE_FLAGS UART_LSR_BRK_ERROR_BITS
> > +     unsigned char lsr_saved_flags;
> > +#define MSR_SAVE_FLAGS UART_MSR_ANY_DELTA
> > +     unsigned char msr_saved_flags;
> > +
> > +     /*
> > +      * We provide a per-port pm hook.
> > +      */
> > +     void (*pm)(struct uart_port *port, unsigned int state,
> > +                                              unsigned int old);
> > +};
> > +
> > +static struct ast_uart_port ast_uart_ports[UART_DMA_NR];
> > +
> > +#define GET_DEV(ast_uart_port_priv_ptr)\
> > +             (ast_uart_port_priv_ptr->ast_uart_pdev->dev)
> > +
> > +static inline struct ast_uart_port *
> > +to_ast_dma_uart_port(struct uart_port *uart) {
> > +     return container_of(uart, struct ast_uart_port, port);
> > +}
> > +
> > +struct irq_info {
> > +     spinlock_t lock;
> > +     struct ast_uart_port *up;
> > +};
> > +
> > +static struct irq_info ast_uart_irq[1];
> > +static DEFINE_MUTEX(ast_uart_mutex);
> > +
> > +/*
> > + * Here we define the default xmit fifo size used for each type of UART.
> > + */
> > +static const struct serial8250_config uart_config[] = {
> > +     [PORT_UNKNOWN] = {
> > +             .name           = "unknown",
> > +             .fifo_size      = 1,
> > +             .tx_loadsz      = 1,
> > +     },
> > +     [PORT_8250] = {
> > +             .name           = "8250",
> > +             .fifo_size      = 1,
> > +             .tx_loadsz      = 1,
> > +     },
> > +     [PORT_16450] = {
> > +             .name           = "16450",
> > +             .fifo_size      = 1,
> > +             .tx_loadsz      = 1,
> > +     },
> > +     [PORT_16550] = {
> > +             .name           = "16550",
> > +             .fifo_size      = 1,
> > +             .tx_loadsz      = 1,
> > +     },
> > +     [PORT_16550A] = {
> > +             .name           = "16550A",
> > +             .fifo_size      = 16,
> > +             .tx_loadsz      = 16,
> > +             .fcr            = UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10
> > +                                                     |
> UART_FCR_DMA_SELECT,
> > +             .flags          = UART_CAP_FIFO,
> > +     },
> > +};
>
> I doubt you need all of these port types, right?  You only have one type
> of device, please strip out _ALL_ of the unneeded code in here.  You did
> a wholesale copy of the old driver, to get away with that you then need
> to customize it to work properly with your hardware _AND_ take away all
> code that is not needed for your hardware.
>
> Lots of this file can be removed, please do so.
>
> thanks,
>
> greg k-h
>

--000000000000acaa3c058ef888c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi =C2=A0Greg,<br>=C2=A0After modifying [ patch v4 1/5 ] ,=
 should i submit whole patchset as =C2=A0v5 ?<br>=C2=A0or replying =C2=A0wi=
th this single patch modified will be enough?<br>=C2=A0how is this done in =
linux community ?.<br><div><br></div><div>Regards</div><div>Sudheer</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, Jul 30, 2019 at 9:18 PM Greg KH &lt;<a href=3D"mailto:gregkh@linuxfou=
ndation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Fri, Jul 26, 2019 at 06:57:16PM +=
0530, sudheer.v wrote:<br>
&gt; From: sudheer veliseti &lt;<a href=3D"mailto:sudheer.open@gmail.com" t=
arget=3D"_blank">sudheer.open@gmail.com</a>&gt;<br>
&gt; <br>
&gt; UART driver for Aspeed&#39;s bmc chip AST2500<br>
&gt; <br>
&gt; Design approch:<br>
&gt; AST2500 has dedicated Uart DMA controller which has 12 sets of Tx and =
RX channels<br>
&gt; connected to UART controller directly.<br>
&gt; Since the DMA controller have dedicated buffers and registers,<br>
&gt; there would be little benifit in adding DMA framework overhead.<br>
&gt; So the software for DMA controller is included within the UART driver =
itself.<br>
&gt; <br>
&gt; implementation details:<br>
&gt; &#39;struct ast_uart_port&#39; is populated and registered with uart_c=
ore.<br>
&gt; code is organised into two layers UART-layer and DMA-Layer,both of the=
m are<br>
&gt; in the same file.UART-layer requests Rx and Tx dma channels<br>
&gt; and registers callbacks with DMA controller software Layer<br>
&gt; Interrupt service routine for DMA controller is the crucial one for Ha=
ndling all<br>
&gt; the tx and rx data. ISRs installed for individual uarts are just dummy=
,and are helpful <br>
&gt; only to report any spurious interrupts in hardware.<br>
&gt; <br>
&gt; <br>
&gt; Signed-off-by: sudheer veliseti &lt;<a href=3D"mailto:sudheer.open@gma=
il.com" target=3D"_blank">sudheer.open@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Changes from v3-&gt;v4:<br>
&gt; - per port uart structures are registerd directly with uart core <br>
&gt;=C2=A0 =C2=A0Instead of registering through 8250 Frame work,<br>
&gt;=C2=A0 =C2=A0ast_uart_port is registered using uart_add_one_port<br>
&gt; -SDMA_RX_FIX macro replaced with CONFIG_AST_UART_DMA_RX_INTERRUPT<br>
&gt; -ast_uart_sdma_isr : DMA interrupt handler code is improvised<br>
&gt; -replaced pr_debug with ftrace wherever appropriate<br>
&gt; -dev_err is used in all error return cases<br>
&gt; -uart driver structure ast25xx_uart_reg is modified<br>
&gt; -driver name changed to ast2500-uart-dma-drv<br>
&gt; -rx_timer initialisation and callback fn modified<br>
&gt; <br>
&gt; Changes from v2-&gt;v3:<br>
&gt; -custom debug replaced by in kerenl dynamic debug: pr_debug <br>
&gt; -change-logs added <br>
&gt; <br>
&gt; <br>
&gt; .../tty/serial/8250/8250_ast2500_uart_dma.c=C2=A0 =C2=A0| 1901 +++++++=
++++++++++<br>
&gt;=C2=A0 1 file changed, 1901 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/tty/serial/8250/8250_ast2500_uart_dma=
.c<br>
&gt; <br>
&gt; diff --git a/drivers/tty/serial/8250/8250_ast2500_uart_dma.c b/drivers=
/tty/serial/8250/8250_ast2500_uart_dma.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..bc830d605372<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/tty/serial/8250/8250_ast2500_uart_dma.c<br>
&gt; @@ -0,0 +1,1901 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + *=C2=A0 DMA UART Driver for ASPEED BMC chip: AST2500<br>
&gt; + *<br>
&gt; + *=C2=A0 Copyright (C) 2019 sudheer Kumar veliseti, Aspeed technology=
 Inc.<br>
&gt; + *=C2=A0 &lt;<a href=3D"mailto:open.sudheer@gmail.com" target=3D"_bla=
nk">open.sudheer@gmail.com</a>&gt;<br>
<br>
What was the copyright on the file you copied?=C2=A0 Please properly<br>
attribute that here.<br>
<br>
<br>
&gt; + *<br>
&gt; + */<br>
&gt; +#include &lt;linux/clk.h&gt;<br>
&gt; +#include &lt;linux/dma-mapping.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of_address.h&gt;<br>
&gt; +#include &lt;linux/of_irq.h&gt;<br>
&gt; +#include &lt;linux/tty.h&gt;<br>
&gt; +#include &lt;linux/tty_flip.h&gt;<br>
&gt; +#include &quot;8250.h&quot;<br>
&gt; +<br>
&gt; +#define SERIAL8250_CONSOLE NULL<br>
&gt; +#define TTY_AST_MAJOR 204<br>
&gt; +#define TTY_AST_MINOR 68<br>
<br>
Where did you get this minor number from?<br>
<br>
&gt; +<br>
&gt; +#define DMA_BUFF_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x1000<br>
&gt; +#define SDMA_RX_BUFF_SIZE=C2=A0 =C2=A0 0x10000<br>
&gt; +#define PASS_LIMIT 256<br>
&gt; +#define UART_DMA_NR CONFIG_AST_NR_DMA_UARTS<br>
&gt; +#define AST_UART_SDMA_CH 12<br>
&gt; +<br>
&gt; +/* enum ast_uart_chan_op<br>
&gt; + * operation codes passed to the DMA code by the user, and also used<=
br>
&gt; + * to inform the current channel owner of any changes to the system s=
tate<br>
&gt; + */<br>
&gt; +enum ast_uart_chan_op {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0AST_UART_DMAOP_TRIGGER,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0AST_UART_DMAOP_STOP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0AST_UART_DMAOP_PAUSE,<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* ast_uart_dma_cbfn: buffer callback routinei type */<br>
&gt; +typedef void (*ast_uart_dma_cbfn)(void *dev_id, u16 len);<br>
&gt; +<br>
&gt; +struct ast_sdma_info {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 ch_no;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 direction;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *sdma_virt_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_addr_t dma_phy_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* cdriver callbacks */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ast_uart_dma_cbfn callback_fn; /* buffer done cal=
lback */<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct ast_sdma_ch {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ast_sdma_info tx_dma_info[AST_UART_SDMA_CH=
];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ast_sdma_info rx_dma_info[AST_UART_SDMA_CH=
];<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct ast_sdma {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *reg_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int dma_irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ast_sdma_ch *dma_ch;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *map;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define UART_TX_SDMA_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x00<br>
&gt; +#define UART_RX_SDMA_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x04<br>
&gt; +#define UART_SDMA_CONF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x08 /* Misc, Buffer size=C2=A0 */<br>
&gt; +#define UART_SDMA_TIMER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x0C<br>
&gt; +#define UART_TX_SDMA_REST=C2=A0 =C2=A0 0x20<br>
&gt; +#define UART_RX_SDMA_REST=C2=A0 =C2=A0 0x24<br>
&gt; +#define UART_TX_SDMA_IER=C2=A0 =C2=A0 =C2=A00x30<br>
&gt; +#define UART_TX_SDMA_ISR=C2=A0 =C2=A0 =C2=A00x34<br>
&gt; +#define UART_RX_SDMA_IER=C2=A0 =C2=A0 =C2=A00x38<br>
&gt; +#define UART_RX_SDMA_ISR=C2=A0 =C2=A0 =C2=A00x3C<br>
&gt; +#define UART_TX_R_POINT(x)=C2=A0 =C2=A0(0x40 + ((x) * 0x20))<br>
&gt; +#define UART_TX_W_POINT(x)=C2=A0 =C2=A0(0x44 + ((x) * 0x20))<br>
&gt; +#define UART_TX_SDMA_ADDR(x) (0x48 + ((x) * 0x20))<br>
&gt; +#define UART_RX_R_POINT(x)=C2=A0 =C2=A0(0x50 + ((x) * 0x20))<br>
&gt; +#define UART_RX_W_POINT(x)=C2=A0 =C2=A0(0x54 + ((x) * 0x20))<br>
&gt; +#define UART_RX_SDMA_ADDR(x) (0x58 + ((x) * 0x20))<br>
&gt; +#define SDMA_CH_EN(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 BIT(x)<br>
&gt; +<br>
&gt; +#define SDMA_TX_BUFF_SIZE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x3)<br>
&gt; +#define SDMA_SET_TX_BUFF_SIZE(x)(x)<br>
&gt; +#define SDMA_BUFF_SIZE_1KB=C2=A0 =C2=A0(0x0)<br>
&gt; +#define SDMA_BUFF_SIZE_4KB=C2=A0 =C2=A0(0x1)<br>
&gt; +#define SDMA_BUFF_SIZE_16KB=C2=A0 (0x2)<br>
&gt; +#define SDMA_BUFF_SIZE_64KB=C2=A0 (0x3)<br>
&gt; +#define SDMA_RX_BUFF_SIZE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x3 &lt;&lt=
; 2)<br>
&gt; +#define SDMA_SET_RX_BUFF_SIZE(x)((x) &lt;&lt; 2)<br>
&gt; +#define SDMA_TIMEOUT_DIS=C2=A0 =C2=A0 =C2=A0BIT(4)<br>
&gt; +<br>
&gt; +#define UART_SDMA11_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 BIT(11)<br>
&gt; +#define UART_SDMA10_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 BIT(10)<br>
&gt; +#define UART_SDMA9_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(9)<br>
&gt; +#define UART_SDMA8_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(8)<br>
&gt; +#define UART_SDMA7_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(7)<br>
&gt; +#define UART_SDMA6_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(6)<br>
&gt; +#define UART_SDMA5_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(5)<br>
&gt; +#define UART_SDMA4_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(4)<br>
&gt; +#define UART_SDMA3_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(3)<br>
&gt; +#define UART_SDMA2_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(2)<br>
&gt; +#define UART_SDMA1_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(1)<br>
&gt; +#define UART_SDMA0_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(0)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Configuration:<br>
&gt; + *=C2=A0 =C2=A0share_irqs - whether we pass IRQF_SHARED to request_ir=
q().<br>
&gt; + *=C2=A0 =C2=A0This option is unsafe when used on edge-triggered inte=
rrupts.<br>
&gt; + */<br>
&gt; +static unsigned int share_irqs =3D SERIAL8250_SHARE_IRQS;<br>
&gt; +<br>
&gt; +static unsigned int nr_uarts =3D CONFIG_AST_RUNTIME_DMA_UARTS;<br>
&gt; +<br>
&gt; +struct ast_uart_port {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct uart_port port;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short capabilities; /* port capabilities=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short bugs;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* port bugs */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int tx_loadsz;=C2=A0 =C2=A0 =C2=A0 /* tr=
ansmit fifo load size */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char acr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char ier;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char lcr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char mcr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char mcr_mask;=C2=A0 /* mask of user bit=
s */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char mcr_force; /* mask of forced bits *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct circ_buf rx_dma_buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct circ_buf tx_dma_buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char dma_channel;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_addr_t dma_rx_addr; /* Mapped ADMA descr. tab=
le */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_addr_t dma_tx_addr; /* Mapped ADMA descr. tab=
le */<br>
&gt; +#ifdef CONFIG_AST_UART_DMA_RX_INTERRUPT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tasklet_struct rx_tasklet;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct timer_list rx_timer;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int workaround;<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tasklet_struct tx_tasklet;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spinlock_t lock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int tx_done;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int tx_count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct platform_device *ast_uart_pdev;<br>
&gt; +/*<br>
&gt; + * Some bits in registers are cleared on a read, so they must<br>
&gt; + * be saved whenever the register is read but the bits will not<br>
&gt; + * be immediately processed.<br>
&gt; + */<br>
&gt; +#define LSR_SAVE_FLAGS UART_LSR_BRK_ERROR_BITS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char lsr_saved_flags;<br>
&gt; +#define MSR_SAVE_FLAGS UART_MSR_ANY_DELTA<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned char msr_saved_flags;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * We provide a per-port pm hook.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void (*pm)(struct uart_port *port, unsigned int s=
tate,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned int old);<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct ast_uart_port ast_uart_ports[UART_DMA_NR];<br>
&gt; +<br>
&gt; +#define GET_DEV(ast_uart_port_priv_ptr)\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ast_uart_port_priv_p=
tr-&gt;ast_uart_pdev-&gt;dev)<br>
&gt; +<br>
&gt; +static inline struct ast_uart_port *<br>
&gt; +to_ast_dma_uart_port(struct uart_port *uart) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return container_of(uart, struct ast_uart_port, p=
ort);<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct irq_info {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spinlock_t lock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ast_uart_port *up;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct irq_info ast_uart_irq[1];<br>
&gt; +static DEFINE_MUTEX(ast_uart_mutex);<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Here we define the default xmit fifo size used for each type of UA=
RT.<br>
&gt; + */<br>
&gt; +static const struct serial8250_config uart_config[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[PORT_UNKNOWN] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;unknown&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fifo_size=C2=A0 =C2=
=A0 =C2=A0 =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.tx_loadsz=C2=A0 =C2=
=A0 =C2=A0 =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[PORT_8250] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;8250&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fifo_size=C2=A0 =C2=
=A0 =C2=A0 =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.tx_loadsz=C2=A0 =C2=
=A0 =C2=A0 =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[PORT_16450] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;16450&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fifo_size=C2=A0 =C2=
=A0 =C2=A0 =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.tx_loadsz=C2=A0 =C2=
=A0 =C2=A0 =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[PORT_16550] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;16550&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fifo_size=C2=A0 =C2=
=A0 =C2=A0 =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.tx_loadsz=C2=A0 =C2=
=A0 =C2=A0 =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[PORT_16550A] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;16550A&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fifo_size=C2=A0 =C2=
=A0 =C2=A0 =3D 16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.tx_loadsz=C2=A0 =C2=
=A0 =C2=A0 =3D 16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fcr=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| UART_FCR_DMA_SELECT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D UART_CAP_FIFO,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
<br>
I doubt you need all of these port types, right?=C2=A0 You only have one ty=
pe<br>
of device, please strip out _ALL_ of the unneeded code in here.=C2=A0 You d=
id<br>
a wholesale copy of the old driver, to get away with that you then need<br>
to customize it to work properly with your hardware _AND_ take away all<br>
code that is not needed for your hardware.<br>
<br>
Lots of this file can be removed, please do so.<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--000000000000acaa3c058ef888c9--
