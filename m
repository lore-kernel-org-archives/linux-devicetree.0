From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 2/3] NFC: trf7970a: Add ISO/IEC 15693 Support
Date: Fri, 21 Feb 2014 02:00:44 +0100
Message-ID: <20140221010044.GT18868@zurbaran>
References: <1391206631-9862-1-git-send-email-mgreer@animalcreek.com>
 <1391206631-9862-3-git-send-email-mgreer@animalcreek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1391206631-9862-3-git-send-email-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Mark A. Greer" <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Cc: Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Erick Macias <emacias-l0cyMroinI0@public.gmane.org>, Thierry Escande <thierry.escande-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

Just one nitpick here:

> +static int trf7970a_is_iso15693_write_or_lock(u8 cmd)
> +{
> +	int ret;
> +
> +	switch (cmd) {
> +	case ISO15693_CMD_WRITE_SINGLE_BLOCK:
> +	case ISO15693_CMD_LOCK_BLOCK:
> +	case ISO15693_CMD_WRITE_MULTIPLE_BLOCK:
> +	case ISO15693_CMD_WRITE_AFI:
> +	case ISO15693_CMD_LOCK_AFI:
> +	case ISO15693_CMD_WRITE_DSFID:
> +	case ISO15693_CMD_LOCK_DSFID:
> +		ret = 1;
return 1;

and return 0 on the default case.
Simpler code and you don't need the ret variable.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
