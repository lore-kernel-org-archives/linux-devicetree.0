From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [RFC v1 02/14] nfc: nci: Add handle to manage nci response from
 nci proprietary command
Date: Sat, 30 May 2015 03:29:40 +0200
Message-ID: <20150530012940.GA4037@ribalta.ccr.corp.intel.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
 <1430511577-19678-3-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430511577-19678-3-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Fri, May 01, 2015 at 10:19:25PM +0200, Christophe Ricard wrote:
> @@ -342,7 +343,13 @@ void nci_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
>  		break;
>  
>  	default:
> -		pr_err("unknown rsp opcode 0x%x\n", rsp_opcode);
> +		if (ndev->ops->prop_rsp_packet)
> +			ret = ndev->ops->prop_rsp_packet(ndev, rsp_opcode, skb);
I'm not a big fan of this, as it's basically a pass through for
proprietary ops and it's left to each driver to implement their generic
handler. I'd prefer to have them explicitely define their handler for
each response and notification. Please look at that patch:

https://git.kernel.org/cgit/linux/kernel/git/sameo/nfc-next.git/commit/?h=topic/prop_rsp_ntf&id=96655968d4ae2bb3b18db4807331dceb5fe55e53

It would slightly change your code, you'd only have to define your 2
handlers and add that to your nci_ops structure. But it would be the NCI
core responsibility to call them when needed.
If you're fine with it, I'll push it to nfc-next and you can rebase your
code on top of it.

Cheers,
Samuel.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
