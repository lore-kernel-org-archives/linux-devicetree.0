From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v2 5/9] NFC: nfcmrvl: add i2c driver
Date: Thu, 22 Oct 2015 17:43:27 +0200
Message-ID: <20151022154327.GC7633@zurbaran.home>
References: <1443443594-14353-1-git-send-email-cuissard@marvell.com>
 <1443443594-14353-6-git-send-email-cuissard@marvell.com>
 <20151021060047.GH11271@zurbaran.home>
 <EF5A5C37-4C16-49A6-BF4E-1894C22CC111@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <EF5A5C37-4C16-49A6-BF4E-1894C22CC111-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vincent,

On Wed, Oct 21, 2015 at 08:54:07AM +0000, Vincent Cuissard wrote:
> >> diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
> >> index bd8db3d..1104fa3 100644
> >> --- a/drivers/nfc/nfcmrvl/main.c
> >> +++ b/drivers/nfc/nfcmrvl/main.c
> >> @@ -33,6 +33,9 @@ static int nfcmrvl_nci_open(struct nci_dev *ndev)
> >>    if (test_and_set_bit(NFCMRVL_NCI_RUNNING, &priv->flags))
> >>        return 0;
> >> 
> >> +    /* Reset possible fault of previous session */
> >> +    clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
> >> +
> > How is that related to this i2c driver ?
> 
> i2c driver is currently the only deiver that needs to set this error. But in the future other interfaces may need it too. That's why this clear code was done in the main file to allow future code reuse.
>
Ok. I missed the fact that the i2c driver was actually setting this bit.
Makes sense to me now.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
