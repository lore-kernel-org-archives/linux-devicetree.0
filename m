Return-Path: <SRS0=l6ey=GG=chromium.org=evgreen@kernel.org>
MIME-Version: 1.0
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-5-git-send-email-kramasub@codeaurora.org>
 <CAE=gft4Hwqq2gx+b9AmiX1ZZBrSt1Ca2E48JV77wpcQQT0060w@mail.gmail.com> <9a12ffe5-5168-8d73-82c9-93914c50de51@codeaurora.org>
In-Reply-To: <9a12ffe5-5168-8d73-82c9-93914c50de51@codeaurora.org>
From: Evan Green <evgreen@chromium.org>
Date: Fri, 16 Mar 2018 18:39:55 +0000
Message-ID: <CAE=gft6Ypfuw3rVZi2gWf2Nvjh0NO7hKPmmi5h8--kJOYUvmDQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] tty: serial: msm_geni_serial: Add serial driver
 support for GENI based QUP
Content-Type: text/plain; charset="UTF-8"
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de, gregkh@linuxfoundation.org, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, acourbot@chromium.org, Girish Mahadevan <girishm@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Doug Anderson <dianders@google.com>
List-ID: <devicetree@vger.kernel.org>

Hi Karthik,

On Tue, Mar 13, 2018 at 1:16 PM Karthik Ramasubramanian <
kramasub@codeaurora.org> wrote:



> On 3/2/2018 5:11 PM, Evan Green wrote:
> >> +
> >> +#ifdef CONFIG_CONSOLE_POLL
> >> +#define RX_BYTES_PW 1
> >> +#else
> >> +#define RX_BYTES_PW 4
> >> +#endif
> >
> > This seems fishy to me. Does either setting work? If so, why not just
> > have one value?
> Yes, either one works. In the interrupt driven mode, sometimes due to
> increased interrupt latency the RX FIFO may overflow if we use only 1
> byte per FIFO word - given there are no flow control lines in the debug
> uart. Hence using 4 bytes in the FIFO word will help to prevent the FIFO
> overflow - especially in the case where commands are executed through
> scripts.
> In polling mode, using 1 byte per word helps to use the hardware to
> buffer the data instead of software buffering especially when the
> framework keeps reading one byte at a time.

Ok, I think I understand. Let me paraphrase in case I'm wrong: Normally,
you want all 4 bytes per word so that you use the hardware's full FIFO
capability. This works out well since on receive you tell the system how
many bytes you've received, so you're never stuck with leftover bytes.

In polling mode, however, the system asks you for one byte, and the problem
is with 4 bytes per FIFO word you may end up having read three additional
bytes that you don't know what to do with. Configuring the UART to 1 byte
per word allows you to skip coding up a couple of conditionals and an extra
couple u32s in the device struct for saving those extra bytes, but divides
the hardware FIFO size by 4.

It seems a little cheesy to me just to avoid a bit of logic, but I'm not
going to put my foot down about it. I guess it might get complicated when
the console pulls in four bytes, but then only ends up eating one of them,
and then we have to figure out how to get the other three into the normal
ISR-based path.

