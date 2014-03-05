From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/3] NFC: trf7970a: Add driver with ISO/IEC 14443 Type 2
 Tag Support
Date: Wed, 5 Mar 2014 13:36:16 +0100
Message-ID: <20140305123616.GC14401@zurbaran>
References: <1391206631-9862-1-git-send-email-mgreer@animalcreek.com>
 <1391206631-9862-2-git-send-email-mgreer@animalcreek.com>
 <20140221005059.GS18868@zurbaran>
 <20140226215309.GA21867@animalcreek.com>
 <20140305001943.GA29983@animalcreek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140305001943.GA29983-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Mark A. Greer" <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Cc: Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Erick Macias <emacias-l0cyMroinI0@public.gmane.org>, Thierry Escande <thierry.escande-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 04, 2014 at 05:19:43PM -0700, Mark A. Greer wrote:
> On Wed, Feb 26, 2014 at 02:53:09PM -0700, Mark A. Greer wrote:
> > On Fri, Feb 21, 2014 at 01:50:59AM +0100, Samuel Ortiz wrote:
> > 
> > > > +static int trf7970a_in_send_cmd(struct nfc_digital_dev *ddev,
> > > > +		struct sk_buff *skb, u16 timeout,
> > > > +		nfc_digital_cmd_complete_t cb, void *arg)
> > > > +{
> > > > +	struct trf7970a *trf = nfc_digital_get_drvdata(ddev);
> > > > +	char *prefix;
> > > > +	unsigned int len;
> > > > +	int ret;
> > > > +
> > > > +	dev_dbg(trf->dev, "New request - state: %d, timeout: %d ms, len: %d\n",
> > > > +			trf->state, timeout, skb->len);
> > > > +
> > > > +	if (skb->len > TRF7970A_TX_MAX)
> > > > +		return -EINVAL;
> > > > +
> > > > +	mutex_lock(&trf->lock);
> > > > +
> > > > +	if ((trf->state != TRF7970A_ST_IDLE) &&
> > > > +			(trf->state != TRF7970A_ST_IDLE_RX_BLOCKED)) {
> > > > +		dev_err(trf->dev, "%s - Bogus state: %d\n", __func__,
> > > > +				trf->state);
> > > > +		ret = -EIO;
> > > > +		goto out_err;
> > > > +	}
> > > > +
> > > > +	trf->rx_skb = nfc_alloc_recv_skb(TRF7970A_RX_SKB_ALLOC_SIZE,
> > > > +			GFP_KERNEL);
> > > > +	if (!trf->rx_skb) {
> > > > +		dev_dbg(trf->dev, "Can't alloc rx_skb\n");
> > > > +		ret = -ENOMEM;
> > > > +		goto out_err;
> > > > +	}
> > > > +
> > > > +	if (trf->state == TRF7970A_ST_IDLE_RX_BLOCKED) {
> > > > +		ret = trf7970a_cmd(trf, TRF7970A_CMD_ENABLE_RX);
> > > > +		if (ret)
> > > > +			goto out_err;
> > > > +
> > > > +		trf->state = TRF7970A_ST_IDLE;
> > > > +	}
> > > > +
> > > > +	ret = trf7970a_per_cmd_config(trf, skb);
> > > > +	if (ret)
> > > > +		goto out_err;
> > > > +
> > > > +	trf->ddev = ddev;
> > > > +	trf->tx_skb = skb;
> > > As you're going to carry this guy around and may need it from e.g. your
> > > threaded interrupt handler, shouldn't you take a reference (skb_get) on it ?
> > > I'm concerned by the fact that you could see your tx_skb disappear from
> > > abort_cmd and get an IRQ before your state is set to IDLE.
> > > Hmm, I guess that's protected by the mutex and so when you get an abort
> > > from the digital stack you reset the state to IDLE and no one should try
> > > to touch tx_skb after you release the mutex. Is that what you had in
> > > mind ?
> > 
> > It is but taking a reference is a good idea.  I'll add that.
> 
> I've changed my mind on this (hope that's okay).
> 
> The driver is in control of freeing that skb and won't free it until
> there's an abort or the processing is complete.  I believe that handle
> the race with an abort correctly.
That was my understanding as well, and I wanted to make sure that you
had that in mind too. It seems to be the case.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
