From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [RFC v1 11/14] nfc: st21nfcb: Add support for nci set mode
 proprietary command
Date: Sat, 30 May 2015 03:30:00 +0200
Message-ID: <20150530013000.GB4037@ribalta.ccr.corp.intel.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
 <1430511577-19678-12-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430511577-19678-12-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Fri, May 01, 2015 at 10:19:34PM +0200, Christophe Ricard wrote:
> +static int st21nfcb_nci_prop_request(struct nci_dev *ndev,
> +				     void (*req)(struct nci_dev *ndev,
> +						 unsigned long opt),
> +				     unsigned long opt, __u32 timeout)
> +{
> +	int r = 0;
> +	long completion_r;
> +
> +	ndev->req_status = NCI_REQ_PEND;
> +
> +	reinit_completion(&ndev->req_completion);
> +	req(ndev, opt);
> +	completion_r =
> +		wait_for_completion_interruptible_timeout(&ndev->req_completion,
> +							  timeout);
> +
> +	pr_debug("wait_for_completion return %ld\n", completion_r);
> +
> +	if (completion_r > 0) {
> +		switch (ndev->req_status) {
> +		case NCI_REQ_DONE:
> +			r = nci_to_errno(ndev->req_result);
> +			break;
> +
> +		case NCI_REQ_CANCELED:
> +			r = -ndev->req_result;
> +			break;
> +
> +		default:
> +			r = -ETIMEDOUT;
> +			break;
> +		}
> +	} else {
> +		pr_err("wait_for_completion_interruptible_timeout failed %ld\n",
> +		       completion_r);
> +
> +		r = ((completion_r == 0) ? (-ETIMEDOUT) : (completion_r));
> +	}
> +
> +	ndev->req_status = ndev->req_result = 0;
> +	return r;
> +}
At that point, I would be ok for you to export nci_request() and use it
here instead of reimplementing most of it.


> +static void st21nfcb_nci_set_mode_req(struct nci_dev *ndev, unsigned long opt)
> +{
> +	struct nci_mode_set_cmd cmd;
> +	__u8 mode = opt;
> +
> +	cmd.cmd_type  = ST21NFCB_SET_NFC_MODE;
> +	cmd.mode = mode;
> +
> +	nci_send_cmd(ndev, NCI_OP_PROP_CMD,
> +		     sizeof(struct nci_mode_set_cmd), &cmd);
> +}
> +
> +int st21nfcb_nci_set_mode(struct nci_dev *ndev, u8 mode)
> +{
> +	atomic_set(&ndev->cmd_cnt, 1);
> +	set_bit(NCI_INIT, &ndev->flags);
Why is that needed ?

> +	return st21nfcb_nci_prop_request(ndev, st21nfcb_nci_set_mode_req,
> +				mode, msecs_to_jiffies(NCI_CMD_TIMEOUT));
That is racy, as you are not taking the req_lock. You may be woken up by
a previously handled command. Another reason for using an exported
nci_request().

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
