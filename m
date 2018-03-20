Return-Path: <SRS0=d/5x=GK=chromium.org=evgreen@kernel.org>
MIME-Version: 1.0
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org> <1521071931-9294-5-git-send-email-kramasub@codeaurora.org>
In-Reply-To: <1521071931-9294-5-git-send-email-kramasub@codeaurora.org>
From: Evan Green <evgreen@chromium.org>
Date: Tue, 20 Mar 2018 18:39:18 +0000
Message-ID: <CAE=gft7QAE0+3YpLu9BL2uvN=A0YgF=Xp2ocmbX=pvwszWtZew@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] tty: serial: msm_geni_serial: Add serial driver
 support for GENI based QUP
Content-Type: text/plain; charset="UTF-8"
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de, gregkh@linuxfoundation.org, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, acourbot@chromium.org, swboyd@chromium.org, Girish Mahadevan <girishm@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Doug Anderson <dianders@google.com>
List-ID: <devicetree@vger.kernel.org>

Hi Karthik,

On Wed, Mar 14, 2018 at 4:59 PM Karthikeyan Ramasubramanian <
kramasub@codeaurora.org> wrote:

> +
> +static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> +                               int offset, int field, bool set)
> +{
> +       u32 reg;
> +       struct qcom_geni_serial_port *port;
> +       unsigned int baud;
> +       unsigned int fifo_bits;
> +       unsigned long timeout_us = 20000;
> +
> +       /* Ensure polling is not re-ordered before the prior writes/reads
*/
> +       mb();

These barriers sprinkled around everywhere are new. Did
you find that you needed them for something? In this case, the
readl_poll_timeout_atomic should already have a read barrier (nor do you
probably care about read reordering, right?) Perhaps this should
only be a mmiowb rather than a full barrier, because you really just want
to say "make sure all my old writes got out to hardware before spinning"

> +
> +       if (uport->private_data) {
> +               port = to_dev_port(uport, uport);
> +               baud = port->baud;
> +               if (!baud)
> +                       baud = 115200;
> +               fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
> +               /*
> +                * Total polling iterations based on FIFO worth of bytes
to be
> +                * sent at current baud. Add a little fluff to the wait.
> +                */
> +               timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;
> +       }
> +
> +       return !readl_poll_timeout_atomic(uport->membase + offset, reg,
> +                        (bool)(reg & field) == set, 10, timeout_us);
> +}
[...]
> +
> +static void qcom_geni_serial_start_tx(struct uart_port *uport)
> +{
> +       u32 irq_en;
> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> +       u32 status;
> +
> +       if (port->xfer_mode == GENI_SE_FIFO) {
> +               status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> +               if (status & M_GENI_CMD_ACTIVE)
> +                       return;
> +
> +               if (!qcom_geni_serial_tx_empty(uport))
> +                       return;
> +
> +               /*
> +                * Ensure writing to IRQ_EN & watermark registers are not
> +                * re-ordered before checking the status of the Serial
> +                * Engine and TX FIFO
> +                */
> +               mb();

Here's another one. You should just be able to use a regular readl when
reading SE_GENI_STATUS and remove this barrier, since readl has an rmb
which orders your read of M_IRQ_EN below. I don't think you need to worry
about the writes below going above the read above, since there's logic in
between that needs the result of the read. Maybe that also saves you in the
read case, too. Either way, this barrier seems heavy handed.

> +
> +               irq_en = readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> +               irq_en |= M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN;
> +
> +               writel_relaxed(port->tx_wm, uport->membase +
> +                                               SE_GENI_TX_WATERMARK_REG);
> +               writel_relaxed(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> +       }
> +}
> +
> +static void qcom_geni_serial_stop_tx(struct uart_port *uport)
> +{
> +       u32 irq_en;
> +       u32 status;
> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> +
> +       irq_en = readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> +       irq_en &= ~M_CMD_DONE_EN;
> +       if (port->xfer_mode == GENI_SE_FIFO) {
> +               irq_en &= ~M_TX_FIFO_WATERMARK_EN;
> +               writel_relaxed(0, uport->membase +
> +                                    SE_GENI_TX_WATERMARK_REG);
> +       }
> +       port->xmit_size = 0;
> +       writel_relaxed(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> +       /* Possible stop tx is called multiple times. */
> +       if (!(status & M_GENI_CMD_ACTIVE))
> +               return;
> +
> +       /*
> +        * Ensure cancel command write is not re-ordered before checking
> +        * the status of the Primary Sequencer.
> +        */
> +       mb();

I don't see how what's stated in your comment could happen, as that would
be a logic error. This barrier seems unneeded to me.

> +
> +       geni_se_cancel_m_cmd(&port->se);
> +       if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> +                                               M_CMD_CANCEL_EN, true)) {
> +               geni_se_abort_m_cmd(&port->se);
> +               qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
> +                                               M_CMD_ABORT_EN, true);
> +               writel_relaxed(M_CMD_ABORT_EN, uport->membase +
> +
SE_GENI_M_IRQ_CLEAR);
> +       }
> +       writel_relaxed(M_CMD_CANCEL_EN, uport->membase +
SE_GENI_M_IRQ_CLEAR);
> +}
> +
> +static void qcom_geni_serial_start_rx(struct uart_port *uport)
> +{
> +       u32 irq_en;
> +       u32 status;
> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> +
> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> +       if (status & S_GENI_CMD_ACTIVE)
> +               qcom_geni_serial_stop_rx(uport);
> +
> +       /*
> +        * Ensure setup command write is not re-ordered before checking
> +        * the status of the Secondary Sequencer.
> +        */
> +       mb();

Also here, I think the reordering you're worried about would mean the CPU
is executing incorrectly.

> +
> +       geni_se_setup_s_cmd(&port->se, UART_START_READ, 0);
> +
> +       if (port->xfer_mode == GENI_SE_FIFO) {
> +               irq_en = readl_relaxed(uport->membase + SE_GENI_S_IRQ_EN);
> +               irq_en |= S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN;
> +               writel_relaxed(irq_en, uport->membase + SE_GENI_S_IRQ_EN);
> +
> +               irq_en = readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> +               irq_en |= M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN;
> +               writel_relaxed(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> +       }
> +}
> +
> +static void qcom_geni_serial_stop_rx(struct uart_port *uport)
> +{
> +       u32 irq_en;
> +       u32 status;
> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> +       u32 irq_clear = S_CMD_DONE_EN;
> +
> +       if (port->xfer_mode == GENI_SE_FIFO) {
> +               irq_en = readl_relaxed(uport->membase + SE_GENI_S_IRQ_EN);
> +               irq_en &= ~(S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN);
> +               writel_relaxed(irq_en, uport->membase + SE_GENI_S_IRQ_EN);
> +
> +               irq_en = readl_relaxed(uport->membase + SE_GENI_M_IRQ_EN);
> +               irq_en &= ~(M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
> +               writel_relaxed(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> +       }
> +
> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> +       /* Possible stop rx is called multiple times. */
> +       if (!(status & S_GENI_CMD_ACTIVE))
> +               return;
> +
> +       /*
> +        * Ensure cancel command write is not re-ordered before checking
> +        * the status of the Secondary Sequencer.
> +        */
> +       mb();

Same deal here.

> +
> +       geni_se_cancel_s_cmd(&port->se);
> +       qcom_geni_serial_poll_bit(uport, SE_GENI_S_CMD_CTRL_REG,
> +                                       S_GENI_CMD_CANCEL, false);
> +       status = readl_relaxed(uport->membase + SE_GENI_STATUS);
> +       writel_relaxed(irq_clear, uport->membase + SE_GENI_S_IRQ_CLEAR);
> +       if (status & S_GENI_CMD_ACTIVE)
> +               qcom_geni_serial_abort_rx(uport);
> +}
> +

Sorry gmail decided to wrap some of the context lines.
-Evan
