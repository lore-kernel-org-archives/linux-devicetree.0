From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v2 3/9] NFC: nfcmrvl: add firmware download
 support
Date: Wed, 21 Oct 2015 08:00:21 +0200
Message-ID: <20151021060021.GF11271@zurbaran.home>
References: <1443443594-14353-1-git-send-email-cuissard@marvell.com>
 <1443443594-14353-4-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443443594-14353-4-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vincent,

On Mon, Sep 28, 2015 at 02:33:08PM +0200, Vincent Cuissard wrote:
> +#define NCI_OP_CORE_CONN_CREATE_CMD	nci_opcode_pack(NCI_GID_CORE, 0x04)
> +#define NCI_OP_CORE_CONN_CLOSE_CMD	nci_opcode_pack(NCI_GID_CORE, 0x05)
Those 2 are already defined on net/nfc/nci.h.


> +static int send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen,
> +		    void *payload)
> +{
> +	struct nci_ctrl_hdr *hdr;
> +	struct sk_buff *skb;
> +
> +	skb = nci_skb_alloc(ndev, (NCI_CTRL_HDR_SIZE + plen), GFP_KERNEL);
> +	if (!skb) {
> +		pr_err("no memory for command\n");
> +		return -ENOMEM;
> +	}
> +
> +	hdr = (struct nci_ctrl_hdr *) skb_put(skb, NCI_CTRL_HDR_SIZE);
> +	hdr->gid = nci_opcode_gid(opcode);
> +	hdr->oid = nci_opcode_oid(opcode);
> +	hdr->plen = plen;
> +
> +	nci_mt_set((__u8 *)hdr, NCI_MT_CMD_PKT);
> +	nci_pbf_set((__u8 *)hdr, NCI_PBF_LAST);
> +
> +	if (plen)
> +		memcpy(skb_put(skb, plen), payload, plen);
> +
> +	return nci_send_frame(ndev, skb);
> +}
This is nci_send_cmd, please export that one instead.

