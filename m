From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 00/11] Few st21nfca/st-nci NFC fixes and SPI phy support
 for st-nci
Date: Mon, 17 Aug 2015 01:39:30 +0200
Message-ID: <20150816233930.GB3114@zurbaran.home>
References: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1439584420-5446-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Fri, Aug 14, 2015 at 10:33:29PM +0200, Christophe Ricard wrote:
> Christophe Ricard (11):
>   nfc: st-nci: Remove duplicate file
>     include/linux/platform_data/st_nci.h
>   nfc: st-nci: Fix typo when changing from st21nfcb to st-nci
>   nfc: st-nci: Fix non accurate comment for st_nci_i2c_read
>   NFC: st21nfca: fix use of uninitialized variables in error path
>   NFC: st-nci: fix use of uninitialized variables in error path
>   nfc: st-nci: Remove data from ack_pending_q when receiving a NDLC
>     PCB_SYNC_ACK
>   nfc: st-nci: Free data with irrelevant NDLC PCB_SYNC value
>   nfc: st-nci: Add spi phy support for st21nfcb
>   nfc: st-nci: Add device tree documentation for spi phy
>   nfc: st-nci: Remove pr_err in llt_ndlc_rcv_queue when ndlc header is
>     unknown
>   nfc: netlink: Add check on NFC_ATTR_VENDOR_DATA
Thanks a lot, all 11 patches applied, with a couple of minor fixes
for patch #11.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
