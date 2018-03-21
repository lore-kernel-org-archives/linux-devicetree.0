Return-Path: <SRS0=vTV3=GL=chromium.org=swboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <23359b7c-6760-9cca-4c99-b08b3e79fa7a@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-5-git-send-email-kramasub@codeaurora.org>
 <152156025613.254778.431774948232120027@swboyd.mtv.corp.google.com>
 <23359b7c-6760-9cca-4c99-b08b3e79fa7a@codeaurora.org>
Message-ID: <152165280040.91116.1976061062009791598@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 4/6] tty: serial: msm_geni_serial: Add serial driver support
 for GENI based QUP
Date: Wed, 21 Mar 2018 10:20:00 -0700
To: Karthik Ramasubramanian <kramasub@codeaurora.org>, andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org, Girish Mahadevan <girishm@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Doug Anderson <dianders@google.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Karthik Ramasubramanian (2018-03-20 15:53:25)
> =

> =

> On 3/20/2018 9:37 AM, Stephen Boyd wrote:
> > Quoting Karthikeyan Ramasubramanian (2018-03-14 16:58:49)
> >> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/seria=
l/qcom_geni_serial.c
> >> new file mode 100644
> >> index 0000000..1442777
> >> --- /dev/null
> >> +++ b/drivers/tty/serial/qcom_geni_serial.c
> >> @@ -0,0 +1,1158 @@
> >> +
> >> +#ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
> >> +static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
> >> +{
> >> +       writel_relaxed(ch, uport->membase + SE_GENI_TX_FIFOn);
> > =

> > Does this expect the whole word to have data to write? Or does the FIFO
> > output a character followed by three NUL bytes each time it gets
> > written? The way that uart_console_write() works is to take each
> > character a byte at a time, put it into an int (so extend that byte with
> > zero) and then pass it to the putchar function. I would expect that at
> > this point the hardware sees the single character and then 3 NULs enter
> > the FIFO each time.
> > =

> > For previous MSM uarts I had to handle this oddity by packing the words
> > into the fifo four at a time. You may need to do the same here.
> The packing configuration 1 * 8 (done using geni_se_config_packing)
> ensures that only one byte per FIFO word needs to be transmitted. From
> that perspective, we need not have such oddity.

Ok! That's good to hear.

> > =

> > Can you also support the OF_EARLYCON_DECLARE method of console writing
> > so we can get an early printk style debug console?
> Do you prefer that as part of this patch itself or is it ok if I upload
> the earlycon support once this gets merged.

I think this already got merged? So just split it out into another patch
would be fine. I see the config is already selecting the earlycon
support so it must be planned.

> > =

> > =

> >> +
> >> +       spin_lock_irqsave(&uport->lock, flags);
> >> +       m_irq_status =3D readl_relaxed(uport->membase + SE_GENI_M_IRQ_=
STATUS);
> >> +       s_irq_status =3D readl_relaxed(uport->membase + SE_GENI_S_IRQ_=
STATUS);
> >> +       m_irq_en =3D readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> >> +       writel_relaxed(m_irq_status, uport->membase + SE_GENI_M_IRQ_CL=
EAR);
> >> +       writel_relaxed(s_irq_status, uport->membase + SE_GENI_S_IRQ_CL=
EAR);
> >> +
> >> +       if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
> >> +               goto out_unlock;
> >> +
> >> +       if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
> >> +               uport->icount.overrun++;
> >> +               tty_insert_flip_char(tport, 0, TTY_OVERRUN);
> >> +       }
> >> +
> >> +       if (m_irq_status & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN) &&
> >> +           m_irq_en & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
> >> +               qcom_geni_serial_handle_tx(uport);
> >> +
> >> +       if (s_irq_status & S_GP_IRQ_0_EN || s_irq_status & S_GP_IRQ_1_=
EN) {
> >> +               if (s_irq_status & S_GP_IRQ_0_EN)
> >> +                       uport->icount.parity++;
> >> +               drop_rx =3D true;
> >> +       } else if (s_irq_status & S_GP_IRQ_2_EN ||
> >> +                                       s_irq_status & S_GP_IRQ_3_EN) {
> >> +               uport->icount.brk++;
> > =

> > Maybe move this stat accounting to the place where brk is handled?
> Since other error accounting like overrun, parity are happening here, it
> feels logical to keep that accounting here.

Alright.

> >> +       return uart_add_one_port(&qcom_geni_console_driver, uport);
> >> +}
> >> +
> >> +static int qcom_geni_serial_remove(struct platform_device *pdev)
> >> +{
> >> +       struct qcom_geni_serial_port *port =3D platform_get_drvdata(pd=
ev);
> >> +       struct uart_driver *drv =3D port->uport.private_data;
> >> +
> >> +       uart_remove_one_port(drv, &port->uport);
> >> +       return 0;
> >> +}
> >> +
> >> +static int __maybe_unused qcom_geni_serial_sys_suspend_noirq(struct d=
evice *dev)
> >> +{
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       struct qcom_geni_serial_port *port =3D platform_get_drvdata(pd=
ev);
> >> +       struct uart_port *uport =3D &port->uport;
> >> +
> >> +       uart_suspend_port(uport->private_data, uport);
> >> +       return 0;
> >> +}
> >> +
> >> +static int __maybe_unused qcom_geni_serial_sys_resume_noirq(struct de=
vice *dev)
> >> +{
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       struct qcom_geni_serial_port *port =3D platform_get_drvdata(pd=
ev);
> >> +       struct uart_port *uport =3D &port->uport;
> >> +
> >> +       if (console_suspend_enabled && uport->suspended) {
> >> +               uart_resume_port(uport->private_data, uport);
> >> +               disable_irq(uport->irq);
> > =

> > I missed the enable_irq() part. Is this still necessary?
> Suspending the uart console port invokes the uart port shutdown
> operation. The shutdown operation disables and frees the concerned IRQ.
> Resuming the uart console port invokes the uart port startup operation
> which requests for the IRQ. The request_irq operation auto-enables the
> IRQ. In addition, resume_noirq implicitly enables the IRQ. This leads to
> an unbalanced IRQ enable warning.
> =

> This disable_irq() helps with suppressing that warning.

That's not obvious so we need a big comment here.

I thought we would move this to the normal suspend/resume callbacks and
skip the noirq variants. That would make this disable_irq() unnecessary
then?

BTW, free_irq() should disable the irq itself, so it looks odd to have a
disable_irq() followed directly by a free_irq().
