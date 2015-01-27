From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 00/10] Secure Element support for HCI based NFC
 controller & st21nfca integration
Date: Tue, 27 Jan 2015 23:45:58 +0100
Message-ID: <20150127224558.GA32667@ribalta.mp.intel.com>
References: <1422317900-3810-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422317900-3810-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 27, 2015 at 01:18:10AM +0100, Christophe Ricard wrote:
> Christophe Ricard (10):
>   NFC: hci: Change event_received handler gate parameter to pipe
>   NFC: hci: Add pipes table to reference them with a tuple {gate, host}
>   NFC: hci: Change nfc_hci_send_response gate parameter to pipe
>   NFC: hci: Reference every pipe information according to notification
>   NFC: hci: Add cmd_received handler
>   NFC: pn544: Change event_received gate parameter to pipe
>   NFC: microread: Change event_received gate parameter to pipe
>   NFC: hci: Remove nfc_hci_pipe2gate function
>   NFC: st21nfca: Adding support for secure element
>   NFC: dts: st21nfca: Document ese-present & uicc-present DTS property
All 10 patches applied, with some commit messages fixes.
Thanks a lot.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