> +static int process_state_fw_dnld(struct nfcmrvl_private *priv,
> +				 struct sk_buff *skb)
> +{
> +	uint16_t len;
> +	uint16_t comp_len;
> +	struct sk_buff *out_skb;
> +
> +	switch (priv->fw_dnld.substate) {
> +	case SUBSTATE_WAIT_COMMAND:
> +		/* Remove NCI HDR */
> +		skb_pull(skb, 3);
> +		if (skb->data[0] != HELPER_CMD_PACKET_FORMAT || skb->len != 5) {
> +			nfc_err(priv->dev, "bad command");
> +			return -EINVAL;
> +		}
> +		skb_pull(skb, 1);
> +		memcpy(&len, skb->data, 2);
> +		skb_pull(skb, 2);
> +		memcpy(&comp_len, skb->data, 2);
> +		skb_pull(skb, 2);
> +		len = get_unaligned_le16(&len);
> +		comp_len = get_unaligned_le16(&comp_len);
This sequence would probably look better with some comments on the frame
format you're expecting to get.

> +static void fw_dnld_rx_work(struct work_struct *work)
> +{
> +	int ret;
> +	struct sk_buff *skb;
> +	struct nfcmrvl_fw_dnld *fw_dnld = container_of(work,
> +						       struct nfcmrvl_fw_dnld,
> +						       rx_work);
> +	struct nfcmrvl_private *priv = container_of(fw_dnld,
> +						    struct nfcmrvl_private,
> +						    fw_dnld);
> +
> +	while ((skb = skb_dequeue(&fw_dnld->rx_q))) {
> +		nfc_send_to_raw_sock(priv->ndev->nfc_dev, skb,
> +				     RAW_PAYLOAD_NCI, NFC_DIRECTION_RX);
> +		switch (fw_dnld->state) {
> +		case STATE_RESET:
> +			ret = process_state_reset(priv, skb);
> +			break;
> +		case STATE_INIT:
> +			ret = process_state_init(priv, skb);
> +			break;
> +		case STATE_SET_REF_CLOCK:
> +			ret = process_state_set_ref_clock(priv, skb);
> +			break;
> +		case STATE_SET_HI_CONFIG:
> +			ret = process_state_set_hi_config(priv, skb);
> +			break;
> +		case STATE_OPEN_LC:
> +			ret = process_state_open_lc(priv, skb);
> +			break;
> +		case STATE_FW_DNLD:
> +			ret = process_state_fw_dnld(priv, skb);
> +			break;
> +		case STATE_CLOSE_LC:
> +			ret = process_state_close_lc(priv, skb);
> +			break;
> +		case STATE_BOOT:
> +			ret = process_state_boot(priv, skb);
> +			break;
> +		default:
> +			ret = -EFAULT;
> +		}
As part of the Fields Peak patchset, Robert is allowing drivers to
define hooks for core NCI ops (patch #4/9). Together with the already
existing hooks for proprietary ops, wouldn't that cover the state
machine below, and thus allowing you to reuse the existing
nci_recv_frame for your firmware downloading code ?

> +int nfcmrvl_fw_dnld_start(struct nci_dev *ndev, const char *firmware_name)
> +{
> +	struct nfcmrvl_private *priv = nci_get_drvdata(ndev);
> +	struct nfcmrvl_fw_dnld *fw_dnld = &priv->fw_dnld;
> +
> +	if (!priv->support_fw_dnld)
> +		return -ENOTSUPP;
> +
> +	if (!firmware_name || !firmware_name[0])
> +		return -EINVAL;
> +
> +	strcpy(fw_dnld->name, firmware_name);
> +
> +	/*
> +	 * Retrieve FW binary file and parse it to initialize FW download
> +	 * state machine.
> +	 */
> +
> +	/* Retrieve FW binary */
> +	if (request_firmware(&fw_dnld->fw, firmware_name, priv->dev) < 0) {
> +		nfc_err(priv->dev, "failed to retrieve FW %s", firmware_name);
> +		return -ENOENT;
> +	}
> +
> +	fw_dnld->header = (const struct nfcmrvl_fw *) priv->fw_dnld.fw->data;
> +
> +	if (fw_dnld->header->magic != NFCMRVL_FW_MAGIC ||
> +	    fw_dnld->header->phy != priv->phy) {
> +		nfc_err(priv->dev, "bad firmware binary %s magic=0x%x phy=%d",
> +			firmware_name, fw_dnld->header->magic,
> +			fw_dnld->header->phy);
> +		release_firmware(fw_dnld->fw);
> +		fw_dnld->header = NULL;
> +		return -EINVAL;
> +	}
> +
> +	if (fw_dnld->header->helper.offset != 0) {
> +		nfc_info(priv->dev, "loading helper");
> +		fw_dnld->binary_config = &fw_dnld->header->helper;
> +	} else {
> +		nfc_info(priv->dev, "loading firmware");
> +		fw_dnld->binary_config = &fw_dnld->header->firmware;
> +	}
> +
> +	/* Configure a timer for timeout */
> +	setup_timer(&priv->fw_dnld.timer, fw_dnld_timeout,
> +		    (unsigned long) priv);
> +	mod_timer(&priv->fw_dnld.timer,
> +		  jiffies + msecs_to_jiffies(FW_DNLD_TIMEOUT));
> +
> +	/* Ronfigure HI to be sure that it is the bootrom values */
Reconfigure ?

> +#define NCI_OP_BOOT_CMD			0x3A
You might want to prefix your proprietary commands.

> +enum nfcmrvl_phy {
> +	NFCMRVL_PHY_USB		= 0,
> +	NFCMRVL_PHY_UART	= 1,
> +	NFCMRVL_PHY_I2C		= 2,
> +	NFCMRVL_PHY_SPI		= 3,
> +};
Why is that part of the fw_dld header ?

> @@ -185,6 +202,11 @@ int nfcmrvl_nci_recv_frame(struct nfcmrvl_private *priv, struct sk_buff *skb)
>  		}
>  	}
>  
> +	if (priv->ndev->nfc_dev->fw_download_in_progress) {
Who's setting that flag to true ?

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
