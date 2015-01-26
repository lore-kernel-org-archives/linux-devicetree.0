From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v1 06/34] NFC: hci: Add pipes table to reference them
 with a tuple {gate, host}
Date: Mon, 26 Jan 2015 02:11:00 +0100
Message-ID: <20150126011100.GD28592@ribalta.ger.corp.intel.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com>
 <1418072919-10535-7-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418072919-10535-7-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Mon, Dec 08, 2014 at 10:08:11PM +0100, Christophe Ricard wrote:
>  struct nfc_hci_gate {
>  	u8 gate;
>  	u8 pipe;
> -};
> +} __packed;
Why does this one need to be packed ?


> +struct nfc_hci_pipe {
> +	u8 gate;
> +	u8 dest_host;
> +} __packed;
Ditto.

> +void nfc_hci_reset_pipes_per_host(struct nfc_hci_dev *hdev, u8 host)
> +{
> +	int i = 0;
> +
> +	for (i = 0; i < NFC_HCI_MAX_PIPES; i++) {
> +		if (hdev->pipes[i].dest_host == host) {
> +			hdev->pipes[i].gate = NFC_HCI_INVALID_GATE;
> +			hdev->pipes[i].dest_host = NFC_HCI_INVALID_HOST;
> +		}
Nitpick:

if (hdev->pipes[i].dest_host != host)
	continue;

hdev->pipes[i].gate = NFC_HCI_INVALID_GATE;
hdev->pipes[i].dest_host = NFC_HCI_INVALID_HOST;

is usually preferred.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
