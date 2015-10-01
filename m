From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] soc: mediatek: Fix random hang up issue while kernel
 init
Date: Thu, 1 Oct 2015 14:58:52 +0800
Message-ID: <1443682732.1714.11.camel@mtksdaap41>
References: <1443162717-64831-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1443169573.3135.9.camel@pengutronix.de> <5607D224.4050801@gmail.com>
	 <CAGS+omCXMRf4bxWancSJSq2a1pc38TYYY46Os9ASWWCRp95_ig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omCXMRf4bxWancSJSq2a1pc38TYYY46Os9ASWWCRp95_ig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Thanks for your help to explain the patch.

On Tue, 2015-09-29 at 18:25 +0800, Daniel Kurtz wrote:
> On Sun, Sep 27, 2015 at 7:25 PM, Matthias Brugger
> <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> But then we at least need a corresponding change to the binding documentation.

I'll send a new patch with changing binding document.

> If the existing bindings are not used anywhere yet (*), it seems like
> unnecessary overhead to enforce backwards compatibility at this stage.
> 
> (*) I don't actually know if this is true, perhaps only Mediatek can
> answer this.

What does the meaning of existing bindings are used anywhere? Do you
mean this binding is used by other SoCs ?

Currently scpsys driver can't be shared between different Mediatek SoCs
because the power domains are different from each other. So I think it
should no need to maintain backward compatibility on scpsys's binding.

> > Apart from that, please send the dtsi part as a seperate patch.

OK.


Best regards,

James

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
