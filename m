From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 18/30] nfc: st-nci: Add support for proprietary commands
 for factory tests
Date: Sat, 24 Oct 2015 08:48:35 +0200
Message-ID: <20151024064835.GD23609@zurbaran.home>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
 <1445377701-8353-19-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445377701-8353-19-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

Just a couple of nitpicks:

On Tue, Oct 20, 2015 at 11:48:09PM +0200, Christophe Ricard wrote:
> diff --git a/drivers/nfc/st-nci/Makefile b/drivers/nfc/st-nci/Makefile
> index 348ce76..60e569b 100644
> --- a/drivers/nfc/st-nci/Makefile
> +++ b/drivers/nfc/st-nci/Makefile
> @@ -2,7 +2,7 @@
>  # Makefile for ST21NFCB NCI based NFC driver
>  #
>  
> -st-nci-objs = ndlc.o core.o st-nci_se.o
> +st-nci-objs = ndlc.o core.o st-nci_se.o st-nci_vendor_cmds.o
Please rename that file to vendor_cmds.c.
I pushed a change to rename st-nci_se.c to se.c already, to keep the
file names consistent there.


>  obj-$(CONFIG_NFC_ST_NCI)     += st-nci.o
>  
>  st-nci_i2c-objs = i2c.o
> diff --git a/drivers/nfc/st-nci/core.c b/drivers/nfc/st-nci/core.c
> index c419d39..fd2a5ca 100644
> --- a/drivers/nfc/st-nci/core.c
> +++ b/drivers/nfc/st-nci/core.c
> @@ -25,6 +25,7 @@
>  
>  #include "st-nci.h"
>  #include "st-nci_se.h"
> +#include "st-nci_vendor_cmds.h"
Ditto: Please rename it to vendor_cmds.h.


> +void st_nci_hci_loopback_event_received(struct nci_dev *ndev, u8 event,
> +					struct sk_buff *skb)
> +{
> +	struct st_nci_info *info = nci_get_drvdata(ndev);
> +
> +	switch (event) {
> +	case ST_NCI_EVT_POST_DATA:
> +		info->vendor_info.rx_skb = skb;
> +
> +		complete(&info->vendor_info.req_completion);
> +	break;
> +	}
Wouldn't it make sense to complete regardless of the event you're
receiving ?
Since you're checking for rx_skb after the completion, it's safe and
would prevent you from being stuck waiting for the right event in the
below routine.


> +static int st_nci_hci_loopback(struct nfc_dev *dev, void *data,
> +			       size_t data_len)
> +{
> +	int r;
> +	struct sk_buff *msg;
> +	struct nci_dev *ndev = nfc_get_drvdata(dev);
> +	struct st_nci_info *info = nci_get_drvdata(ndev);
> +
> +	if (data_len <= 0)
> +		return -EPROTO;
> +
> +	reinit_completion(&info->vendor_info.req_completion);
> +	info->vendor_info.rx_skb = NULL;
> +
> +	r = nci_hci_send_event(ndev, NCI_HCI_LOOPBACK_GATE,
> +			       ST_NCI_EVT_POST_DATA, data, data_len);
> +	if (r != data_len) {
> +		r = -EPROTO;
> +		goto exit;
> +	}
> +
> +	wait_for_completion_interruptible(&info->vendor_info.req_completion);
> +
> +	if (!info->vendor_info.rx_skb ||
> +	    info->vendor_info.rx_skb->len != data_len) {
> +		r = -EPROTO;
> +		goto exit;
> +	}
> +
> +	msg = nfc_vendor_cmd_alloc_reply_skb(ndev->nfc_dev,
> +					ST_NCI_VENDOR_OUI,
> +					HCI_LOOPBACK,
> +					info->vendor_info.rx_skb->len);
> +	if (!msg) {
> +		r = -ENOMEM;
> +		goto free_skb;
> +	}
> +
> +	if (nla_put(msg, NFC_ATTR_VENDOR_DATA, info->vendor_info.rx_skb->len,
> +		    info->vendor_info.rx_skb->data)) {
> +		kfree_skb(msg);
> +		r = -ENOBUFS;
> +		goto free_skb;
> +	}
> +
> +	r = nfc_vendor_cmd_reply(msg);
> +free_skb:
> +	kfree_skb(info->vendor_info.rx_skb);
> +exit:
> +	return r;
> +}

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
