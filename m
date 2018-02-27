Return-Path: <SRS0=gq3n=FV=codeaurora.org=kramasub@kernel.org>
Subject: Re: [PATCH v2 7/7] tty: serial: msm_geni_serial: Add serial driver
 support for GENI based QUP
References: <1515805547-22816-1-git-send-email-kramasub@codeaurora.org>
 <1515805547-22816-8-git-send-email-kramasub@codeaurora.org>
 <20180119071213.GB30353@minitux>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <df9e2fb7-8edf-0704-beed-aa787cc6412d@codeaurora.org>
Date: Tue, 27 Feb 2018 08:07:10 -0700
MIME-Version: 1.0
In-Reply-To: <20180119071213.GB30353@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de, gregkh@linuxfoundation.org, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, Girish Mahadevan <girishm@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>



On 1/19/2018 12:12 AM, Bjorn Andersson wrote:
> On Fri 12 Jan 17:05 PST 2018, Karthikeyan Ramasubramanian wrote:
> 
>> This driver supports GENI based UART Controller in the Qualcomm SOCs. The
>> Qualcomm Generic Interface (GENI) is a programmable module supporting a
>> wide range of serial interfaces including UART. This driver support console
>> operations using FIFO mode of transfer.
>>
>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> 
> Please disregard my previous answer to this patch, I hit the wrong key
> combo while stashing my reply.
> 
>> ---
>>   drivers/tty/serial/Kconfig            |   10 +
>>   drivers/tty/serial/Makefile           |    1 +
>>   drivers/tty/serial/qcom_geni_serial.c | 1414 +++++++++++++++++++++++++++++++++
>>   3 files changed, 1425 insertions(+)
>>   create mode 100644 drivers/tty/serial/qcom_geni_serial.c
>>
>> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
>> index b788fee..1be30e5 100644
>> --- a/drivers/tty/serial/Kconfig
>> +++ b/drivers/tty/serial/Kconfig
>> @@ -1098,6 +1098,16 @@ config SERIAL_MSM_CONSOLE
>>   	select SERIAL_CORE_CONSOLE
>>   	select SERIAL_EARLYCON
>>   
>> +config SERIAL_QCOM_GENI
>> +	tristate "QCOM on-chip GENI based serial port support"
>> +	depends on ARCH_QCOM
> 
> depend on the GENI wrapper as well.
Ok.
> 
> [..]
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
>> new file mode 100644
>> index 0000000..0dbd329
>> --- /dev/null
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -0,0 +1,1414 @@
>> +/*
>> + * Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
> 
> SPDX license header.
Ok.
> 
>> +
>> +#include <linux/bitmap.h>
> 
> Unused
> 
>> +#include <linux/bitops.h>
> 
> Unused?
Ok, I will remove the unused header files.
> 
>> +#include <linux/delay.h>
>> +#include <linux/console.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/qcom-geni-se.h>
>> +#include <linux/serial.h>
>> +#include <linux/serial_core.h>
>> +#include <linux/slab.h>
>> +#include <linux/tty.h>
>> +#include <linux/tty_flip.h>
>> +
>> +/* UART specific GENI registers */
>> +#define SE_UART_TX_TRANS_CFG		(0x25C)
> 
> Drop the parenthesis
Ok.
> 
> [..]
>> +static int owr;
>> +module_param(owr, int, 0644);
> 
> What's this?
It is not required. I will drop it.
> 
>> +
>> +struct qcom_geni_serial_port {
>> +	struct uart_port uport;
>> +	char name[20];
>> +	unsigned int tx_fifo_depth;
> 
> size_t is a good type for keeping track of sizes.
Since these are values read from registers, I will keep the type as u32.
> 
>> +	unsigned int tx_fifo_width;
>> +	unsigned int rx_fifo_depth;
>> +	unsigned int tx_wm;
>> +	unsigned int rx_wm;
>> +	unsigned int rx_rfr;
> 
> size_t for sizes.
> 
>> +	int xfer_mode;
>> +	bool port_setup;
>> +	unsigned int *rx_fifo;
> 
> The fifo is typeless, so it should be void *. It is however only ever
> used as a local variable in handle_rx_console() so drop this.
I will drop it for now. It most likely will get re-introduced later with 
the non-console UART patch.
> 
>> +	int (*handle_rx)(struct uart_port *uport,
>> +			unsigned int rx_fifo_wc,
>> +			unsigned int rx_last_byte_valid,
>> +			unsigned int rx_last,
>> +			bool drop_rx);
>> +	struct device *wrapper_dev;
>> +	struct geni_se_rsc serial_rsc;
>> +	unsigned int xmit_size;
> 
> In other drivers we read bytes of the xmit buffer at xmit->tail, write
> to hardware FIFO and update xmit->tail. Why do you keep a going delta
> between the tail and our real tail?
If the console log buffer size is very high, then updating the tail in a 
live manner leads to this driver getting flooded and extremely busy. 
Hence it does not yield the CPU for 10s of seconds. This approach 
introduces some sort of flow control between the console driver and this 
UART controller driver.
> 
>> +	void *rx_buf;
>> +	unsigned int cur_baud;
>> +};
>> +
> [..]
>> +
>> +#define GET_DEV_PORT(uport) \
>> +	container_of(uport, struct qcom_geni_serial_port, uport)
> 
> The idiomatic name for this macro would be something like "to_dev_port".
Ok.
> 
> The use of "uport" as macro parameter makes this only work if the
> parameter is "uport", otherwise the macro will replace the last part of
> the container_of as well.
Ok.
> 
> [..]
>> +static struct qcom_geni_serial_port *get_port_from_line(int line)
>> +{
>> +	struct qcom_geni_serial_port *port = NULL;
>> +
>> +	if ((line < 0) || (line >= GENI_UART_CONS_PORTS))
>> +		port = ERR_PTR(-ENXIO);
> 
> You need to return here as well...
> 
>> +	port = &qcom_geni_console_port;
>> +	return port;
> 
> Drop the "port" and just return ERR_PTR(-ENXIO) in the error case and
> return &qcom_geni_serial_port otherwise.
Ok.
> 
>> +}
>> +
>> +static int qcom_geni_serial_poll_bit(struct uart_port *uport,
>> +				int offset, int bit_field, bool set)
> 
> This function is returning "yes" or "no", so make it return "bool"
Ok.
> 
>> +{
>> +	int iter = 0;
>> +	unsigned int reg;
>> +	bool met = false;
>> +	struct qcom_geni_serial_port *port = NULL;
>> +	bool cond = false;
>> +	unsigned int baud = 115200;
>> +	unsigned int fifo_bits = DEF_FIFO_DEPTH_WORDS * DEF_FIFO_WIDTH_BITS;
>> +	unsigned long total_iter = 2000;
> 
> Don't initialize things that will be assigned directly again.
Ok.
> 
>> +
>> +
>> +	if (uport->private_data) {
> 
> When is this function being called on a non-initialized uport?
When the support for early console gets added, it will not have private 
data.
> 
>> +		port = GET_DEV_PORT(uport);
>> +		baud = (port->cur_baud ? port->cur_baud : 115200);
> 
> Drop the parenthesis, and consider initializing baud = port->cur_baud
> and then give it 115200 if it's zero separately.
Ok.
> 
>> +		fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
>> +		/*
>> +		 * Total polling iterations based on FIFO worth of bytes to be
>> +		 * sent at current baud .Add a little fluff to the wait.
>> +		 */
>> +		total_iter = ((fifo_bits * USEC_PER_SEC) / baud) / 10;
>> +		total_iter += 50;
>> +	}
>> +
>> +	while (iter < total_iter) {
>> +		reg = geni_read_reg_nolog(uport->membase, offset);
>> +		cond = reg & bit_field;
>> +		if (cond == set) {
>> +			met = true;
>> +			break;
>> +		}
>> +		udelay(10);
>> +		iter++;
>> +	}
> 
> Use readl_poll_timeout() instead of all this.
Ok.
> 
>> +	return met;
>> +}
>> +
>> +static void qcom_geni_serial_setup_tx(struct uart_port *uport,
>> +				unsigned int xmit_size)
>> +{
>> +	u32 m_cmd = 0;
> 
> Don't initialize this.
Ok.
> 
>> +
>> +	geni_write_reg_nolog(xmit_size, uport->membase, SE_UART_TX_TRANS_LEN);
>> +	m_cmd |= (UART_START_TX << M_OPCODE_SHFT);
> 
> Why OR this into 0?
I will assign instead of OR.
> 
>> +	geni_write_reg_nolog(m_cmd, uport->membase, SE_GENI_M_CMD0);
>> +	/*
>> +	 * Writes to enable the primary sequencer should go through before
>> +	 * exiting this function.
>> +	 */
>> +	mb();
>> +}
>> +
>> +static void qcom_geni_serial_poll_cancel_tx(struct uart_port *uport)
> 
> This function polls for command done and if that doesn't happen in time
> it aborts the command. It then clear any interrupts. The function name
> however indicates that we're polling for "cancel of tx".
I will rename the function as qcom_geni_serial_poll_tx_done.
> 
>> +{
>> +	int done = 0;
>> +	unsigned int irq_clear = M_CMD_DONE_EN;
>> +	unsigned int geni_status = 0;
> 
> Don't initialize done and geni_status.
Ok.
> 
>> +
>> +	done = qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +						M_CMD_DONE_EN, true);
>> +	if (!done) {
>> +		geni_write_reg_nolog(M_GENI_CMD_ABORT, uport->membase,
>> +					SE_GENI_M_CMD_CTRL_REG);
>> +		owr++;
> 
> What's owr?
It is not required and will be removed.
> 
>> +		irq_clear |= M_CMD_ABORT_EN;
>> +		qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +							M_CMD_ABORT_EN, true);
>> +	}
>> +	geni_status = geni_read_reg_nolog(uport->membase,
>> +						  SE_GENI_STATUS);
> 
> Why is this line wrapped?
I will fix it.
> 
>> +	if (geni_status & M_GENI_CMD_ACTIVE)
>> +		owr++;
>> +	geni_write_reg_nolog(irq_clear, uport->membase, SE_GENI_M_IRQ_CLEAR);
>> +}
>> +
>> +static void qcom_geni_serial_abort_rx(struct uart_port *uport)
>> +{
>> +	unsigned int irq_clear = S_CMD_DONE_EN;
>> +
>> +	geni_se_abort_s_cmd(uport->membase);
>> +	/* Ensure this goes through before polling. */
> 
> Move the mb() to the qcom_geni_serial_poll_bit()
Ok.
> 
>> +	mb();
>> +	irq_clear |= S_CMD_ABORT_EN;
>> +	qcom_geni_serial_poll_bit(uport, SE_GENI_S_CMD_CTRL_REG,
>> +					S_GENI_CMD_ABORT, false);
>> +	geni_write_reg_nolog(irq_clear, uport->membase, SE_GENI_S_IRQ_CLEAR);
>> +	geni_write_reg(FORCE_DEFAULT, uport->membase, GENI_FORCE_DEFAULT_REG);
>> +}
>> +
>> +#ifdef CONFIG_CONSOLE_POLL
>> +static int qcom_geni_serial_get_char(struct uart_port *uport)
>> +{
>> +	unsigned int rx_fifo;
>> +	unsigned int m_irq_status;
>> +	unsigned int s_irq_status;
> 
> These are u32 and the variable names would benefit from being shorter.
Ok.
> 
>> +
>> +	if (!(qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +			M_SEC_IRQ_EN, true)))
> 
> Drop one parenthesis.
Ok.
> 
>> +		return -ENXIO;
>> +
>> +	m_irq_status = geni_read_reg_nolog(uport->membase,
>> +						SE_GENI_M_IRQ_STATUS);
> 
> Drop the _nolog and rename the variable to reduce the length of this
> line.
Ok.
> 
>> +	s_irq_status = geni_read_reg_nolog(uport->membase,
>> +						SE_GENI_S_IRQ_STATUS);
>> +	geni_write_reg_nolog(m_irq_status, uport->membase,
>> +						SE_GENI_M_IRQ_CLEAR);
>> +	geni_write_reg_nolog(s_irq_status, uport->membase,
>> +						SE_GENI_S_IRQ_CLEAR);
> 
> Is it necessary to do this interlaced? Or can you just clear M and then
> clear S? I.e. have a single variable named "status".
There is no special mention of interlacing in the programming manual. I 
will check and update accordingly.
> 
>> +
>> +	if (!(qcom_geni_serial_poll_bit(uport, SE_GENI_RX_FIFO_STATUS,
>> +			RX_FIFO_WC_MSK, true)))
>> +		return -ENXIO;
>> +
>> +	/*
>> +	 * Read the Rx FIFO only after clearing the interrupt registers and
>> +	 * getting valid RX fifo status.
> 
> Use non-_relaxed readl and you wouldn't have to do this explicitly.
Ok.
> 
>> +	 */
>> +	mb();
>> +	rx_fifo = geni_read_reg_nolog(uport->membase, SE_GENI_RX_FIFOn);
>> +	rx_fifo &= 0xFF;
> 
> return rx_fifo & 0xff; instead of the extra step
Ok.
> 
>> +	return rx_fifo;
>> +}
>> +
>> +static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
>> +					unsigned char c)
>> +{
>> +	int b = (int) c;
> 
> Why create this alias?
Ok, I will remove it.
> 
>> +	struct qcom_geni_serial_port *port = GET_DEV_PORT(uport);
>> +
>> +	geni_write_reg_nolog(port->tx_wm, uport->membase,
>> +					SE_GENI_TX_WATERMARK_REG);
>> +	qcom_geni_serial_setup_tx(uport, 1);
>> +	if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +				M_TX_FIFO_WATERMARK_EN, true))
>> +		WARN_ON(1);
> 
> 	WARN_ON(!qcom_geni_serial_poll_bit(...));
Ok.
> 
>> +	geni_write_reg_nolog(b, uport->membase, SE_GENI_TX_FIFOn);
>> +	geni_write_reg_nolog(M_TX_FIFO_WATERMARK_EN, uport->membase,
>> +							SE_GENI_M_IRQ_CLEAR);
>> +	/*
>> +	 * Ensure FIFO write goes through before polling for status but.
>> +	 */
> 
> /* This fits in a one-line comment */
> 
> But if this is necessary that means that every time you call
> serial_poll() you need to have this comment and a rmb(). Better move it
> into the poll function then - or just stop using _relaxed()
Ok.
> 
>> +	mb();
>> +	qcom_geni_serial_poll_cancel_tx(uport);
>> +}
>> +#endif
>> +
>> +#if defined(CONFIG_SERIAL_CORE_CONSOLE) || defined(CONFIG_CONSOLE_POLL)
> 
> The Kconfig specifies that we depend on CONFIG_SERIAL_CORE_CONSOLE, so
> no need to check that.
When the non-console usecase is uploaded which can be enabled using an 
independent config, this check helps. Also the CONSOLE_POLL is not 
always enabled. So removing the check for SERIAL_CORE_CONSOLE will keep 
these functions disabled from compiling, but are required.
> 
>> +static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
>> +{
>> +	geni_write_reg_nolog(ch, uport->membase, SE_GENI_TX_FIFOn);
>> +	/*
>> +	 * Ensure FIFO write clear goes through before
>> +	 * next iteration.
> 
> This comment is accurate, but unnecessarily line wrapped.
I will update the comment and line wrappings.
> 
>> +	 */
>> +	mb();
>> +
>> +}
>> +
>> +static void
>> +__qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
>> +				unsigned int count)
>> +{
>> +	int new_line = 0;
>> +	int i;
>> +	int bytes_to_send = count;
>> +	int fifo_depth = DEF_FIFO_DEPTH_WORDS;
>> +	int tx_wm = DEF_TX_WM;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		if (s[i] == '\n')
>> +			new_line++;
>> +	}
> 
> Why do we need to deal with this?
The uart_console_write() converts '\n' to '\r\c'. Hence we need to track 
it to ensure the space requirements.
> 
>> +
>> +	bytes_to_send += new_line;
>> +	geni_write_reg_nolog(tx_wm, uport->membase,
>> +					SE_GENI_TX_WATERMARK_REG);
>> +	qcom_geni_serial_setup_tx(uport, bytes_to_send);
>> +	i = 0;
>> +	while (i < count) {
>> +		u32 chars_to_write = 0;
>> +		u32 avail_fifo_bytes = (fifo_depth - tx_wm);
> 
> Use size_t for these.
Ok.
> 
>> +
>> +		/*
>> +		 * If the WM bit never set, then the Tx state machine is not
>> +		 * in a valid state, so break, cancel/abort any existing
>> +		 * command. Unfortunately the current data being written is
>> +		 * lost.
>> +		 */
>> +		while (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +						M_TX_FIFO_WATERMARK_EN, true))
>> +			break;
>> +		chars_to_write = min((unsigned int)(count - i),
>> +							avail_fifo_bytes);
>> +		if ((chars_to_write << 1) > avail_fifo_bytes)
> 
> Write chars_to_write * 2, the compiler will be cleaver for you.
Ok.
> 
>> +			chars_to_write = (avail_fifo_bytes >> 1);
>> +		uart_console_write(uport, (s + i), chars_to_write,
>> +						qcom_geni_serial_wr_char);
>> +		geni_write_reg_nolog(M_TX_FIFO_WATERMARK_EN, uport->membase,
>> +							SE_GENI_M_IRQ_CLEAR);
>> +		/* Ensure this goes through before polling for WM IRQ again.*/
>> +		mb();
> 
> Again, if this is necessary move it into the poll function instead of
> sprinkling it throughout the driver.
Ok.
> 
>> +		i += chars_to_write;
>> +	}
>> +	qcom_geni_serial_poll_cancel_tx(uport);
>> +}
>> +
>> +static void qcom_geni_serial_console_write(struct console *co, const char *s,
>> +			      unsigned int count)
>> +{
>> +	struct uart_port *uport;
>> +	struct qcom_geni_serial_port *port;
>> +	int locked = 1;
> 
> Use bool for booleans
Ok.
> 
>> +	unsigned long flags;
>> +
>> +	WARN_ON(co->index < 0 || co->index >= GENI_UART_NR_PORTS);
>> +
>> +	port = get_port_from_line(co->index);
>> +	if (IS_ERR_OR_NULL(port))
> 
> port can't be NULL.
Ok.
> 
>> +		return;
>> +
>> +	uport = &port->uport;
>> +	if (oops_in_progress)
>> +		locked = spin_trylock_irqsave(&uport->lock, flags);
>> +	else
>> +		spin_lock_irqsave(&uport->lock, flags);
>> +
>> +	if (locked) {
>> +		__qcom_geni_serial_console_write(uport, s, count);
>> +		spin_unlock_irqrestore(&uport->lock, flags);
>> +	}
>> +}
>> +
>> +static int handle_rx_console(struct uart_port *uport,
>> +			unsigned int rx_fifo_wc,
>> +			unsigned int rx_last_byte_valid,
>> +			unsigned int rx_last,
> 
> You should be able to have a single parameter with a better name stating
> that "this is the last chunk and it's only N bytes", rather than
> encoding this in a bool and a count with obscure names.
Actually rx_last does not indicate it is a last chunk of read. Rather it 
indicates if the last FIFO word is entirely valid or is partially valid. 
If it is partially valid, then rx_last_byte_valid indicates how many 
valid bytes. But I will take your recommendation and update the function 
prototype to pass only the number of bytes to be read.
> 
>> +			bool drop_rx)
>> +{
>> +	int i, c;
>> +	unsigned char *rx_char;
>> +	struct tty_port *tport;
>> +	struct qcom_geni_serial_port *qcom_port = GET_DEV_PORT(uport);
>> +
>> +	tport = &uport->state->port;
>> +	for (i = 0; i < rx_fifo_wc; i++) {
>> +		int bytes = 4;
>> +
>> +		*(qcom_port->rx_fifo) =
>> +			geni_read_reg_nolog(uport->membase, SE_GENI_RX_FIFOn);
> 
> Just store this value in a local variable, as the only consumer is 3
> lines down.
Ok.
> 
>> +		if (drop_rx)
>> +			continue;
>> +		rx_char = (unsigned char *)qcom_port->rx_fifo;
>> +
>> +		if (i == (rx_fifo_wc - 1)) {
>> +			if (rx_last && rx_last_byte_valid)
> 
> Also, shouldn't rx_last be redundant to the check against rx_fifo_wc?I will update this function so that this check does not happen.
> 
>> +				bytes = rx_last_byte_valid;
>> +		}
>> +		for (c = 0; c < bytes; c++) {
>> +			char flag = TTY_NORMAL;
> 
> No need for a local variable here.
Ok.
> 
>> +			int sysrq;
>> +
>> +			uport->icount.rx++;
>> +			sysrq = uart_handle_sysrq_char(uport, rx_char[c]);
>> +			if (!sysrq)
>> +				tty_insert_flip_char(tport, rx_char[c], flag);
>> +		}
>> +	}
>> +	if (!drop_rx)
>> +		tty_flip_buffer_push(tport);
>> +	return 0;
>> +}
>> +#else
>> +static int handle_rx_console(struct uart_port *uport,
>> +			unsigned int rx_fifo_wc,
>> +			unsigned int rx_last_byte_valid,
>> +			unsigned int rx_last,
>> +			bool drop_rx)
>> +{
>> +	return -EPERM;
>> +}
>> +
>> +#endif /* (CONFIG_SERIAL_CORE_CONSOLE) || defined(CONFIG_CONSOLE_POLL)) */
>> +
>> +static void qcom_geni_serial_start_tx(struct uart_port *uport)
>> +{
>> +	unsigned int geni_m_irq_en;
> 
> This is a u32, name it "irq_en"
Ok.
> 
>> +	struct qcom_geni_serial_port *qcom_port = GET_DEV_PORT(uport);
>> +	unsigned int geni_status;
> 
> geni_status should be of type u32 and there's no lack of descriptiveness
> naming it "status".
Ok.
> 
>> +
>> +	if (qcom_port->xfer_mode == FIFO_MODE) {
>> +		geni_status = geni_read_reg_nolog(uport->membase,
>> +						  SE_GENI_STATUS);
>> +		if (geni_status & M_GENI_CMD_ACTIVE)
>> +			goto exit_start_tx;
> 
> Just return
Ok.
> 
>> +
>> +		if (!qcom_geni_serial_tx_empty(uport))
>> +			goto exit_start_tx;
> 
> Ditto
Ok.
> 
>> +
>> +		geni_m_irq_en = geni_read_reg_nolog(uport->membase,
>> +						    SE_GENI_M_IRQ_EN);
>> +		geni_m_irq_en |= (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN);
>> +
>> +		geni_write_reg_nolog(qcom_port->tx_wm, uport->membase,
>> +						SE_GENI_TX_WATERMARK_REG);
>> +		geni_write_reg_nolog(geni_m_irq_en, uport->membase,
>> +							SE_GENI_M_IRQ_EN);
>> +		/* Geni command setup should complete before returning.*/
> 
> If that's the case then verify that it's actually done.
I believe there is no ordering issue here. I will double check and drop 
the mb() if not required.
> 
>> +		mb();
>> +	}
>> +exit_start_tx:
>> +	return;
>> +}
>> +
>> +static void stop_tx_sequencer(struct uart_port *uport)
>> +{
>> +	unsigned int geni_m_irq_en;
>> +	unsigned int geni_status;
> 
> These are u32 and can be given more succinct names.
Ok.
> 
>> +	struct qcom_geni_serial_port *port = GET_DEV_PORT(uport);
>> +
>> +	geni_m_irq_en = geni_read_reg_nolog(uport->membase, SE_GENI_M_IRQ_EN);
> 
> Drop the _nolog from all of these to make code easier to read.
Ok.
> 
>> +	geni_m_irq_en &= ~M_CMD_DONE_EN;
>> +	if (port->xfer_mode == FIFO_MODE) {
>> +		geni_m_irq_en &= ~M_TX_FIFO_WATERMARK_EN;
>> +		geni_write_reg_nolog(0, uport->membase,
>> +				     SE_GENI_TX_WATERMARK_REG);
>> +	}
>> +	port->xmit_size = 0;
>> +	geni_write_reg_nolog(geni_m_irq_en, uport->membase, SE_GENI_M_IRQ_EN);
>> +	geni_status = geni_read_reg_nolog(uport->membase,
>> +						SE_GENI_STATUS);
>> +	/* Possible stop tx is called multiple times. */
>> +	if (!(geni_status & M_GENI_CMD_ACTIVE))
>> +		return;
>> +
>> +	geni_se_cancel_m_cmd(uport->membase);
>> +	if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +						M_CMD_CANCEL_EN, true)) {
>> +		geni_se_abort_m_cmd(uport->membase);
>> +		qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
>> +						M_CMD_ABORT_EN, true);
>> +		geni_write_reg_nolog(M_CMD_ABORT_EN, uport->membase,
>> +							SE_GENI_M_IRQ_CLEAR);
>> +	}
>> +	geni_write_reg_nolog(M_CMD_CANCEL_EN, uport, SE_GENI_M_IRQ_CLEAR);
>> +}
>> +
>> +static void qcom_geni_serial_stop_tx(struct uart_port *uport)
>> +{
>> +	stop_tx_sequencer(uport);
> 
> Inline stop_tx_sequencer here...
Ok.
> 
>> +}
>> +
>> +static void start_rx_sequencer(struct uart_port *uport)
>> +{
>> +	unsigned int geni_s_irq_en;
>> +	unsigned int geni_m_irq_en;
>> +	unsigned int geni_status;
>> +	struct qcom_geni_serial_port *port = GET_DEV_PORT(uport);
>> +
>> +	geni_status = geni_read_reg_nolog(uport->membase, SE_GENI_STATUS);
>> +	if (geni_status & S_GENI_CMD_ACTIVE)
>> +		qcom_geni_serial_stop_rx(uport);
>> +
>> +	geni_se_setup_s_cmd(uport->membase, UART_START_READ, 0);
>> +
>> +	if (port->xfer_mode == FIFO_MODE) {
>> +		geni_s_irq_en = geni_read_reg_nolog(uport->membase,
>> +							SE_GENI_S_IRQ_EN);
>> +		geni_m_irq_en = geni_read_reg_nolog(uport->membase,
>> +							SE_GENI_M_IRQ_EN);
>> +
>> +		geni_s_irq_en |= S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN;
>> +		geni_m_irq_en |= M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN;
>> +
>> +		geni_write_reg_nolog(geni_s_irq_en, uport->membase,
>> +							SE_GENI_S_IRQ_EN);
>> +		geni_write_reg_nolog(geni_m_irq_en, uport->membase,
>> +							SE_GENI_M_IRQ_EN);
> 
> Do you need to do have these two operations interlaced? Can't you take
> care of M and then S using a single variable?
I will check it.
> 
>> +	}
>> +	/*
>> +	 * Ensure the writes to the secondary sequencer and interrupt enables
>> +	 * go through.
> 
> This is not what mb() does.
I will drop it.
> 
>> +	 */
>> +	mb();
>> +	geni_status = geni_read_reg_nolog(uport->membase, SE_GENI_STATUS);
>> +}
>> +
>> +static void qcom_geni_serial_start_rx(struct uart_port *uport)
>> +{
>> +	start_rx_sequencer(uport);
> 
> Inline start_rx_sequencer
Ok.
> 
>> +}
>> +
>> +static void stop_rx_sequencer(struct uart_port *uport)
>> +{
>> +	unsigned int geni_s_irq_en;
>> +	unsigned int geni_m_irq_en;
>> +	unsigned int geni_status;
>> +	struct qcom_geni_serial_port *port = GET_DEV_PORT(uport);
>> +	u32 irq_clear = S_CMD_DONE_EN;
>> +	bool done;
>> +
>> +	if (port->xfer_mode == FIFO_MODE) {
>> +		geni_s_irq_en = geni_read_reg_nolog(uport->membase,
>> +							SE_GENI_S_IRQ_EN);
>> +		geni_m_irq_en = geni_read_reg_nolog(uport->membase,
>> +							SE_GENI_M_IRQ_EN);
>> +		geni_s_irq_en &= ~(S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN);
>> +		geni_m_irq_en &= ~(M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
>> +
>> +		geni_write_reg_nolog(geni_s_irq_en, uport->membase,
>> +							SE_GENI_S_IRQ_EN);
>> +		geni_write_reg_nolog(geni_m_irq_en, uport->membase,
>> +							SE_GENI_M_IRQ_EN);
>> +	}
>> +
>> +	geni_status = geni_read_reg_nolog(uport->membase, SE_GENI_STATUS);
>> +	/* Possible stop rx is called multiple times. */
> 
> Shouldn't this be checked before above writes?
Writing to the above registers does not have impact on the status of 
secondary sequencer. Writing the cancel command has an impact on the 
status and hence the check is placed right above it.
> 
>> +	if (!(geni_status & S_GENI_CMD_ACTIVE))
>> +		return;
>> +	geni_se_cancel_s_cmd(uport->membase);
>> +	/*
>> +	 * Ensure that the cancel goes through before polling for the
>> +	 * cancel control bit.
>> +	 */
>> +	mb();
>> +	done = qcom_geni_serial_poll_bit(uport, SE_GENI_S_CMD_CTRL_REG,
>> +					S_GENI_CMD_CANCEL, false);
>> +	geni_status = geni_read_reg_nolog(uport->membase, SE_GENI_STATUS);
>> +	geni_write_reg_nolog(irq_clear, uport->membase, SE_GENI_S_IRQ_CLEAR);
>> +	if ((geni_status & S_GENI_CMD_ACTIVE))
> 
> Drop the extra parenthesis. Is this checking if we're still active after
> the cancel, or is this redundant?
Ok.
> 
>> +		qcom_geni_serial_abort_rx(uport);
>> +}
>> +
>> +static void qcom_geni_serial_stop_rx(struct uart_port *uport)
>> +{
>> +	stop_rx_sequencer(uport);
> 
> Just inline the function here.
Ok.
> 
>> +}
>> +
>> +static int qcom_geni_serial_handle_rx(struct uart_port *uport, bool drop_rx)
>> +{
>> +	int ret = 0;
>> +	unsigned int rx_fifo_status;
>> +	unsigned int rx_fifo_wc = 0;
>> +	unsigned int rx_last_byte_valid = 0;
>> +	unsigned int rx_last = 0;
> 
> The context of this function gives that we're dealing with rx and
> rx_fifo, so no need to specify that in each local variable.
> 
> Also, they should all be u32 and there's no need to initialize them.
Ok.
> 
>> +	struct tty_port *tport;
>> +	struct qcom_geni_serial_port *port = GET_DEV_PORT(uport);
>> +
>> +	tport = &uport->state->port;
>> +	rx_fifo_status = geni_read_reg_nolog(uport->membase,
>> +				SE_GENI_RX_FIFO_STATUS);
>> +	rx_fifo_wc = rx_fifo_status & RX_FIFO_WC_MSK;
>> +	rx_last_byte_valid = ((rx_fifo_status & RX_LAST_BYTE_VALID_MSK) >>
>> +						RX_LAST_BYTE_VALID_SHFT);
>> +	rx_last = rx_fifo_status & RX_LAST;
>> +	if (rx_fifo_wc)
>> +		port->handle_rx(uport, rx_fifo_wc, rx_last_byte_valid,
>> +							rx_last, drop_rx);
> 
> You're ignoring the return value of handle_rx.
> 
>> +	return ret;
> 
> You don't care about the return value in the caller and you always
> return 0 anyways, so make the function void.
Ok.
> 
>> +}
>> +
>> +static int qcom_geni_serial_handle_tx(struct uart_port *uport)
>> +{
>> +	int ret = 0;
>> +	struct qcom_geni_serial_port *qcom_port = GET_DEV_PORT(uport);
>> +	struct circ_buf *xmit = &uport->state->xmit;
> 
> Use size_t for sizes.
Ok.
> 
>> +	unsigned int avail_fifo_bytes = 0;
> 
> Naming avail_fifo_bytes just "avail" is carrying the same information
> but is shorter.
Ok.
> 
>> +	unsigned int bytes_remaining = 0;
>> +	int i = 0;
>> +	unsigned int tx_fifo_status;
>> +	unsigned int xmit_size;
> 
> This is "the number of bytes we're going to take from the uart xmit
> buffer and push to the hardware FIFO. Call it "chunk" or something,
> because it's not the size of the xmit.
Ok.
> 
>> +	unsigned int fifo_width_bytes = 1;
> 
> If this really is constantly 1 you can remove the variable and remove a
> bit of the complexity in this function.
Ok.
> 
>> +	int temp_tail = 0;
> 
> Local variables are temporary in nature, so no need to name the variable
> temp_tail, it is the "tail" we operate on here.
Ok.
> 
>> +
>> +	xmit_size = uart_circ_chars_pending(xmit);
>> +	tx_fifo_status = geni_read_reg_nolog(uport->membase,
>> +					SE_GENI_TX_FIFO_STATUS);
>> +	/* Both FIFO and framework buffer are drained */
>> +	if ((xmit_size == qcom_port->xmit_size) && !tx_fifo_status) {
>> +		qcom_port->xmit_size = 0;
>> +		uart_circ_clear(xmit);
>> +		qcom_geni_serial_stop_tx(uport);
>> +		goto exit_handle_tx;
>> +	}
>> +	xmit_size -= qcom_port->xmit_size;
>> +
>> +	avail_fifo_bytes = (qcom_port->tx_fifo_depth - qcom_port->tx_wm) *
>> +							fifo_width_bytes;
>> +	temp_tail = (xmit->tail + qcom_port->xmit_size) & (UART_XMIT_SIZE - 1);
>> +	if (xmit_size > (UART_XMIT_SIZE - temp_tail))
>> +		xmit_size = (UART_XMIT_SIZE - temp_tail);
>> +	if (xmit_size > avail_fifo_bytes)
>> +		xmit_size = avail_fifo_bytes;
> 
> This section is confusing me, in other drivers we update xmit->tail and
> the uart_circ_chars_pending() returns the number of bytes left to be
> written. But in your driver we maintain qcom_port->xmit_size as a delta
> between the tail and the next byte in the ring buffer to consume.
> 
> I find no place were you're actually updating the tail, so I'm wondering
> how setting qcom_port->xmit_size to zero above will actually work, as it
> doesn't consider that xmit->head might be elsewhere.
> 
> The math that you need to come up with is "how much data is there to be
> written" and "how much FIFO space do I have" and then take the min() of
> those. The prior should be the return value of uart_circ_chars_pending()
> straight off.
When the entire data in the circular buffer is written, uart_circ_clear 
clears the tail. Until then, the tail is not updated. So if the console 
driver fills the entire circular buffer before it can be drained out, 
then this approach controls the flow and allows this driver to yield the 
CPU.
> 
>> +
>> +	if (!xmit_size)
>> +		goto exit_handle_tx;
>> +
>> +	qcom_geni_serial_setup_tx(uport, xmit_size);
>> +
>> +	bytes_remaining = xmit_size;
>> +	while (i < xmit_size) {
>> +		unsigned int tx_bytes;
>> +		unsigned int buf = 0;
>> +		int c;
>> +
>> +		tx_bytes = ((bytes_remaining < fifo_width_bytes) ?
>> +					bytes_remaining : fifo_width_bytes);
> 
> 		tx_bytes = min(remaining, fifo_width);
> 
> But fifo_width_bytes is 1, so this can be simplified.
Ok.
> 
>> +
>> +		for (c = 0; c < tx_bytes ; c++)
>> +			buf |= (xmit->buf[temp_tail + c] << (c * 8));
> 
> As bytes_remaining shouldn't be able to reach 0, tx_bytes should always
> be 1 and as such this is just a matter of writing
> xmit->buf[xmit->tail++] to SE_GENI_TX_FIFOn.
This is written with the non-console UART also in mind, where the number 
of bytes in a FIFO word can be 4 bytes. I will update the code to have 
more clarity.
> 
>> +		geni_write_reg_nolog(buf, uport->membase, SE_GENI_TX_FIFOn);
>> +		i += tx_bytes;
>> +		temp_tail = (temp_tail + tx_bytes) & (UART_XMIT_SIZE - 1);
>> +		uport->icount.tx += tx_bytes;
>> +		bytes_remaining -= tx_bytes;
>> +		/* Ensure FIFO write goes through */
> 
> Writes to the same register isn't expected to be reordered, so you
> shouldn't need this wmb(). Perhaps it's the same barrier that's needed
> for other polls?
Ok, I will drop this wmb.
> 
>> +		wmb();
>> +	}
>> +	qcom_geni_serial_poll_cancel_tx(uport);
>> +	qcom_port->xmit_size += xmit_size;
>> +exit_handle_tx:
>> +	uart_write_wakeup(uport);
>> +	return ret;
>> +}
>> +
>> +static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
>> +{
>> +	unsigned int m_irq_status;
>> +	unsigned int s_irq_status;
>> +	struct uart_port *uport = dev;
>> +	unsigned long flags;
>> +	unsigned int m_irq_en;
>> +	bool drop_rx = false;
>> +	struct tty_port *tport = &uport->state->port;
>> +
>> +	spin_lock_irqsave(&uport->lock, flags);
>> +	if (uport->suspended)
>> +		goto exit_geni_serial_isr;
> 
> Do you need to check this within the spinlock?
I will take it outside the spinlock.
> 
> Name your labels based on their action, not the function they are in. So
> a better name would be "out_unlock". But if this can be done outside the
> lock just returning would be better.
Ok.
> 
>> +	m_irq_status = geni_read_reg_nolog(uport->membase,
>> +						SE_GENI_M_IRQ_STATUS);
>> +	s_irq_status = geni_read_reg_nolog(uport->membase,
>> +						SE_GENI_S_IRQ_STATUS);
>> +	m_irq_en = geni_read_reg_nolog(uport->membase, SE_GENI_M_IRQ_EN);
>> +	geni_write_reg_nolog(m_irq_status, uport->membase, SE_GENI_M_IRQ_CLEAR);
>> +	geni_write_reg_nolog(s_irq_status, uport->membase, SE_GENI_S_IRQ_CLEAR);
>> +
>> +	if ((m_irq_status & M_ILLEGAL_CMD_EN)) {
> 
> Extra parenthesis, and you can better write this:
> 
> 	if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
> 		goto out_unlock;
Ok.
> 
>> +		WARN_ON(1);
>> +		goto exit_geni_serial_isr;
>> +	}
>> +
>> +	if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
>> +		uport->icount.overrun++;
>> +		tty_insert_flip_char(tport, 0, TTY_OVERRUN);
>> +	}
>> +
>> +	if ((m_irq_status & m_irq_en) &
> 
> Is M_ILLEGAL_CMD_EN part of m_irq_en? Can you mask the m_irq_status
> based on the irq_en above instead of doing it like this?
I will check and update accordingly.
> 
>> +	    (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
>> +		qcom_geni_serial_handle_tx(uport);
>> +
>> +	if ((s_irq_status & S_GP_IRQ_0_EN) || (s_irq_status & S_GP_IRQ_1_EN)) {
> 
> Drop the parenthesis.
Ok.
> 
>> +		if (s_irq_status & S_GP_IRQ_0_EN)
>> +			uport->icount.parity++;
>> +		drop_rx = true;
>> +	} else if ((s_irq_status & S_GP_IRQ_2_EN) ||
>> +		(s_irq_status & S_GP_IRQ_3_EN)) {
> 
> Ditto.
Ok.
> 
>> +		uport->icount.brk++;
>> +	}
>> +
>> +	if ((s_irq_status & S_RX_FIFO_WATERMARK_EN) ||
>> +		(s_irq_status & S_RX_FIFO_LAST_EN))
> 
> Ditto.
Ok.
> 
>> +		qcom_geni_serial_handle_rx(uport, drop_rx);
>> +
>> +exit_geni_serial_isr:
>> +	spin_unlock_irqrestore(&uport->lock, flags);
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int get_tx_fifo_size(struct qcom_geni_serial_port *port)
>> +{
>> +	struct uart_port *uport;
>> +
>> +	if (!port)
>> +		return -ENODEV;
>> +
>> +	uport = &port->uport;
>> +	port->tx_fifo_depth = geni_se_get_tx_fifo_depth(uport->membase);
>> +	if (!port->tx_fifo_depth) {
>> +		dev_err(uport->dev, "%s:Invalid TX FIFO depth read\n",
>> +								__func__);
>> +		return -ENXIO;
>> +	}
>> +
>> +	port->tx_fifo_width = geni_se_get_tx_fifo_width(uport->membase);
>> +	if (!port->tx_fifo_width) {
>> +		dev_err(uport->dev, "%s:Invalid TX FIFO width read\n",
>> +								__func__);
>> +		return -ENXIO;
>> +	}
>> +
>> +	port->rx_fifo_depth = geni_se_get_rx_fifo_depth(uport->membase);
>> +	if (!port->rx_fifo_depth) {
>> +		dev_err(uport->dev, "%s:Invalid RX FIFO depth read\n",
>> +								__func__);
>> +		return -ENXIO;
>> +	}
>> +
>> +	uport->fifosize =
>> +		((port->tx_fifo_depth * port->tx_fifo_width) >> 3);
> 
> This line wrap isn't necessary, use division rather than shifting and
> describe why the fifosize is 1/8 of the depth * width (is the width
> expressed in bits perhaps?)
Ok.
> 
>> +	return 0;
>> +}
>> +
>> +static void set_rfr_wm(struct qcom_geni_serial_port *port)
>> +{
>> +	/*
>> +	 * Set RFR (Flow off) to FIFO_DEPTH - 2.
>> +	 * RX WM level at 10% RX_FIFO_DEPTH.
>> +	 * TX WM level at 10% TX_FIFO_DEPTH.
>> +	 */
>> +	port->rx_rfr = port->rx_fifo_depth - 2;
>> +	port->rx_wm = UART_CONSOLE_RX_WM;
>> +	port->tx_wm = 2;
>> +}
>> +
>> +static void qcom_geni_serial_shutdown(struct uart_port *uport)
>> +{
>> +	unsigned long flags;
>> +
>> +	/* Stop the console before stopping the current tx */
>> +	console_stop(uport->cons);
>> +
>> +	disable_irq(uport->irq);
>> +	free_irq(uport->irq, uport);
>> +	spin_lock_irqsave(&uport->lock, flags);
>> +	qcom_geni_serial_stop_tx(uport);
>> +	qcom_geni_serial_stop_rx(uport);
>> +	spin_unlock_irqrestore(&uport->lock, flags);
>> +}
>> +
>> +static int qcom_geni_serial_port_setup(struct uart_port *uport)
>> +{
>> +	int ret = 0;
>> +	struct qcom_geni_serial_port *qcom_port = GET_DEV_PORT(uport);
>> +	unsigned long cfg0, cfg1;
>> +	unsigned int rxstale = DEFAULT_BITS_PER_CHAR * STALE_TIMEOUT;
>> +
>> +	set_rfr_wm(qcom_port);
>> +	geni_write_reg_nolog(rxstale, uport->membase, SE_UART_RX_STALE_CNT);
>> +	/*
>> +	 * Make an unconditional cancel on the main sequencer to reset
>> +	 * it else we could end up in data loss scenarios.
>> +	 */
>> +	qcom_port->xfer_mode = FIFO_MODE;
>> +	qcom_geni_serial_poll_cancel_tx(uport);
>> +	geni_se_get_packing_config(8, 1, false, &cfg0, &cfg1);
>> +	geni_write_reg_nolog(cfg0, uport->membase,
>> +					SE_GENI_TX_PACKING_CFG0);
>> +	geni_write_reg_nolog(cfg1, uport->membase,
>> +					SE_GENI_TX_PACKING_CFG1);
>> +	geni_se_get_packing_config(8, 4, false, &cfg0, &cfg1);
>> +	geni_write_reg_nolog(cfg0, uport->membase,
>> +					SE_GENI_RX_PACKING_CFG0);
>> +	geni_write_reg_nolog(cfg1, uport->membase,
>> +					SE_GENI_RX_PACKING_CFG1);
> 
> These aren't above 80 chars, why are you line breaking?
I will fix it.
> 
>> +	ret = geni_se_init(uport->membase, qcom_port->rx_wm, qcom_port->rx_rfr);
>> +	if (ret) {
>> +		dev_err(uport->dev, "%s: Fail\n", __func__);
>> +		goto exit_portsetup;
>> +	}
>> +
>> +	ret = geni_se_select_mode(uport->membase, qcom_port->xfer_mode);
>> +	if (ret)
> 
> Do you need to roll back any init done in the wrapper code? How about
> passing the mode to the init function?
It is not required. They can always be re-initialized if required.
> 
>> +		goto exit_portsetup;
>> +
>> +	qcom_port->port_setup = true;
>> +	/*
>> +	 * Ensure Port setup related IO completes before returning to
>> +	 * framework.
> 
> That's not what mb does.
I will drop mb().
> 
>> +	 */
>> +	mb();
>> +exit_portsetup:
>> +	return ret;
>> +}
>> +
>> +static int qcom_geni_serial_startup(struct uart_port *uport)
>> +{
>> +	int ret = 0;
>> +	struct qcom_geni_serial_port *qcom_port = GET_DEV_PORT(uport);
>> +
>> +	scnprintf(qcom_port->name, sizeof(qcom_port->name),
>> +		  "qcom_serial_geni%d",	uport->line);
>> +
>> +	if (unlikely(geni_se_get_proto(uport->membase) != UART)) {
> 
> Drop the unlikely(), in favour of readable code.
Ok.
> 
>> +		dev_err(uport->dev, "%s: Invalid FW %d loaded.\n",
>> +				 __func__, geni_se_get_proto(uport->membase));
> 
> Drop the __func__, the message should describe the issue in itself.
Ok.
> 
>> +		ret = -ENXIO;
>> +		goto exit_startup;
> 
> We haven't done anything, so just return here.
Ok.
> 
>> +	}
>> +
>> +	get_tx_fifo_size(qcom_port);
>> +	if (!qcom_port->port_setup) {
>> +		if (qcom_geni_serial_port_setup(uport))
>> +			goto exit_startup;
>> +	}
>> +
>> +	/*
>> +	 * Ensure that all the port configuration writes complete
>> +	 * before returning to the framework.
> 
> That's not what mb() does.
I will drop the mb().
> 
>> +	 */
>> +	mb();
>> +	ret = request_irq(uport->irq, qcom_geni_serial_isr, IRQF_TRIGGER_HIGH,
>> +			qcom_port->name, uport);
>> +	if (unlikely(ret)) {
>> +		dev_err(uport->dev, "%s: Failed to get IRQ ret %d\n",
>> +							__func__, ret);
> 
> Drop the __func__
Ok.
> 
>> +		goto exit_startup;
>> +	}
>> +
>> +exit_startup:
>> +	return ret;
>> +}
>> +
>> +static int get_clk_cfg(unsigned long clk_freq, unsigned long *ser_clk)
>> +{
>> +	unsigned long root_freq[] = {7372800, 14745600, 19200000, 29491200,
>> +		32000000, 48000000, 64000000, 80000000, 96000000, 100000000};
>> +	int i;
>> +	int match = -1;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(root_freq); i++) {
>> +		if (clk_freq > root_freq[i])
>> +			continue;
>> +
>> +		if (!(root_freq[i] % clk_freq)) {
>> +			match = i;
>> +			break;
>> +		}
>> +	}
>> +	if (match != -1)
>> +		*ser_clk = root_freq[match];
>> +	else
>> +		pr_err("clk_freq %ld\n", clk_freq);
> 
> Errors are for humans to consume, so make the message useful for a
> human.
Ok.
> 
>> +	return match;
> 
> The index isn't used, so return the frequency instead of filling in the
> ser_clk reference.
Ok.
> 
>> +}
>> +
>> +static void geni_serial_write_term_regs(struct uart_port *uport,
>> +		u32 tx_trans_cfg, u32 tx_parity_cfg, u32 rx_trans_cfg,
>> +		u32 rx_parity_cfg, u32 bits_per_char, u32 stop_bit_len,
>> +		u32 s_clk_cfg)
>> +{
>> +	geni_write_reg_nolog(tx_trans_cfg, uport->membase,
>> +							SE_UART_TX_TRANS_CFG);
>> +	geni_write_reg_nolog(tx_parity_cfg, uport->membase,
>> +							SE_UART_TX_PARITY_CFG);
>> +	geni_write_reg_nolog(rx_trans_cfg, uport->membase,
>> +							SE_UART_RX_TRANS_CFG);
>> +	geni_write_reg_nolog(rx_parity_cfg, uport->membase,
>> +							SE_UART_RX_PARITY_CFG);
>> +	geni_write_reg_nolog(bits_per_char, uport->membase,
>> +							SE_UART_TX_WORD_LEN);
>> +	geni_write_reg_nolog(bits_per_char, uport->membase,
>> +							SE_UART_RX_WORD_LEN);
>> +	geni_write_reg_nolog(stop_bit_len, uport->membase,
>> +						SE_UART_TX_STOP_BIT_LEN);
>> +	geni_write_reg_nolog(s_clk_cfg, uport->membase, GENI_SER_M_CLK_CFG);
>> +	geni_write_reg_nolog(s_clk_cfg, uport->membase, GENI_SER_S_CLK_CFG);
> 
> Drop the _nolog and you should be able to fit these within 80 chars.
Ok.
> 
>> +}
>> +
>> +static int get_clk_div_rate(unsigned int baud, unsigned long *desired_clk_rate)
>> +{
>> +	unsigned long ser_clk;
>> +	int dfs_index;
>> +	int clk_div = 0;
>> +
>> +	*desired_clk_rate = baud * UART_OVERSAMPLING;
>> +	dfs_index = get_clk_cfg(*desired_clk_rate, &ser_clk);
>> +	if (dfs_index < 0) {
>> +		pr_err("%s: Can't find matching DFS entry for baud %d\n",
>> +								__func__, baud);
>> +		clk_div = -EINVAL;
> 
> Just return -EINVAL here, instead of using goto.
Ok.
> 
>> +		goto exit_get_clk_div_rate;
>> +	}
>> +
>> +	clk_div = ser_clk / *desired_clk_rate;
>> +	*desired_clk_rate = ser_clk;
>> +exit_get_clk_div_rate:
>> +	return clk_div;
> 
> Clock functions typically return a frequency, so I think it's better to
> return that and pass the divider by reference.
Ok.
> 
>> +}
>> +
>> +static void qcom_geni_serial_set_termios(struct uart_port *uport,
>> +				struct ktermios *termios, struct ktermios *old)
>> +{
>> +	unsigned int baud;
>> +	unsigned int bits_per_char = 0;
>> +	unsigned int tx_trans_cfg;
>> +	unsigned int tx_parity_cfg;
>> +	unsigned int rx_trans_cfg;
>> +	unsigned int rx_parity_cfg;
>> +	unsigned int stop_bit_len;
>> +	unsigned int clk_div;
>> +	unsigned long ser_clk_cfg = 0;
>> +	struct qcom_geni_serial_port *port = GET_DEV_PORT(uport);
>> +	unsigned long clk_rate;
>> +
>> +	qcom_geni_serial_stop_rx(uport);
>> +	/* baud rate */
>> +	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
>> +	port->cur_baud = baud;
>> +	clk_div = get_clk_div_rate(baud, &clk_rate);
>> +	if (clk_div <= 0)
>> +		goto exit_set_termios;
> 
> Name your labels based on their actions; if you name it "out_restart_rx"
> you don't even have to look below to know what will happen when you
> jump.
Ok.
> 
>> +
>> +	uport->uartclk = clk_rate;
>> +	clk_set_rate(port->serial_rsc.se_clk, clk_rate);
>> +	ser_clk_cfg |= SER_CLK_EN;
>> +	ser_clk_cfg |= (clk_div << CLK_DIV_SHFT);
>> +
>> +	/* parity */
>> +	tx_trans_cfg = geni_read_reg_nolog(uport->membase,
> 
> Drop the _nolog and you don't need to line wrap
Ok.
> 
>> +							SE_UART_TX_TRANS_CFG);
>> +	tx_parity_cfg = geni_read_reg_nolog(uport->membase,
>> +							SE_UART_TX_PARITY_CFG);
>> +	rx_trans_cfg = geni_read_reg_nolog(uport->membase,
>> +							SE_UART_RX_TRANS_CFG);
>> +	rx_parity_cfg = geni_read_reg_nolog(uport->membase,
>> +							SE_UART_RX_PARITY_CFG);
>> +	if (termios->c_cflag & PARENB) {
>> +		tx_trans_cfg |= UART_TX_PAR_EN;
>> +		rx_trans_cfg |= UART_RX_PAR_EN;
>> +		tx_parity_cfg |= PAR_CALC_EN;
>> +		rx_parity_cfg |= PAR_CALC_EN;
>> +		if (termios->c_cflag & PARODD) {
>> +			tx_parity_cfg |= PAR_ODD;
>> +			rx_parity_cfg |= PAR_ODD;
>> +		} else if (termios->c_cflag & CMSPAR) {
>> +			tx_parity_cfg |= PAR_SPACE;
>> +			rx_parity_cfg |= PAR_SPACE;
>> +		} else {
>> +			tx_parity_cfg |= PAR_EVEN;
>> +			rx_parity_cfg |= PAR_EVEN;
>> +		}
>> +	} else {
>> +		tx_trans_cfg &= ~UART_TX_PAR_EN;
>> +		rx_trans_cfg &= ~UART_RX_PAR_EN;
>> +		tx_parity_cfg &= ~PAR_CALC_EN;
>> +		rx_parity_cfg &= ~PAR_CALC_EN;
>> +	}
>> +
>> +	/* bits per char */
>> +	switch (termios->c_cflag & CSIZE) {
>> +	case CS5:
>> +		bits_per_char = 5;
>> +		break;
>> +	case CS6:
>> +		bits_per_char = 6;
>> +		break;
>> +	case CS7:
>> +		bits_per_char = 7;
>> +		break;
>> +	case CS8:
>> +	default:
>> +		bits_per_char = 8;
>> +		break;
>> +	}
>> +
>> +	/* stop bits */
>> +	if (termios->c_cflag & CSTOPB)
>> +		stop_bit_len = TX_STOP_BIT_LEN_2;
>> +	else
>> +		stop_bit_len = TX_STOP_BIT_LEN_1;
>> +
>> +	/* flow control, clear the CTS_MASK bit if using flow control. */
>> +	if (termios->c_cflag & CRTSCTS)
>> +		tx_trans_cfg &= ~UART_CTS_MASK;
>> +	else
>> +		tx_trans_cfg |= UART_CTS_MASK;
>> +
>> +	if (likely(baud))
> 
> Don't do likely/unlikely.
Ok.
> 
>> +		uart_update_timeout(uport, termios->c_cflag, baud);
>> +
>> +	geni_serial_write_term_regs(uport, tx_trans_cfg, tx_parity_cfg,
>> +		rx_trans_cfg, rx_parity_cfg, bits_per_char, stop_bit_len,
>> +								ser_clk_cfg);
> 
> It would likely be fine to just inline the register writes here, instead
> of this long list of parameters.
The same register writes will also be done as part of early console 
setup. Hence it is in a separate function.
> 
>> +exit_set_termios:
>> +	qcom_geni_serial_start_rx(uport);
>> +	return;
> 
> No need to keep an empty return last in the function, and drop the empty
> line following it.
Ok.
> 
>> +
>> +}
>> +
>> +static unsigned int qcom_geni_serial_tx_empty(struct uart_port *uport)
>> +{
>> +	unsigned int tx_fifo_status;
>> +	unsigned int is_tx_empty = 1;
>> +
>> +	tx_fifo_status = geni_read_reg_nolog(uport->membase,
>> +						SE_GENI_TX_FIFO_STATUS);
> 
> Drop the "_nolog" and naming the result "status" would be just as
> expressive, but keep you below 80 chars.
Ok.
> 
>> +	if (tx_fifo_status)
>> +		is_tx_empty = 0;
>> +
>> +	return is_tx_empty;
> 
> Instead of what you're doing with is_tx_empty, just do:
> 
> 	return !readl(membase + FIFO_STATUS);
Ok.
> 
>> +}
>> +
>> +#if defined(CONFIG_SERIAL_CORE_CONSOLE) || defined(CONFIG_CONSOLE_POLL)
>> +static int __init qcom_geni_console_setup(struct console *co, char *options)
>> +{
>> +	struct uart_port *uport;
>> +	struct qcom_geni_serial_port *dev_port;
>> +	int baud = 115200;
>> +	int bits = 8;
>> +	int parity = 'n';
>> +	int flow = 'n';
>> +	int ret = 0;
> 
> Drop initialization of all these variables.
If the options does not include all the required fields, then they are 
not initialized. Hence initializing them here.
> 
>> +
>> +	if (unlikely(co->index >= GENI_UART_NR_PORTS  || co->index < 0))
> 
> Drop the unlikely.
Ok.
> 
>> +		return -ENXIO;
>> +
>> +	dev_port = get_port_from_line(co->index);
>> +	if (IS_ERR_OR_NULL(dev_port)) {
> 
> port can't be NULL.
Ok.
> 
>> +		ret = PTR_ERR(dev_port);
>> +		pr_err("Invalid line %d(%d)\n", co->index, ret);
>> +		return ret;
> 
> Just return PTR_ERR(dev_port);
Ok.
> 
>> +	}
>> +
>> +	uport = &dev_port->uport;
>> +
>> +	if (unlikely(!uport->membase))
>> +		return -ENXIO;
>> +
>> +	if (geni_se_resources_on(&dev_port->serial_rsc))
>> +		WARN_ON(1);
> 
> If this fails we're likely to access unclocked resources causing the
> system to restart, so we should probably not continue here.
Ok.
> 
>> +
>> +	if (unlikely(geni_se_get_proto(uport->membase) != UART)) {
>> +		geni_se_resources_off(&dev_port->serial_rsc);
>> +		return -ENXIO;
>> +	}
>> +
> [..]
>> +
>> +static const struct of_device_id qcom_geni_serial_match_table[] = {
>> +	{ .compatible = "qcom,geni-debug-uart",
>> +			.data = (void *)&qcom_geni_console_driver},
> 
> Shouldn't need this typecast.
Ok.
> 
> Is it necessary to treat the console uart differently and will there be
> a patch adding support for non-console instances? How will this differ
> and why would that be a different compatible?
Yes, there will be a patch for non-console instances. The Serial Enginee 
that supports non-console use-cases has a much deeper FIFO. Also the 
software uses those Serial Engines in a completely interrupt driven mode 
and there is no polling mode use-cases.
> 
>> +};
>> +
>> +static int qcom_geni_serial_probe(struct platform_device *pdev)
>> +{
>> +	int ret = 0;
>> +	int line = -1;
>> +	struct qcom_geni_serial_port *dev_port;
>> +	struct uart_port *uport;
>> +	struct resource *res;
>> +	struct uart_driver *drv;
>> +	const struct of_device_id *id;
>> +
>> +	id = of_match_device(qcom_geni_serial_match_table, &pdev->dev);
> 
> Use of_device_get_match_data()
Ok.
> 
>> +	if (id) {
>> +		dev_dbg(&pdev->dev, "%s: %s\n", __func__, id->compatible);
>> +		drv = (struct uart_driver *)id->data;
>> +	} else {
>> +		dev_err(&pdev->dev, "%s: No matching device found", __func__);
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (pdev->dev.of_node) {
>> +		if (drv->cons)
> 
> The one and only uart_driver has a cons.
Ok.
> 
>> +			line = of_alias_get_id(pdev->dev.of_node, "serial");
>> +	} else {
>> +		line = pdev->id;
>> +	}
>> +
>> +	if (line < 0)
>> +		line = atomic_inc_return(&uart_line_id) - 1;
>> +
>> +	if ((line < 0) || (line >= GENI_UART_CONS_PORTS))
>> +		return -ENXIO;
>> +	dev_port = get_port_from_line(line);
>> +	if (IS_ERR_OR_NULL(dev_port)) {
> 
> port can't be NULL.
Ok.
> 
>> +		ret = PTR_ERR(dev_port);
>> +		dev_err(&pdev->dev, "Invalid line %d(%d)\n",
>> +					line, ret);
>> +		goto exit_geni_serial_probe;
> 
> You're not doing anything other than returning in
> exit_geni_serial_probe, if you just return here I don't need to jump to
> the bottom of the function to figure this out...
Ok.
> 
>> +	}
>> +
>> +	uport = &dev_port->uport;
>> +
>> +	/* Don't allow 2 drivers to access the same port */
>> +	if (uport->private_data) {
>> +		ret = -ENODEV;
>> +		goto exit_geni_serial_probe;
>> +	}
>> +
>> +	uport->dev = &pdev->dev;
>> +	dev_port->wrapper_dev = pdev->dev.parent;
>> +	dev_port->serial_rsc.wrapper_dev = pdev->dev.parent;
>> +	dev_port->serial_rsc.se_clk = devm_clk_get(&pdev->dev, "se-clk");
>> +	if (IS_ERR(dev_port->serial_rsc.se_clk)) {
>> +		ret = PTR_ERR(dev_port->serial_rsc.se_clk);
>> +		dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
>> +		goto exit_geni_serial_probe;
>> +	}
>> +
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "se-phys");
> 
> Don't grab this by name, just pick the first one.
Ok.
> 
>> +	if (!res) {
>> +		ret = -ENXIO;
>> +		dev_err(&pdev->dev, "Err getting IO region\n");
>> +		goto exit_geni_serial_probe;
>> +	}
> 
> Drop the error handling here.
Ok.
> 
>> +	uport->mapbase = res->start;
> 
> No
I see most drivers are setting it to this value. I am not sure if 
anything needs to be handled differently.
> 
>> +	uport->membase = devm_ioremap(&pdev->dev, res->start,
>> +						resource_size(res));
>> +	if (!uport->membase) {
>> +		ret = -ENOMEM;
>> +		dev_err(&pdev->dev, "Err IO mapping serial iomem");
>> +		goto exit_geni_serial_probe;
>> +	}
>> +
>> +	dev_port->serial_rsc.geni_pinctrl = devm_pinctrl_get(&pdev->dev);
> 
> Drop all of the pinctrl stuff.
Ok.
> 
>> +	if (IS_ERR_OR_NULL(dev_port->serial_rsc.geni_pinctrl)) {
>> +		dev_err(&pdev->dev, "No pinctrl config specified!\n");
>> +		ret = PTR_ERR(dev_port->serial_rsc.geni_pinctrl);
>> +		goto exit_geni_serial_probe;
>> +	}
> [..]
>> +	dev_port->tx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>> +	dev_port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>> +	dev_port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>> +	uport->fifosize =
>> +		((dev_port->tx_fifo_depth * dev_port->tx_fifo_width) >> 3);
> 
> qcom_geni_serial_startup() sets this as well.
Ok.
> 
>> +
>> +	uport->irq = platform_get_irq(pdev, 0);
>> +	if (uport->irq < 0) {
>> +		ret = uport->irq;
>> +		dev_err(&pdev->dev, "Failed to get IRQ %d\n", ret);
>> +		goto exit_geni_serial_probe;
>> +	}
>> +
>> +	uport->private_data = (void *)drv;
> 
> No need to explicitly typecast to void*
Ok.
> 
>> +	platform_set_drvdata(pdev, dev_port);
>> +	dev_port->handle_rx = handle_rx_console;
> 
> Why have a function pointer when you're only referencing a fixed
> function.
It will be used for the non-console use-cases as well.
> 
>> +	dev_port->rx_fifo = devm_kzalloc(uport->dev, sizeof(u32),
>> +								GFP_KERNEL);
> 
> It takes 8 bytes to store a pointer and the allocation will have some
> overhead...just to provide storage space for 4 bytes. And you don't have
> any error handling...
Ok. I will drop it for now.
> 
>> +	dev_port->port_setup = false;
>> +	return uart_add_one_port(drv, uport);
>> +
>> +exit_geni_serial_probe:
>> +	return ret;
>> +}
>> +
>> +static int qcom_geni_serial_remove(struct platform_device *pdev)
>> +{
>> +	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
>> +	struct uart_driver *drv =
>> +			(struct uart_driver *)port->uport.private_data;
> 
> No need to typecast private_data.
Ok.
> 
>> +
>> +	uart_remove_one_port(drv, &port->uport);
>> +	return 0;
>> +}
>> +
>> +
>> +#ifdef CONFIG_PM
> 
> Drop this and mark the functions __maybe_unused.
Ok.
> 
>> +static int qcom_geni_serial_sys_suspend_noirq(struct device *dev)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
>> +	struct uart_port *uport = &port->uport;
>> +
>> +	uart_suspend_port((struct uart_driver *)uport->private_data,
>> +				uport);
> 
> No need to typecast private_data.
Ok.
> 
>> +	return 0;
>> +}
>> +
>> +static int qcom_geni_serial_sys_resume_noirq(struct device *dev)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
>> +	struct uart_port *uport = &port->uport;
>> +
>> +	if (console_suspend_enabled && uport->suspended) {
>> +		uart_resume_port((struct uart_driver *)uport->private_data,
>> +									uport);
> 
> No need to typecast private_data.
Ok.
> 
>> +		disable_irq(uport->irq);
>> +	}
>> +	return 0;
>> +}
> [..]
>> +static int __init qcom_geni_serial_init(void)
>> +{
>> +	int ret = 0;
>> +	int i;
>> +
>> +	for (i = 0; i < GENI_UART_CONS_PORTS; i++) {
> 
> Don't loop over [0,1) to update the one global variable.
Ok.
> 
>> +		qcom_geni_console_port.uport.iotype = UPIO_MEM;
>> +		qcom_geni_console_port.uport.ops = &qcom_geni_console_pops;
>> +		qcom_geni_console_port.uport.flags = UPF_BOOT_AUTOCONF;
>> +		qcom_geni_console_port.uport.line = i;
>> +	}
>> +
>> +	ret = console_register(&qcom_geni_console_driver);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = platform_driver_register(&qcom_geni_serial_platform_driver);
>> +	if (ret) {
>> +		console_unregister(&qcom_geni_console_driver);
>> +		return ret;
>> +	}
>> +	return ret;
> 
> ret is 0 here, drop the return from within the if statement or just
> return 0 for clarity.
Ok.
> 
>> +}
>> +module_init(qcom_geni_serial_init);
>> +
>> +static void __exit qcom_geni_serial_exit(void)
>> +{
>> +	platform_driver_unregister(&qcom_geni_serial_platform_driver);
>> +	console_unregister(&qcom_geni_console_driver);
>> +}
>> +module_exit(qcom_geni_serial_exit);
>> +
>> +MODULE_DESCRIPTION("Serial driver for GENI based QUP cores");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("tty:qcom_geni_serial");
> 
> What will request the kernel module by this alias?
I will drop it.
> 
> Regards,
> Bjorn
> 
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