> >
> >> +static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
> >> +                               int offset, int bit_field, bool set)
> >> +{
> >> +       u32 reg;
> >> +       struct qcom_geni_serial_port *port;
> >> +       unsigned int baud;
> >> +       unsigned int fifo_bits;
> >> +       unsigned long timeout_us = 20000;
> >> +
> >> +       /* Ensure polling is not re-ordered before the prior
writes/reads */
> >> +       mb();
> >> +
> >> +       if (uport->private_data) {
> >> +               port = to_dev_port(uport, uport);
> >> +               baud = port->cur_baud;
> >> +               if (!baud)
> >> +                       baud = 115200;
> >> +               fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
> >> +               /*
> >> +                * Total polling iterations based on FIFO worth of
bytes to be
> >> +                * sent at current baud .Add a little fluff to the
wait.
> >> +                */
> >> +               timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;
> >
> > This fluff is a little mysterious, can it be explained at all? Do you
> > think the fluff factor is in units of time (as you have it) or bits?
> > Time makes sense I guess if we're worried about clock source
> > differences.
> The fluff is in micro-seconds and can help with unforeseen delays in
> emulation platforms.

So emulated platforms go out to lunch, but that generally doesn't depend on
baud rate or how many bits there are. Ok. Might be worth noting what that's
for.

> >
> >> +
> >> +static void qcom_geni_serial_console_write(struct console *co, const
char *s,
> >> +                             unsigned int count)
> >> +{
> >> +       struct uart_port *uport;
> >> +       struct qcom_geni_serial_port *port;
> >> +       bool locked = true;
> >> +       unsigned long flags;
> >> +
> >> +       WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
> >> +
> >> +       port = get_port_from_line(co->index);
> >> +       if (IS_ERR(port))
> >> +               return;
> >> +
> >> +       uport = &port->uport;
> >> +       if (oops_in_progress)
> >> +               locked = spin_trylock_irqsave(&uport->lock, flags);
> >> +       else
> >> +               spin_lock_irqsave(&uport->lock, flags);
> >> +
> >> +       if (locked) {
> >> +               __qcom_geni_serial_console_write(uport, s, count);
> >> +               spin_unlock_irqrestore(&uport->lock, flags);
> >
> > I too am a little lost on the locking here. What exactly is the lock
> > protecting? Looks like for the most part it's trying to synchronize
> > with the ISR? What specifically in the ISR? I just wanted to go
> > through and check to make sure whatever the shared resource is is
> > appropriately protected.
> The lock protects 2 simultaneous writers from putting the hardware in
> the bad state. The output of the command entered in a shell can trigger
> a write in the interrupt context while logging activity can trigger a
> simultaneous write.

Can you be any more specific here? What puts the hardware in a bad state?
Maybe I see what you're referring to, where both writers see the FIFO has
space and then end up overrunning it because they both add to it.
Similarly, you wouldn't want both the ISR and the polling code to read the
FIFO status and pull bytes out of the FIFO on rx.

If it's the FIFO that's being protected, then:
1. What about qcom_geni_serial_poll_put_char? It writes to the FIFO but
appears not to be locked when called directly via uart_ops. Up in
serial_core.c it looks like that lock is used for configuration changes,
but not transmit.
2. Same with qcom_geni_serial_get_char.

Based on your comment below, I'm coming to understand that the lock is
protecting the FIFO, whose state is partially in the IRQ_STATUS registers.
Shutdown and the ISR alter those bits, so that's why they're locked. This
finally makes sense to me, but took a lot of work to figure out. The lock
doesn't protect all of the bits in the IRQ registers, just a couple of
bits. Perhaps a comment somewhere indicating exactly what is being
protected (the FIFO, and the FIFO status bits specifically in the IRQ
registers) would be helpful to future folks trying to understand.

> >
> >> +       }
> >> +}
> >> +
> >> +static int handle_rx_console(struct uart_port *uport, u32 rx_bytes,
bool drop)
> >> +{
> >> +       u32 i = rx_bytes;
> >> +       u32 rx_fifo;
> >> +       unsigned char *buf;
> >> +       struct tty_port *tport;
> >> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> >> +
> >> +       tport = &uport->state->port;
> >> +       while (i > 0) {
> >> +               int c;
> >> +               int bytes = i > port->rx_bytes_pw ? port->rx_bytes_pw
: i;
> >
> > Please replace this with a min macro.
> Ok.
> >
> >> +static int qcom_geni_serial_handle_tx(struct uart_port *uport)
> >> +{
> >> +       int ret = 0;
> >> +       struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> >> +       struct circ_buf *xmit = &uport->state->xmit;
> >> +       size_t avail;
> >> +       size_t remaining;
> >> +       int i = 0;
> >> +       u32 status;
> >> +       unsigned int chunk;
> >> +       int tail;
> >> +
> >> +       chunk = uart_circ_chars_pending(xmit);
> >> +       status = readl_relaxed(uport->membase +
SE_GENI_TX_FIFO_STATUS);
> >> +       /* Both FIFO and framework buffer are drained */
> >> +       if ((chunk == port->xmit_size) && !status) {
> >> +               port->xmit_size = 0;
> >> +               uart_circ_clear(xmit);
> >> +               qcom_geni_serial_stop_tx(uport);
> >> +               goto out_write_wakeup;
> >> +       }
> >> +       chunk -= port->xmit_size;
> >> +
> >> +       avail = (port->tx_fifo_depth - port->tx_wm) *
port->tx_bytes_pw;
> >> +       tail = (xmit->tail + port->xmit_size) & (UART_XMIT_SIZE - 1);
> >> +       if (chunk > (UART_XMIT_SIZE - tail))
> >> +               chunk = UART_XMIT_SIZE - tail;
> >> +       if (chunk > avail)
> >> +               chunk = avail;
> >> +
> >> +       if (!chunk)
> >> +               goto out_write_wakeup;
> >> +
> >> +       qcom_geni_serial_setup_tx(uport, chunk);
> >> +
> >> +       remaining = chunk;
> >> +       while (i < chunk) {
> >> +               unsigned int tx_bytes;
> >> +               unsigned int buf = 0;
> >> +               int c;
> >> +
> >> +               tx_bytes = min_t(size_t, remaining,
(size_t)port->tx_bytes_pw);
> >> +               for (c = 0; c < tx_bytes ; c++)
> >> +                       buf |= (xmit->buf[tail + c] << (c *
BITS_PER_BYTE));
> >> +
> >> +               writel_relaxed(buf, uport->membase + SE_GENI_TX_FIFOn);
> >> +
> >> +               i += tx_bytes;
> >> +               tail = (tail + tx_bytes) & (UART_XMIT_SIZE - 1);
> >> +               uport->icount.tx += tx_bytes;
> >> +               remaining -= tx_bytes;
> >> +       }
> >> +       qcom_geni_serial_poll_tx_done(uport);
> >> +       port->xmit_size += chunk;
> >> +out_write_wakeup:
> >> +       uart_write_wakeup(uport);
> >> +       return ret;
> >> +}
> >
> > This function can't fail, please change the return type to void.
> Ok.
> >
> >> +
> >> +static void qcom_geni_serial_shutdown(struct uart_port *uport)
> >> +{
> >> +       unsigned long flags;
> >> +
> >> +       /* Stop the console before stopping the current tx */
> >> +       console_stop(uport->cons);
> >> +
> >> +       disable_irq(uport->irq);
> >> +       free_irq(uport->irq, uport);
> >> +       spin_lock_irqsave(&uport->lock, flags);
> >> +       qcom_geni_serial_stop_tx(uport);
> >> +       qcom_geni_serial_stop_rx(uport);
> >> +       spin_unlock_irqrestore(&uport->lock, flags);
> >
> > This is one part of where I'm confused. What are we protecting here
> > with the lock? disable_irq waits for any pending ISRs to finish
> > according to its comment, so you know you're not racing with the ISR.
> In android, console shutdown can be invoked while console write happens.
> This lock prevents shutdown from not interfering with the write and
> vice-versa.

-Evan
