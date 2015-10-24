From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 20/30] nfc: st-nci: Add ese-present/uicc-present dts
 properties
Date: Sat, 24 Oct 2015 08:48:49 +0200
Message-ID: <20151024064849.GF23609@zurbaran.home>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
 <1445377701-8353-21-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445377701-8353-21-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Tue, Oct 20, 2015 at 11:48:11PM +0200, Christophe Ricard wrote:
> diff --git a/drivers/nfc/st-nci/st-nci_se.h b/drivers/nfc/st-nci/st-nci_se.h
> index ea66e87..e3f8e7e 100644
> --- a/drivers/nfc/st-nci/st-nci_se.h
> +++ b/drivers/nfc/st-nci/st-nci_se.h
> @@ -18,6 +18,8 @@
>  #ifndef __LOCAL_ST_NCI_SE_H_
>  #define __LOCAL_ST_NCI_SE_H_
>  
> +#include <net/nfc/nci_core.h>
> +
Why is that needed ?

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
