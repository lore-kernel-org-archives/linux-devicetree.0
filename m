From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND][PATCH v4] gpio: davinci: reuse for keystone soc
Date: Tue, 4 Mar 2014 10:20:54 +0100
Message-ID: <CACRpkda=+vnOEfGeZNS7+7WXU4v29gfQYY0xoc8d-sFEfrWqUw@mail.gmail.com>
References: <52FBB6BC.2060801@ti.com>
	<1392307125-27927-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392307125-27927-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 13, 2014 at 4:58 PM, Grygorii Strashko
<grygorii.strashko-l0cyMroinI0@public.gmane.org> wrote:

> The similar GPIO HW block is used by keystone SoCs as
> in Davinci SoCs.
> Hence, reuse Davinci GPIO driver for Keystone taking into
> account that Keystone contains ARM GIC IRQ controller which
> is implemented using IRQ Chip.
>
> Documentation:
>         http://www.ti.com/lit/ug/sprugv1/sprugv1.pdf
>
> Acked-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>

Applied! Santosh hunted me down in person so it really happened this
time...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
