From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v1 20/34] NFC: nci: Add dynamic conn_id NCI concept.
Date: Tue, 27 Jan 2015 01:44:58 +0100
Message-ID: <20150127004458.GA31396@ribalta.ger.corp.intel.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com>
 <1418072919-10535-21-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418072919-10535-21-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Mon, Dec 08, 2014 at 10:08:25PM +0100, Christophe Ricard wrote:
>  struct nci_dev {
> @@ -95,7 +111,8 @@ struct nci_dev {
>  	unsigned long		flags;
>  
>  	atomic_t		cmd_cnt;
> -	atomic_t		credits_cnt;
> +	__u8			cur_conn_id;
> +	struct nci_conn_info	*conn_info_by_conn_id[NCI_MAX_CONN_ID];
>  
>  	struct timer_list	cmd_timer;
>  	struct timer_list	data_timer;
> @@ -141,13 +158,11 @@ struct nci_dev {
>  	__u8			manufact_id;
>  	__u32			manufact_specific_info;
>  
> -	/* received during NCI_OP_RF_INTF_ACTIVATED_NTF */
> -	__u8			max_data_pkt_payload_size;
> -	__u8			initial_num_credits;
> +	/* Save RF Discovery ID or NFCEE ID under conn_create */
> +	__u8			cur_id;
> +	struct nci_conn_info	*conn_info_by_id[NCI_MAX_NUM_NFCEE];
So we're going to carry 1-2KB of data with each nci_dev for at most 2
NFC EEs (typically, at least). I'd prefer to use a linked list (Or an
hash table, but that'd be overkill as well) for that purpose.
I think it would even make sense to have only one single, ordered linked
list replacing conn_info_by_id and conn_info_by_conn_id. Access time
will be longer, obviously, but we're talking about small lists and the
impact should be minimal.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
