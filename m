From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 00/13] 3.19 st21nfc fixes
Date: Tue, 27 Jan 2015 00:57:17 +0100
Message-ID: <20150126235717.GB23054@ribalta.ger.corp.intel.com>
References: <1422225211-27510-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422225211-27510-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 25, 2015 at 11:33:18PM +0100, Christophe Ricard wrote:
> Christophe Ricard (13):
>   NFC: dts: st21nfca: Fix compatible string spelling to follow other
>     drivers
>   NFC: dts: st21nfcb: Fix compatible string spelling to follow other
>     drivers
>   NFC: st21nfcb: Fix "WARNING: invalid free of devm_ allocated data"
>   NFC: st21nfca: Remove unreachable code
>   NFC: st21nfcb: Avoid use of skb after free
>   NFC: nfc_enable_se Remove useless blank line at beginning of function
>   NFC: nfc_disable_se Remove useless blank line at beginning of function
>   NFC: st21nfca: Remove skb_pipe_list and skb_pipe_info useless
>     allocation
>   NFC: st21nfca: Remove checkpatch.pl warning Possible unnecessary 'out
>     of memory' message
>   NFC: st21nfca: Fix some skb memory leaks
>   NFC: st21nfcb: Fix "NULL pointer dereference" possible error
>   NFC: st21nfcb: Remove useless include
>   NFC: st21nfcb: Fix copy/paste error in comment
All 13 patches applied to nfc-next, many thanks.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
