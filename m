From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v1 07/34] NFC: hci: Change nfc_hci_send_response gate
 parameter to pipe
Date: Mon, 26 Jan 2015 02:11:11 +0100
Message-ID: <20150126011111.GE28592@ribalta.ger.corp.intel.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com>
 <1418072919-10535-8-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418072919-10535-8-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Mon, Dec 08, 2014 at 10:08:12PM +0100, Christophe Ricard wrote:
> We are usually sending a response to a command received from a known pipe.
> Keep this information as is.
> 
> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
> ---
>  include/net/nfc/hci.h | 2 +-
>  net/nfc/hci/command.c | 7 +------
>  2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/include/net/nfc/hci.h b/include/net/nfc/hci.h
> index c1c644b..6f11ca2 100644
> --- a/include/net/nfc/hci.h
> +++ b/include/net/nfc/hci.h
> @@ -260,7 +260,7 @@ int nfc_hci_send_cmd(struct nfc_hci_dev *hdev, u8 gate, u8 cmd,
>  int nfc_hci_send_cmd_async(struct nfc_hci_dev *hdev, u8 gate, u8 cmd,
>  			   const u8 *param, size_t param_len,
>  			   data_exchange_cb_t cb, void *cb_context);
> -int nfc_hci_send_response(struct nfc_hci_dev *hdev, u8 gate, u8 response,
> +int nfc_hci_send_response(struct nfc_hci_dev *hdev, u8 pipe, u8 response,
>  			  const u8 *param, size_t param_len);
This makes this API a bit odd, as all other routines there take a gate
as an input.
Instead of changing the prototype, could you please remove that routine
and have the callers (which is nfc_hci_cmd_received only) call
nfc_hci_hcp_message_tx directly ?

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
