From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 00/11] Follow up patches and several new fixes
Date: Wed, 24 Sep 2014 02:04:22 +0200
Message-ID: <20140924000422.GE4235@zurbaran>
References: <1410596933-5530-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410596933-5530-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Sat, Sep 13, 2014 at 10:28:42AM +0200, Christophe Ricard wrote:
> Christophe Ricard (11):
>   NFC: st21nfca: Fix few coding style issue
>   NFC: st21nfca: Fix potential skb leaks in NFC-DEP code
>   NFC: st21nfca: Fix recursive fault when doing p2p in target mode.
>   NFC: dts: st21nfcb_i2c: Fix invalid interrupts polarity.
>   NFC: st21nfcb: Fix improper management of -EREMOTEIO error code.
>   NFC: st21nfcb: Fix improper ndlc T2 management
>   NFC: nci: Add support for proprietary RF Protocols
>   NFC: st21nfcb: Add ISO15693 Reader/Writer support
>   NFC: st21nfcb: remove error output
>   NFC: st21nfca: ERR_PTR vs NULL fix
>   NFC: st21nfca: Fix potential double kfree_skb error
Applied, thanks a lot.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
