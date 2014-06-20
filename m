From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCHv7 2/5] mailbox: Introduce framework for mailbox
Date: Fri, 20 Jun 2014 20:05:16 +0200
Message-ID: <1403287516.7614.9.camel@odvarok.lan>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
	 <1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-06-12 at 22:31 +0530, Jassi Brar wrote:
> Introduce common framework for client/protocol drivers and
> controller drivers of Inter-Processor-Communication (IPC).
> 
> Client driver developers should have a look at
>  include/linux/mailbox_client.h to understand the part of
> the API exposed to client drivers.
> Similarly controller driver developers should have a look
> at include/linux/mailbox_controller.h
>
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>

> +/**
> + * mbox_chan_received_data - A way for controller driver to push data
> + *				received from remote to the upper layer.
> + * @chan: Pointer to the mailbox channel on which RX happened.
> + * @data: Client specific message typecasted as void *

It's "mssg", not "data".

> +static struct mbox_chan *
> +of_mbox_index_xlate(struct mbox_controller *mbox,
> +				const struct of_phandle_args *sp)

The line break here is inconsistent with how the rest of the file is
formatted.

> +/**
> + * struct mbox_controller - Controller of a class of communication chans
> + * @dev:		Device backing this controller
> + * @controller_name:	Literal name of the controller.
> + * @ops:		Operators that work on each communication chan
> + * @chans:		Null terminated array of chans.

This needs to be updated for current API. It's neither not NULL
terminated nor and array and num_chans documentation is missing.

> + * @txdone_irq:		Indicates if the controller can report to API when
> + *			the last transmitted data was read by the remote.
> + *			Eg, if it has some TX ACK irq.
> + * @txdone_poll:	If the controller can read but not report the TX
> + *			done. Ex, some register shows the TX status but
> + *			no interrupt rises. Ignored if 'txdone_irq' is set.
> + * @txpoll_period:	If 'txdone_poll' is in effect, the API polls for
> + *			last TX's status after these many millisecs
> + */
> +struct mbox_controller {
> +	struct device *dev;
> +	struct mbox_chan_ops *ops;
> +	struct mbox_chan *chans;
> +	int num_chans;
> +	bool txdone_irq;
> +	bool txdone_poll;
> +	unsigned txpoll_period;
> +	struct mbox_chan *(*of_xlate)(struct mbox_controller *mbox,
> +					const struct of_phandle_args *sp);
> +	/*
> +	 * If the controller supports only TXDONE_BY_POLL,
> +	 * this timer polls all the links for txdone.
> +	 */
> +	struct timer_list poll;
> +	unsigned period;
> +	/* Hook to add to the global controller list */
> +	struct list_head node;
> +};

Thank you,
Lubo
