From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 24/30] nfc: netlink: Add suspend_target handler and
 nfc_reactivate_target
Date: Sat, 24 Oct 2015 08:49:02 +0200
Message-ID: <20151024064902.GG23609@zurbaran.home>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
 <1445377701-8353-25-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445377701-8353-25-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Tue, Oct 20, 2015 at 11:48:15PM +0200, Christophe Ricard wrote:
> In order to manage in a better way the nci poll mode state machine, add
> a suspend_target handler. In this way the netlink nfc_genl_activate_target
> rely on a new function nfc_reactivate_target calling suspend_target handler
> if available (only in nci core).
I'm not sure I understand why this is needed. Why do we need to call
suspend before activating again ?

> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
> ---
>  include/net/nfc/nfc.h |  2 ++
>  net/nfc/core.c        | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  net/nfc/nci/core.c    | 23 +++++++++++++++++++----
>  net/nfc/netlink.c     |  3 +--
>  net/nfc/nfc.h         |  2 ++
>  5 files changed, 70 insertions(+), 6 deletions(-)
> 
> diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
> index 30afc9a..380ab8b 100644
> --- a/include/net/nfc/nfc.h
> +++ b/include/net/nfc/nfc.h
> @@ -67,6 +67,8 @@ struct nfc_ops {
>  	int (*dep_link_down)(struct nfc_dev *dev);
>  	int (*activate_target)(struct nfc_dev *dev, struct nfc_target *target,
>  			       u32 protocol);
> +	void (*suspend_target)(struct nfc_dev *dev,
> +			       struct nfc_target *target);
It would be slightly more elegant (And closer to the acticvity spec) to
pass an additional argument to deactivate_target().

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
