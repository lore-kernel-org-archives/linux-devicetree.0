From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH 11/11] nfc: netlink: Add check on NFC_ATTR_VENDOR_DATA
Date: Mon, 17 Aug 2015 01:38:24 +0200
Message-ID: <20150816233752.GA3114@zurbaran.home>
References: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
 <1439584420-5446-12-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439584420-5446-12-git-send-email-christophe-h.ricard@st.com>
Sender: stable-owner@vger.kernel.org
To: Christophe Ricard <christophe.ricard@gmail.com>
Cc: linux-nfc@lists.01.org, christophe-h.ricard@st.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Fri, Aug 14, 2015 at 10:33:40PM +0200, Christophe Ricard wrote:
> @@ -1450,8 +1450,6 @@ nla_put_failure:
>  free_msg:
>  	nlmsg_free(msg);
>  	kfree(ctx);
> -
> -	return;
This should not be part of the patch, I removed it.

> @@ -1529,7 +1527,6 @@ static int nfc_genl_vendor_cmd(struct sk_buff *skb,
>  
>  	for (i = 0; i < dev->n_vendor_cmds; i++) {
>  		cmd = &dev->vendor_cmds[i];
> -
Ditto.

Cheers,
Samuel.
