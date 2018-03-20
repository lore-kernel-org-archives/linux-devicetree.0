Return-Path: <SRS0=GJfZ=GK=codeaurora.org=kramasub@kernel.org>
Subject: Re: [PATCH v4 4/6] tty: serial: msm_geni_serial: Add serial driver
 support for GENI based QUP
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-5-git-send-email-kramasub@codeaurora.org>
 <152156025613.254778.431774948232120027@swboyd.mtv.corp.google.com>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <23359b7c-6760-9cca-4c99-b08b3e79fa7a@codeaurora.org>
Date: Tue, 20 Mar 2018 16:53:25 -0600
MIME-Version: 1.0
In-Reply-To: <152156025613.254778.431774948232120027@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <swboyd@chromium.org>, andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org, Girish Mahadevan <girishm@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Doug Anderson <dianders@google.com>
List-ID: <devicetree@vger.kernel.org>



On 3/20/2018 9:37 AM, Stephen Boyd wrote:
> Quoting Karthikeyan Ramasubramanian (2018-03-14 16:58:49)
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> new file mode 100644
>> index 0000000..1442777
>> --- /dev/null
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -0,0 +1,1158 @@
>> +
>> +#ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
>> +static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
>> +{
>> +       writel_relaxed(ch, uport->membase + SE_GENI_TX_FIFOn);
> 
> Does this expect the whole word to have data to write? Or does the FIFO
> output a character followed by three NUL bytes each time it gets
> written? The way that uart_console_write() works is to take each
> character a byte at a time, put it into an int (so extend that byte with
> zero) and then pass it to the putchar function. I would expect that at
> this point the hardware sees the single character and then 3 NULs enter
> the FIFO each time.
> 
> For previous MSM uarts I had to handle this oddity by packing the words
> into the fifo four at a time. You may need to do the same here.
The packing configuration 1 * 8 (done using geni_se_config_packing)
ensures that only one byte per FIFO word needs to be transmitted. From
that perspective, we need not have such oddity.
> 
>> +}
>> +
>> +static void
>> +__qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
>> +                                unsigned int count)
>> +{
>> +       int i;
>> +       u32 bytes_to_send = count;
>> +
>> +       for (i = 0; i < count; i++) {
>> +               if (s[i] == '\n')
> 
> Can you add a comment that uart_console_write() adds a carriage return
> for each newline?
Ok.
> 
>> +                       bytes_to_send++;
>> +       }
>> +
>> +       writel_relaxed(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
>> +       qcom_geni_serial_setup_tx(uport, bytes_to_send);
>> +       for (i = 0; i < count; ) {
>> +               size_t chars_to_write = 0;
>> +               size_t avail = DEF_FIFO_DEPTH_WORDS - DEF_TX_WM;
>> +
>> +               /*
>> +                * If the WM bit never set, then the Tx state machine is not
>> +                * in a valid state, so break, cancel/abort any existing
>> +                * command. Unfortunately the current data being written is
>> +                * lost.
>> +                */
>> +               if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +                                               M_TX_FIFO_WATERMARK_EN, true))
>> +                       break;
>> +               chars_to_write = min_t(size_t, (size_t)(count - i), avail / 2);
> 
> The _t part of min_t should do the casting already, so we can drop the
> cast on count - i?
Ok.
> 
>> +               uart_console_write(uport, s + i, chars_to_write,
>> +                                               qcom_geni_serial_wr_char);
>> +               writel_relaxed(M_TX_FIFO_WATERMARK_EN, uport->membase +
>> +                                                       SE_GENI_M_IRQ_CLEAR);
>> +               i += chars_to_write;
>> +       }
>> +       qcom_geni_serial_poll_tx_done(uport);
>> +}
>> +
>> +static void qcom_geni_serial_console_write(struct console *co, const char *s,
>> +                             unsigned int count)
>> +{
>> +       struct uart_port *uport;
>> +       struct qcom_geni_serial_port *port;
>> +       bool locked = true;
>> +       unsigned long flags;
>> +
>> +       WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
>> +
>> +       port = get_port_from_line(co->index);
>> +       if (IS_ERR(port))
>> +               return;
>> +
>> +       uport = &port->uport;
>> +       if (oops_in_progress)
>> +               locked = spin_trylock_irqsave(&uport->lock, flags);
>> +       else
>> +               spin_lock_irqsave(&uport->lock, flags);
>> +
>> +       /* Cancel the current write to log the fault */
>> +       if (!locked) {
>> +               geni_se_cancel_m_cmd(&port->se);
>> +               if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +                                               M_CMD_CANCEL_EN, true)) {
>> +                       geni_se_abort_m_cmd(&port->se);
>> +                       qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +                                                       M_CMD_ABORT_EN, true);
>> +                       writel_relaxed(M_CMD_ABORT_EN, uport->membase +
>> +                                                       SE_GENI_M_IRQ_CLEAR);
>> +               }
>> +               writel_relaxed(M_CMD_CANCEL_EN, uport->membase +
>> +                                                       SE_GENI_M_IRQ_CLEAR);
>> +       }
>> +
>> +       __qcom_geni_serial_console_write(uport, s, count);
>> +       if (locked)
>> +               spin_unlock_irqrestore(&uport->lock, flags);
>> +}
> 
> Can you also support the OF_EARLYCON_DECLARE method of console writing
> so we can get an early printk style debug console?
Do you prefer that as part of this patch itself or is it ok if I upload
the earlycon support once this gets merged.
> 
>> +
>> +static void qcom_geni_serial_handle_tx(struct uart_port *uport)
>> +{
>> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>> +       struct circ_buf *xmit = &uport->state->xmit;
>> +       size_t avail;
>> +       size_t remaining;
>> +       int i;
>> +       u32 status;
>> +       unsigned int chunk;
>> +       int tail;
>> +
>> +       chunk = uart_circ_chars_pending(xmit);
>> +       status = readl_relaxed(uport->membase + SE_GENI_TX_FIFO_STATUS);
>> +       /* Both FIFO and framework buffer are drained */
>> +       if (chunk == port->xmit_size && !status) {
>> +               port->xmit_size = 0;
>> +               uart_circ_clear(xmit);
>> +               qcom_geni_serial_stop_tx(uport);
>> +               goto out_write_wakeup;
>> +       }
>> +       chunk -= port->xmit_size;
>> +
>> +       avail = (port->tx_fifo_depth - port->tx_wm) * port->tx_bytes_pw;
>> +       tail = (xmit->tail + port->xmit_size) & (UART_XMIT_SIZE - 1);
>> +       if (chunk > (UART_XMIT_SIZE - tail))
>> +               chunk = UART_XMIT_SIZE - tail;
>> +       if (chunk > avail)
>> +               chunk = avail;
> 
> chunk = min3(chunk, UART_XMIT_SIZE - tail, avail);
Ok.
> 
>> +
>> +       if (!chunk)
>> +               goto out_write_wakeup;
>> +
>> +       qcom_geni_serial_setup_tx(uport, chunk);
>> +
>> +       remaining = chunk;
>> +       for (i = 0; i < chunk; ) {
>> +               unsigned int tx_bytes;
>> +               unsigned int buf = 0;
> 
> Make buf into a u8 array of 4?
Ok.
> 
>> +               int c;
>> +
>> +               tx_bytes = min_t(size_t, remaining, (size_t)port->tx_bytes_pw);
>> +               for (c = 0; c < tx_bytes ; c++)
>> +                       buf |= (xmit->buf[tail + c] << (c * BITS_PER_BYTE));
> 
> And then just put buf[c] = xmit->buf[tail + c] here?
Ok.
> 
>> +
>> +               writel_relaxed(buf, uport->membase + SE_GENI_TX_FIFOn);
> 
> This also needs to be an iowrite32_rep(uport->membase, buf, 1) for
> endian reasons.
Ok.
> 
>> +
>> +               i += tx_bytes;
>> +               tail = (tail + tx_bytes) & (UART_XMIT_SIZE - 1);
>> +               uport->icount.tx += tx_bytes;
>> +               remaining -= tx_bytes;
>> +       }
>> +       qcom_geni_serial_poll_tx_done(uport);
>> +       port->xmit_size += chunk;
>> +out_write_wakeup:
>> +       uart_write_wakeup(uport);
>> +}
>> +
>> +static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
>> +{
>> +       unsigned int m_irq_status;
>> +       unsigned int s_irq_status;
>> +       struct uart_port *uport = dev;
>> +       unsigned long flags;
>> +       unsigned int m_irq_en;
>> +       bool drop_rx = false;
>> +       struct tty_port *tport = &uport->state->port;
>> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>> +
>> +       if (uport->suspended)
>> +               return IRQ_HANDLED;
> 
> Is it a spurious IRQ if this happens? Return IRQ_NONE instead?
For the debug UART, this is a spurious IRQ. We can return IRQ_NONE.
> 
>> +
>> +       spin_lock_irqsave(&uport->lock, flags);
>> +       m_irq_status = readl_relaxed(uport->membase + SE_GENI_M_IRQ_STATUS);
>> +       s_irq_status = readl_relaxed(uport->membase + SE_GENI_S_IRQ_STATUS);
>> +       m_irq_en = readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
>> +       writel_relaxed(m_irq_status, uport->membase + SE_GENI_M_IRQ_CLEAR);
>> +       writel_relaxed(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
>> +
>> +       if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
>> +               goto out_unlock;
>> +
>> +       if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
>> +               uport->icount.overrun++;
>> +               tty_insert_flip_char(tport, 0, TTY_OVERRUN);
>> +       }
>> +
>> +       if (m_irq_status & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN) &&
>> +           m_irq_en & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
>> +               qcom_geni_serial_handle_tx(uport);
>> +
>> +       if (s_irq_status & S_GP_IRQ_0_EN || s_irq_status & S_GP_IRQ_1_EN) {
>> +               if (s_irq_status & S_GP_IRQ_0_EN)
>> +                       uport->icount.parity++;
>> +               drop_rx = true;
>> +       } else if (s_irq_status & S_GP_IRQ_2_EN ||
>> +                                       s_irq_status & S_GP_IRQ_3_EN) {
>> +               uport->icount.brk++;
> 
> Maybe move this stat accounting to the place where brk is handled?
Since other error accounting like overrun, parity are happening here, it
feels logical to keep that accounting here.
> 
>> +               port->brk = true;
>> +       }
>> +
>> +       if (s_irq_status & S_RX_FIFO_WATERMARK_EN ||
>> +                                       s_irq_status & S_RX_FIFO_LAST_EN)
>> +               qcom_geni_serial_handle_rx(uport, drop_rx);
>> +
>> +out_unlock:
>> +       spin_unlock_irqrestore(&uport->lock, flags);
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static int get_tx_fifo_size(struct qcom_geni_serial_port *port)
>> +{
>> +       struct uart_port *uport;
>> +
>> +       if (!port)
>> +               return -ENODEV;
> 
> This happens?
It should not happen. I will remove the check.
> 
>> +
>> +       uport = &port->uport;
>> +       port->tx_fifo_depth = geni_se_get_tx_fifo_depth(&port->se);
>> +       port->tx_fifo_width = geni_se_get_tx_fifo_width(&port->se);
>> +       port->rx_fifo_depth = geni_se_get_rx_fifo_depth(&port->se);
>> +       uport->fifosize =
>> +               (port->tx_fifo_depth * port->tx_fifo_width) / BITS_PER_BYTE;
>> +       return 0;
>> +}
>> +
> [...]
>> +
>> +#ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
>> +static int __init qcom_geni_console_setup(struct console *co, char *options)
>> +{
>> +       struct uart_port *uport;
>> +       struct qcom_geni_serial_port *port;
>> +       int baud;
>> +       int bits = 8;
>> +       int parity = 'n';
>> +       int flow = 'n';
>> +
>> +       if (co->index >= GENI_UART_CONS_PORTS  || co->index < 0)
>> +               return -ENXIO;
>> +
>> +       port = get_port_from_line(co->index);
>> +       if (IS_ERR(port)) {
>> +               pr_err("Invalid line %d(%d)\n", co->index, (int)PTR_ERR(port));
> 
> Use %ld to avoid casting the error value? Or just don't print it at all
> because it doesn't really help the end user.
Currently get_port_from_line returns only one error code. So I will
remove it from printing.
> 
>> +               return PTR_ERR(port);
>> +       }
>> +
>> +       uport = &port->uport;
>> +
>> +       if (unlikely(!uport->membase))
>> +               return -ENXIO;
>> +
>> +       if (geni_se_resources_on(&port->se)) {
>> +               dev_err(port->se.dev, "Error turning on resources\n");
>> +               return -ENXIO;
>> +       }
>> +
>> +       if (unlikely(geni_se_read_proto(&port->se) != GENI_SE_UART)) {
>> +               geni_se_resources_off(&port->se);
>> +               return -ENXIO;
>> +       }
>> +
>> +       if (!port->setup) {
>> +               port->tx_bytes_pw = 1;
>> +               port->rx_bytes_pw = RX_BYTES_PW;
>> +               qcom_geni_serial_stop_rx(uport);
>> +               qcom_geni_serial_port_setup(uport);
>> +       }
>> +
>> +       if (options)
>> +               uart_parse_options(options, &baud, &parity, &bits, &flow);
>> +
>> +       return uart_set_options(uport, co, baud, parity, bits, flow);
>> +}
> [..]
>> +
>> +static int qcom_geni_serial_probe(struct platform_device *pdev)
>> +{
>> +       int ret = 0;
>> +       int line = -1;
>> +       struct qcom_geni_serial_port *port;
>> +       struct uart_port *uport;
>> +       struct resource *res;
>> +
>> +       if (pdev->dev.of_node)
>> +               line = of_alias_get_id(pdev->dev.of_node, "serial");
>> +       else
>> +               line = pdev->id;
> 
> Do we need to support the non-alias method?
Sorry, I forgot to remove the else part. I remember we agreed to go the
alias method.
> 
>> +
>> +       if (line < 0 || line >= GENI_UART_CONS_PORTS)
>> +               return -ENXIO;
>> +       port = get_port_from_line(line);
>> +       if (IS_ERR(port)) {
>> +               ret = PTR_ERR(port);
>> +               dev_err(&pdev->dev, "Invalid line %d(%d)\n", line, ret);
>> +               return ret;
>> +       }
>> +
>> +       uport = &port->uport;
>> +       /* Don't allow 2 drivers to access the same port */
>> +       if (uport->private_data)
>> +               return -ENODEV;
>> +
>> +       uport->dev = &pdev->dev;
>> +       port->se.dev = &pdev->dev;
>> +       port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
>> +       port->se.clk = devm_clk_get(&pdev->dev, "se");
>> +       if (IS_ERR(port->se.clk)) {
>> +               ret = PTR_ERR(port->se.clk);
>> +               dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       if (IS_ERR(res))
>> +               return PTR_ERR(res);
>> +       uport->mapbase = res->start;
>> +
>> +       port->tx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>> +       port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>> +       port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>> +
>> +       uport->irq = platform_get_irq(pdev, 0);
>> +       if (uport->irq < 0) {
>> +               dev_err(&pdev->dev, "Failed to get IRQ %d\n", uport->irq);
>> +               return uport->irq;
>> +       }
>> +
>> +       uport->private_data = &qcom_geni_console_driver;
>> +       platform_set_drvdata(pdev, port);
>> +       port->handle_rx = handle_rx_console;
>> +       port->setup = false;
> 
> This would be set to false already?
Yes, it should be set to false already. This is redundant.
> 
>> +       return uart_add_one_port(&qcom_geni_console_driver, uport);
>> +}
>> +
>> +static int qcom_geni_serial_remove(struct platform_device *pdev)
>> +{
>> +       struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
>> +       struct uart_driver *drv = port->uport.private_data;
>> +
>> +       uart_remove_one_port(drv, &port->uport);
>> +       return 0;
>> +}
>> +
>> +static int __maybe_unused qcom_geni_serial_sys_suspend_noirq(struct device *dev)
>> +{
>> +       struct platform_device *pdev = to_platform_device(dev);
>> +       struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
>> +       struct uart_port *uport = &port->uport;
>> +
>> +       uart_suspend_port(uport->private_data, uport);
>> +       return 0;
>> +}
>> +
>> +static int __maybe_unused qcom_geni_serial_sys_resume_noirq(struct device *dev)
>> +{
>> +       struct platform_device *pdev = to_platform_device(dev);
>> +       struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
>> +       struct uart_port *uport = &port->uport;
>> +
>> +       if (console_suspend_enabled && uport->suspended) {
>> +               uart_resume_port(uport->private_data, uport);
>> +               disable_irq(uport->irq);
> 
> I missed the enable_irq() part. Is this still necessary?
Suspending the uart console port invokes the uart port shutdown
operation. The shutdown operation disables and frees the concerned IRQ.
Resuming the uart console port invokes the uart port startup operation
which requests for the IRQ. The request_irq operation auto-enables the
IRQ. In addition, resume_noirq implicitly enables the IRQ. This leads to
an unbalanced IRQ enable warning.

This disable_irq() helps with suppressing that warning.
> 
>> +       }
>> +       return 0;
>> +}
>> +
>> +static int __init qcom_geni_serial_init(void)
>> +{
>> +       int ret;
>> +
>> +       qcom_geni_console_port.uport.iotype = UPIO_MEM;
>> +       qcom_geni_console_port.uport.ops = &qcom_geni_console_pops;
>> +       qcom_geni_console_port.uport.flags = UPF_BOOT_AUTOCONF;
>> +       qcom_geni_console_port.uport.line = 0;
> 
> Why can't this be done statically?
It can be done statically.
>> +
>> +       ret = console_register(&qcom_geni_console_driver);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = platform_driver_register(&qcom_geni_serial_platform_driver);
>> +       if (ret)
>> +               console_unregister(&qcom_geni_console_driver);
>> +       return ret;
>> +}
>> +module_init(qcom_geni_serial_init);
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
