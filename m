From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v1 04/34] NFC: st21nfca: Remove unreachable code
Date: Mon, 26 Jan 2015 02:10:01 +0100
Message-ID: <20150126011001.GB28592@ribalta.ger.corp.intel.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com>
 <1418072919-10535-5-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418072919-10535-5-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Mon, Dec 08, 2014 at 10:08:09PM +0100, Christophe Ricard wrote:
> kfree_skb(skb) in st21nfca_hci_event_received is never reach.
> 
> Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
> ---
>  drivers/nfc/st21nfca/st21nfca.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
> index f2596c8..880193b 100644
> --- a/drivers/nfc/st21nfca/st21nfca.c
> +++ b/drivers/nfc/st21nfca/st21nfca.c
> @@ -845,8 +845,6 @@ static int st21nfca_hci_event_received(struct nfc_hci_dev *hdev, u8 gate,
>  	default:
>  		return 1;
>  	}
> -	kfree_skb(skb);
> -	return 0;
That make sense to me, but while looking at this function, I think your
skb free in st21nfca_dep_event_received() is incorrect.
The HCI core manages the SKBs it sends and frees this skb.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
