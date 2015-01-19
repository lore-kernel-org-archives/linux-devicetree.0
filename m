From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: at91: allow disabled gpio controllers
Date: Mon, 19 Jan 2015 11:34:21 +0100
Message-ID: <20150119103421.GC19014@odux.rfo.atmel.com>
References: <1417193367-12422-1-git-send-email-ludovic.desroches@atmel.com>
 <20150114204512.GB14457@ns203013.ovh.net>
 <CACRpkdZ0X_9TX_R7OJJxNynBq0gZd8i_iUE11VXtiKSN+uqpmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ0X_9TX_R7OJJxNynBq0gZd8i_iUE11VXtiKSN+uqpmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 19, 2015 at 11:16:30AM +0100, Linus Walleij wrote:
> On Wed, Jan 14, 2015 at 9:45 PM, Jean-Christophe PLAGNIOL-VILLARD
> <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> 
> > attached a patch we the idea how to handle the current issue
> > only compiled not tested (too late here)
> 
> Ludovic have you tested Jean-Christophe's patch?
> 
> Does it solve the boot issue?

Yes I have tested it. I have send a new version since it doesn't totally
solved the boot issue. It corrects some potential problems I have missed
but there is still an error in the pinctrl probe.

Regards

Ludovic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
