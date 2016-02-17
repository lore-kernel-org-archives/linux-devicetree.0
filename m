From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: vf-colibri: add basic supply regulators
Date: Wed, 17 Feb 2016 20:29:11 -0200
Message-ID: <CAOMZO5CSw=Gx52H27C_H2ytnkup6emgVxv5=FPmGnmTMEjE9CA@mail.gmail.com>
References: <1455668317-15728-1-git-send-email-stefan@agner.ch>
	<1455668317-15728-2-git-send-email-stefan@agner.ch>
	<CAOMZO5Bb1eGSinoNkUhB_2w8mWdA+RQA0Z4geJp8B-MfGryAHw@mail.gmail.com>
	<a07b405a5c73b092eaa6422b8562b56f@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a07b405a5c73b092eaa6422b8562b56f-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 7:52 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:

> Hm, should I remove them also in Patch 1/3? It's a fixed regulator too,
> hence I guess regulator-always-on is pointless there too...?

That's correct. And from 3/3 too.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
