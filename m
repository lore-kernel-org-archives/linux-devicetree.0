From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv8 2/2] mailbox: Introduce framework for mailbox
Date: Fri, 11 Jul 2014 19:26:13 +0200
Message-ID: <201407111926.13939.arnd@arndb.de>
References: <1405071167-14503-1-git-send-email-jaswinder.singh@linaro.org> <1405071325-14683-1-git-send-email-jaswinder.singh@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405071325-14683-1-git-send-email-jaswinder.singh@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ks.giri@samsung.com, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, courtney.cavin@sonymobile.com, mporter@linaro.org, slapdau@yahoo.com.au, lftan.linux@gmail.com, loic.pallardy@st.com, s-anna@ti.com, ashwin.chaugule@linaro.org, bjorn@kryo.se, patches@linaro.org, Mollie.Wu@tw.fujitsu.com, t.takinishi@jp.fujitsu.com
List-Id: devicetree@vger.kernel.org

On Friday 11 July 2014, Jassi Brar wrote:
> +
> + This document aims to help developers write client and controller
> +drivers for the API. But before we start, let us note that the
> +client (especially) and controller drivers are likely going to be
> +very platform specific because the remote firmware is likely to be
> +proprietary and implement non-standard protocol. So even if two
> +platforms employ, say, PL320 controller, the client drivers can't
> +be shared across them. Even the PL320 driver might need to accomodate
> +some platform specific quirks. So the API is meant mainly to avoid
> +similar copies of code written for each platform.
> + Some of the choices made during implementation are the result of this
> +peculiarity of this "common" framework.

Note that there might be the case where you have a Linux instance
on both sides communicating over a standard protocol, so while it's
certainly true that a lot of the users (in particular the existing
ones) are talking to a proprietary firmware, it's not necessarily so.

An example I can think of is using the mailbox API as a low-level
implementation detail of a PCI-PCI link connecting two identical
hosts using a standard protocol like virtio or ntb-net on top.

> +	Part 2 - Client Driver (See include/linux/mailbox_client.h)
> +
> + The client might want to operate in blocking mode (synchronously
> +send a message through before returning) or non-blocking/async mode (submit
> +a message and a callback function to the API and return immediately).
> +
> +
> +static struct mbox_chan *ch_async, *ch_blk;
> +static struct mbox_client cl_async, cl_blk;
> +static struct completion c_aysnc;

Using static variables for these is probably not good as an
example: we try to write all drivers in a way that lets them
handle multiple instances of the same hardware, so a better
example may be to put the same things into a data structure
that is dynamically allocatied by the client, even if that is
a little more verbose than your current examaple.

> +/*
> + * This is the handler for data received from remote. The behaviour is purely
> + * dependent upon the protocol. This is just an example.
> + */
> +static void message_from_remote(struct mbox_client *cl, void *mssg)
> +{
> +	if (cl == &cl_async) {
> +		if (is_an_ack(mssg)) {
> +			/* An ACK to our last sample sent */
> +			return; /* Or do something else here */
> +		} else { /* A new message from remote */
> +			queue_req(mssg);
> +		}
> +	} else {
> +		/* Remote f/w sends only ACK packets on this channel */
> +		return;
> +	}
> +}
> +
> +static void sample_sent(struct mbox_client *cl, void *mssg, int r)
> +{
> +	complete(&c_aysnc);
> +}

Each of these would consequently do something like

	struct my_mailbox *m = container_of(mbox_client, struct my_mailbox, client);
	complete(&m->completion);


> +static struct mbox_chan *
> +of_mbox_index_xlate(struct mbox_controller *mbox,
> +		    const struct of_phandle_args *sp)
> +{
> +	int ind = sp->args[0];
> +
> +	if (ind >= mbox->num_chans)
> +		return NULL;
> +
> +	return &mbox->chans[ind];
> +}

Should this perhaps check that #mbox-cells is '1'?
For other values, this function can't really work.

> +/**
> + * struct mbox_client - User of a mailbox
> + * @dev:		The client device
> + * @chan_name:		The string token to identify a channel out of more
> + *			than one specified for the client via DT
> + * @tx_block:		If the mbox_send_message should block until data is
> + *			transmitted.
> + * @tx_tout:		Max block period in ms before TX is assumed failure
> + * @knows_txdone:	if the client could run the TX state machine. Usually
> + *			if the client receives some ACK packet for transmission.
> + *			Unused if the controller already has TX_Done/RTR IRQ.
> + * @rx_callback:	Atomic callback to provide client the data received
> + * @tx_done:		Atomic callback to tell client of data transmission
> + */

It may be worthwhile listing here which callbacks are being called under a
spinlock and which are allowed to sleep. Same for the other structures with
function pointers.

None of these comments are show-stoppers, overall I'm very happy with the
current state of the mailbox API and I think we should merge it  in the next
merge window.

	Arnd
