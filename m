From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v2 3/9] NFC: nfcmrvl: add firmware download
 support
Date: Thu, 22 Oct 2015 17:43:23 +0200
Message-ID: <20151022154323.GB7633@zurbaran.home>
References: <1443443594-14353-1-git-send-email-cuissard@marvell.com>
 <1443443594-14353-4-git-send-email-cuissard@marvell.com>
 <20151021060021.GF11271@zurbaran.home>
 <5B945DE3-A26C-4E4B-B1B6-DF52BEA0A567@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5B945DE3-A26C-4E4B-B1B6-DF52BEA0A567-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vincent,

On Wed, Oct 21, 2015 at 08:48:33AM +0000, Vincent Cuissard wrote:
> > As part of the Fields Peak patchset, Robert is allowing drivers to
> > define hooks for core NCI ops (patch #4/9). Together with the already
> > existing hooks for proprietary ops, wouldn't that cover the state
> > machine below, and thus allowing you to reuse the existing
> > nci_recv_frame for your firmware downloading code ?
> 
> My understanding of Robert's patches is that a driver can hook the generic code. In my case this is only needed during FW download.
> 
> And this state machine is not always based on the received message, it is really based on a given sequence.
> 
> So I think this state machine shall be kept.
Ok. I'm fine with it staying as is.

> >> +    /* Ronfigure HI to be sure that it is the bootrom values */
> > Reconfigure ?
> 
> Yes. Depending on the host interface used, fw download code can update interface rate to speed up the fw download and return back to a lower rate for power consumption.
> 
> This code is to ensure that at the beginning the right rate is used.
Thanks for the explanation, I was mostly pointing at the typo.

> >> +enum nfcmrvl_phy {
> >> +    NFCMRVL_PHY_USB        = 0,
> >> +    NFCMRVL_PHY_UART    = 1,
> >> +    NFCMRVL_PHY_I2C        = 2,
> >> +    NFCMRVL_PHY_SPI        = 3,
> >> +};
> > Why is that part of the fw_dld header ?
> 
> Because this information is given by the FW header inside the firmware binary. This is used to ensure that the firmaware used was configured for the current phy interface.
Sure. But can we keep it in the nfcmrvl.h header ?

> >> @@ -185,6 +202,11 @@ int nfcmrvl_nci_recv_frame(struct nfcmrvl_private *priv, struct sk_buff *skb)
> >>        }
> >>    }
> >> 
> >> +    if (priv->ndev->nfc_dev->fw_download_in_progress) {
> > Who's setting that flag to true ?
> 
> This is done by core code (check nfc_fw_download function in net/nfc/core.c).
Duh. Sorry for the brain fart...

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
