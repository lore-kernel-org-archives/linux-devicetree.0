Return-Path: <SRS0=Rgsm=GK=chromium.org=swboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <1521071931-9294-5-git-send-email-kramasub@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-5-git-send-email-kramasub@codeaurora.org>
Message-ID: <152156025613.254778.431774948232120027@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 4/6] tty: serial: msm_geni_serial: Add serial driver support
 for GENI based QUP
Date: Tue, 20 Mar 2018 08:37:36 -0700
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org, Girish Mahadevan <girishm@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Doug Anderson <dianders@google.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Karthikeyan Ramasubramanian (2018-03-14 16:58:49)
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> new file mode 100644
> index 0000000..1442777
> --- /dev/null
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -0,0 +1,1158 @@
> +
> +#ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
> +static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
> +{
> +       writel_relaxed(ch, uport->membase + SE_GENI_TX_FIFOn);

Does this expect the whole word to have data to write? Or does the FIFO
output a character followed by three NUL bytes each time it gets
written? The way that uart_console_write() works is to take each
character a byte at a time, put it into an int (so extend that byte with
zero) and then pass it to the putchar function. I would expect that at
this point the hardware sees the single character and then 3 NULs enter
the FIFO each time.

For previous MSM uarts I had to handle this oddity by packing the words
into the fifo four at a time. You may need to do the same here.

> +}
> +
> +static void
> +__qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
> +                                unsigned int count)
> +{
> +       int i;
> +       u32 bytes_to_send =3D count;
> +
> +       for (i =3D 0; i < count; i++) {
> +               if (s[i] =3D=3D '\n')

Can you add a comment that uart_console_write() adds a carriage return
for each newline?

> +                       bytes_to_send++;
> +       }
> +
> +       writel_relaxed(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_R=
EG);
> +       qcom_geni_serial_setup_tx(uport, bytes_to_send);
> +       for (i =3D 0; i < count; ) {
> +               size_t chars_to_write =3D 0;
> +               size_t avail =3D DEF_FIFO_DEPTH_WORDS - DEF_TX_WM;
> +
> +               /*
> +                * If the WM bit never set, then the Tx state machine is =
not
> +                * in a valid state, so break, cancel/abort any existing
> +                * command. Unfortunately the current data being written =
is
> +                * lost.
> +                */
> +               if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATU=
S,
> +                                               M_TX_FIFO_WATERMARK_EN, t=
rue))
> +                       break;
> +               chars_to_write =3D min_t(size_t, (size_t)(count - i), ava=
il / 2);

The _t part of min_t should do the casting already, so we can drop the
cast on count - i?

> +               uart_console_write(uport, s + i, chars_to_write,
> +                                               qcom_geni_serial_wr_char);
> +               writel_relaxed(M_TX_FIFO_WATERMARK_EN, uport->membase +
> +                                                       SE_GENI_M_IRQ_CLE=
AR);
> +               i +=3D chars_to_write;
> +       }
> +       qcom_geni_serial_poll_tx_done(uport);
> +}
> +
> +static void qcom_geni_serial_console_write(struct console *co, const cha=
r *s,
> +                             unsigned int count)
> +{
> +       struct uart_port *uport;
> +       struct qcom_geni_serial_port *port;
> +       bool locked =3D true;
> +       unsigned long flags;
> +
> +       WARN_ON(co->index < 0 || co->index >=3D GENI_UART_CONS_PORTS);
> +
> +       port =3D get_port_from_line(co->index);
> +       if (IS_ERR(port))
> +               return;
> +
> +       uport =3D &port->uport;
> +       if (oops_in_progress)
> +               locked =3D spin_trylock_irqsave(&uport->lock, flags);
> +       else
> +               spin_lock_irqsave(&uport->lock, flags);
> +
> +       /* Cancel the current write to log the fault */
> +       if (!locked) {
> +               geni_se_cancel_m_cmd(&port->se);
> +               if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATU=
S,
> +                                               M_CMD_CANCEL_EN, true)) {
> +                       geni_se_abort_m_cmd(&port->se);
> +                       qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_ST=
ATUS,
> +                                                       M_CMD_ABORT_EN, t=
rue);
> +                       writel_relaxed(M_CMD_ABORT_EN, uport->membase +
> +                                                       SE_GENI_M_IRQ_CLE=
AR);
> +               }
> +               writel_relaxed(M_CMD_CANCEL_EN, uport->membase +
> +                                                       SE_GENI_M_IRQ_CLE=
AR);
> +       }
> +
> +       __qcom_geni_serial_console_write(uport, s, count);
> +       if (locked)
> +               spin_unlock_irqrestore(&uport->lock, flags);
> +}

