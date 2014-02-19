From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/3] usb: chipidea: msm: Add device tree support
Date: Wed, 19 Feb 2014 17:48:41 +0200
Message-ID: <1392824921.17130.71.camel@iivanov-dev>
References: <1392729681-21022-1-git-send-email-iivanov@mm-sol.com>
		 <1392729681-21022-3-git-send-email-iivanov@mm-sol.com>
		 <53039E2E.2030503@cogentembedded.com>
	 <1392743648.17130.17.camel@iivanov-dev>
	 <5303A71B.7060208@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5303A71B.7060208-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi,

On Tue, 2014-02-18 at 21:31 +0300, Sergei Shtylyov wrote: 
> On 02/18/2014 08:14 PM, Ivan T. Ivanov wrote:
> 
> >>> From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> 
> >>> Allows controller to be specified via device tree.
> >>> Pass PHY phandle specified in DT to core driver.
> 
> >>> Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> >>> ---
> >>>    drivers/usb/chipidea/ci_hdrc_msm.c |   23 ++++++++++++++++++++++-
> >>>    1 file changed, 22 insertions(+), 1 deletion(-)
> 
> >>      You also need to describe the binding you're creating in
> >> Documentation/devicetree/bindings/usb/<file>.txt.
> 
> > Did you check "[PATCH v2 1/3]"?
> 
>     Did you send it to 'linux-usb'?

Opps, sorry. get_maintainer.pl did not list linux-usb and I forgot 
to add it. Would like to resend it?

Regards,
Ivan

> 
> WBR, Sergei


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
