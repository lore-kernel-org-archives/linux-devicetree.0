From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 00/35] Few fixes and st21nfca/st-nci vendor_cmds
 support
Date: Mon, 26 Oct 2015 07:01:33 +0100
Message-ID: <20151026060133.GA24619@zurbaran.home>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Sun, Oct 25, 2015 at 10:54:15PM +0100, Christophe Ricard wrote:
> Hi Samuel,
> 
> Please find in the following patchset severals fixes as well as vendor_cmds support
> for st21nfca and st-nci.
> vendor_cmds includes production test, trimmings & firmware update commands.
> 
> v2:
> - Propose a more elegant way to switch between NFC target mode (SLEEP, IDLE).
> - Remove st21nfca_ and st-nci_ file name prefix.
> - Merge st21nfca_xxx.h headers into st21nfca.h. Same for st-nci_xxx.h
> 
> Best Regards
> Christophe
> Christophe Ricard (35):
All patches applied except:

>   nfc: st21nfca: Add support for proprietary commands for factory tests

- nfc_llc_start/stop need to be exported
- There is no st21nfca_vendor_cmds.h header file

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