Can you also support the OF_EARLYCON_DECLARE method of console writing
so we can get an early printk style debug console?

> +
> +static int handle_rx_console(struct uart_port *uport, u32 bytes, bool dr=
op)
> +{
> +       u32 i;
> +       unsigned char buf[sizeof(u32)];
> +       struct tty_port *tport;
> +       struct qcom_geni_serial_port *port =3D to_dev_port(uport, uport);
> +
> +       tport =3D &uport->state->port;
> +       for (i =3D 0; i < bytes; ) {
> +               int c;
> +               int chunk =3D min_t(int, bytes - i, port->rx_bytes_pw);
> +
> +               ioread32_rep(uport->membase + SE_GENI_RX_FIFOn, buf, 1);
> +               i +=3D chunk;
> +               if (drop)
> +                       continue;
> +
> +               for (c =3D 0; c < chunk; c++) {
> +                       int sysrq;
> +
> +                       uport->icount.rx++;
> +                       if (port->brk && buf[c] =3D=3D 0) {
> +                               port->brk =3D false;
> +                               if (uart_handle_break(uport))
> +                                       continue;

Thanks!

> +                       }
> +
> +                       sysrq =3D uart_handle_sysrq_char(uport, buf[c]);
> +                       if (!sysrq)
> +                               tty_insert_flip_char(tport, buf[c], TTY_N=
ORMAL);
> +               }
> +       }
> +       if (!drop)
> +               tty_flip_buffer_push(tport);
> +       return 0;
> +}
[...]
> +
> +static void qcom_geni_serial_handle_tx(struct uart_port *uport)
> +{
> +       struct qcom_geni_serial_port *port =3D to_dev_port(uport, uport);
> +       struct circ_buf *xmit =3D &uport->state->xmit;
> +       size_t avail;
> +       size_t remaining;
> +       int i;
> +       u32 status;
> +       unsigned int chunk;
> +       int tail;
> +
> +       chunk =3D uart_circ_chars_pending(xmit);
> +       status =3D readl_relaxed(uport->membase + SE_GENI_TX_FIFO_STATUS);
> +       /* Both FIFO and framework buffer are drained */
> +       if (chunk =3D=3D port->xmit_size && !status) {
> +               port->xmit_size =3D 0;
> +               uart_circ_clear(xmit);
> +               qcom_geni_serial_stop_tx(uport);
> +               goto out_write_wakeup;
> +       }
> +       chunk -=3D port->xmit_size;
> +
> +       avail =3D (port->tx_fifo_depth - port->tx_wm) * port->tx_bytes_pw;
> +       tail =3D (xmit->tail + port->xmit_size) & (UART_XMIT_SIZE - 1);
> +       if (chunk > (UART_XMIT_SIZE - tail))
> +               chunk =3D UART_XMIT_SIZE - tail;
> +       if (chunk > avail)
> +               chunk =3D avail;

chunk =3D min3(chunk, UART_XMIT_SIZE - tail, avail);

> +
> +       if (!chunk)
> +               goto out_write_wakeup;
> +
> +       qcom_geni_serial_setup_tx(uport, chunk);
> +
> +       remaining =3D chunk;
> +       for (i =3D 0; i < chunk; ) {
> +               unsigned int tx_bytes;
> +               unsigned int buf =3D 0;

Make buf into a u8 array of 4?

> +               int c;
> +
> +               tx_bytes =3D min_t(size_t, remaining, (size_t)port->tx_by=
tes_pw);
> +               for (c =3D 0; c < tx_bytes ; c++)
> +                       buf |=3D (xmit->buf[tail + c] << (c * BITS_PER_BY=
TE));

And then just put buf[c] =3D xmit->buf[tail + c] here?

> +
> +               writel_relaxed(buf, uport->membase + SE_GENI_TX_FIFOn);

This also needs to be an iowrite32_rep(uport->membase, buf, 1) for
endian reasons.

> +
> +               i +=3D tx_bytes;
> +               tail =3D (tail + tx_bytes) & (UART_XMIT_SIZE - 1);
> +               uport->icount.tx +=3D tx_bytes;
> +               remaining -=3D tx_bytes;
> +       }
> +       qcom_geni_serial_poll_tx_done(uport);
> +       port->xmit_size +=3D chunk;
> +out_write_wakeup:
> +       uart_write_wakeup(uport);
> +}
> +
> +static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
> +{
> +       unsigned int m_irq_status;
> +       unsigned int s_irq_status;
> +       struct uart_port *uport =3D dev;
> +       unsigned long flags;
> +       unsigned int m_irq_en;
> +       bool drop_rx =3D false;
> +       struct tty_port *tport =3D &uport->state->port;
> +       struct qcom_geni_serial_port *port =3D to_dev_port(uport, uport);
> +
> +       if (uport->suspended)
> +               return IRQ_HANDLED;

Is it a spurious IRQ if this happens? Return IRQ_NONE instead?

> +
> +       spin_lock_irqsave(&uport->lock, flags);
> +       m_irq_status =3D readl_relaxed(uport->membase + SE_GENI_M_IRQ_STA=
TUS);
> +       s_irq_status =3D readl_relaxed(uport->membase + SE_GENI_S_IRQ_STA=
TUS);
> +       m_irq_en =3D readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> +       writel_relaxed(m_irq_status, uport->membase + SE_GENI_M_IRQ_CLEAR=
);
> +       writel_relaxed(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR=
);
> +
> +       if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
> +               goto out_unlock;
> +
> +       if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
> +               uport->icount.overrun++;
> +               tty_insert_flip_char(tport, 0, TTY_OVERRUN);
> +       }
> +
> +       if (m_irq_status & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN) &&
> +           m_irq_en & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
> +               qcom_geni_serial_handle_tx(uport);
> +
> +       if (s_irq_status & S_GP_IRQ_0_EN || s_irq_status & S_GP_IRQ_1_EN)=
 {
> +               if (s_irq_status & S_GP_IRQ_0_EN)
> +                       uport->icount.parity++;
> +               drop_rx =3D true;
> +       } else if (s_irq_status & S_GP_IRQ_2_EN ||
> +                                       s_irq_status & S_GP_IRQ_3_EN) {
> +               uport->icount.brk++;

Maybe move this stat accounting to the place where brk is handled?

> +               port->brk =3D true;
> +       }
> +
> +       if (s_irq_status & S_RX_FIFO_WATERMARK_EN ||
> +                                       s_irq_status & S_RX_FIFO_LAST_EN)
> +               qcom_geni_serial_handle_rx(uport, drop_rx);
> +
> +out_unlock:
> +       spin_unlock_irqrestore(&uport->lock, flags);
> +       return IRQ_HANDLED;
> +}
> +
> +static int get_tx_fifo_size(struct qcom_geni_serial_port *port)
> +{
> +       struct uart_port *uport;
> +
> +       if (!port)
> +               return -ENODEV;

This happens?

> +
> +       uport =3D &port->uport;
> +       port->tx_fifo_depth =3D geni_se_get_tx_fifo_depth(&port->se);
> +       port->tx_fifo_width =3D geni_se_get_tx_fifo_width(&port->se);
> +       port->rx_fifo_depth =3D geni_se_get_rx_fifo_depth(&port->se);
> +       uport->fifosize =3D
> +               (port->tx_fifo_depth * port->tx_fifo_width) / BITS_PER_BY=
TE;
> +       return 0;
> +}
> +
[...]
> +
> +#ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
> +static int __init qcom_geni_console_setup(struct console *co, char *opti=
ons)
> +{
> +       struct uart_port *uport;
> +       struct qcom_geni_serial_port *port;
> +       int baud;
> +       int bits =3D 8;
> +       int parity =3D 'n';
> +       int flow =3D 'n';
> +
> +       if (co->index >=3D GENI_UART_CONS_PORTS  || co->index < 0)
> +               return -ENXIO;
> +
> +       port =3D get_port_from_line(co->index);
> +       if (IS_ERR(port)) {
> +               pr_err("Invalid line %d(%d)\n", co->index, (int)PTR_ERR(p=
ort));

Use %ld to avoid casting the error value? Or just don't print it at all
because it doesn't really help the end user.

> +               return PTR_ERR(port);
> +       }
> +
> +       uport =3D &port->uport;
> +
> +       if (unlikely(!uport->membase))
> +               return -ENXIO;
> +
> +       if (geni_se_resources_on(&port->se)) {
> +               dev_err(port->se.dev, "Error turning on resources\n");
> +               return -ENXIO;
> +       }
> +
> +       if (unlikely(geni_se_read_proto(&port->se) !=3D GENI_SE_UART)) {
> +               geni_se_resources_off(&port->se);
> +               return -ENXIO;
> +       }
> +
> +       if (!port->setup) {
> +               port->tx_bytes_pw =3D 1;
> +               port->rx_bytes_pw =3D RX_BYTES_PW;
> +               qcom_geni_serial_stop_rx(uport);
> +               qcom_geni_serial_port_setup(uport);
> +       }
> +
> +       if (options)
> +               uart_parse_options(options, &baud, &parity, &bits, &flow);
> +
> +       return uart_set_options(uport, co, baud, parity, bits, flow);
> +}
[..]
> +
> +static int qcom_geni_serial_probe(struct platform_device *pdev)
> +{
> +       int ret =3D 0;
> +       int line =3D -1;
> +       struct qcom_geni_serial_port *port;
> +       struct uart_port *uport;
> +       struct resource *res;
> +
> +       if (pdev->dev.of_node)
> +               line =3D of_alias_get_id(pdev->dev.of_node, "serial");
> +       else
> +               line =3D pdev->id;

Do we need to support the non-alias method?

> +
> +       if (line < 0 || line >=3D GENI_UART_CONS_PORTS)
> +               return -ENXIO;
> +       port =3D get_port_from_line(line);
> +       if (IS_ERR(port)) {
> +               ret =3D PTR_ERR(port);
> +               dev_err(&pdev->dev, "Invalid line %d(%d)\n", line, ret);
> +               return ret;
> +       }
> +
> +       uport =3D &port->uport;
> +       /* Don't allow 2 drivers to access the same port */
> +       if (uport->private_data)
> +               return -ENODEV;
> +
> +       uport->dev =3D &pdev->dev;
> +       port->se.dev =3D &pdev->dev;
> +       port->se.wrapper =3D dev_get_drvdata(pdev->dev.parent);
> +       port->se.clk =3D devm_clk_get(&pdev->dev, "se");
> +       if (IS_ERR(port->se.clk)) {
> +               ret =3D PTR_ERR(port->se.clk);
> +               dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
> +               return ret;
> +       }
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (IS_ERR(res))
> +               return PTR_ERR(res);
> +       uport->mapbase =3D res->start;
> +
> +       port->tx_fifo_depth =3D DEF_FIFO_DEPTH_WORDS;
> +       port->rx_fifo_depth =3D DEF_FIFO_DEPTH_WORDS;
> +       port->tx_fifo_width =3D DEF_FIFO_WIDTH_BITS;
> +
> +       uport->irq =3D platform_get_irq(pdev, 0);
> +       if (uport->irq < 0) {
> +               dev_err(&pdev->dev, "Failed to get IRQ %d\n", uport->irq);
> +               return uport->irq;
> +       }
> +
> +       uport->private_data =3D &qcom_geni_console_driver;
> +       platform_set_drvdata(pdev, port);
> +       port->handle_rx =3D handle_rx_console;
> +       port->setup =3D false;

This would be set to false already?

> +       return uart_add_one_port(&qcom_geni_console_driver, uport);
> +}
> +
> +static int qcom_geni_serial_remove(struct platform_device *pdev)
> +{
> +       struct qcom_geni_serial_port *port =3D platform_get_drvdata(pdev);
> +       struct uart_driver *drv =3D port->uport.private_data;
> +
> +       uart_remove_one_port(drv, &port->uport);
> +       return 0;
> +}
> +
> +static int __maybe_unused qcom_geni_serial_sys_suspend_noirq(struct devi=
ce *dev)
> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       struct qcom_geni_serial_port *port =3D platform_get_drvdata(pdev);
> +       struct uart_port *uport =3D &port->uport;
> +
> +       uart_suspend_port(uport->private_data, uport);
> +       return 0;
> +}
> +
> +static int __maybe_unused qcom_geni_serial_sys_resume_noirq(struct devic=
e *dev)
> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       struct qcom_geni_serial_port *port =3D platform_get_drvdata(pdev);
> +       struct uart_port *uport =3D &port->uport;
> +
> +       if (console_suspend_enabled && uport->suspended) {
> +               uart_resume_port(uport->private_data, uport);
> +               disable_irq(uport->irq);

I missed the enable_irq() part. Is this still necessary?

> +       }
> +       return 0;
> +}
> +
> +static int __init qcom_geni_serial_init(void)
> +{
> +       int ret;
> +
> +       qcom_geni_console_port.uport.iotype =3D UPIO_MEM;
> +       qcom_geni_console_port.uport.ops =3D &qcom_geni_console_pops;
> +       qcom_geni_console_port.uport.flags =3D UPF_BOOT_AUTOCONF;
> +       qcom_geni_console_port.uport.line =3D 0;

Why can't this be done statically?
> +
> +       ret =3D console_register(&qcom_geni_console_driver);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D platform_driver_register(&qcom_geni_serial_platform_drive=
r);
> +       if (ret)
> +               console_unregister(&qcom_geni_console_driver);
> +       return ret;
> +}
> +module_init(qcom_geni_serial_init);
