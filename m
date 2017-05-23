From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/8] clocksource/drivers/fttmr010: Merge FTTMR010 DT
 bindings
Date: Mon, 22 May 2017 19:51:19 -0500
Message-ID: <20170523005119.wkfvs5qnwhmr62bd@rob-hp-laptop>
References: <20170517140542.20016-1-linus.walleij@linaro.org>
 <20170517140542.20016-3-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170517140542.20016-3-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 17, 2017 at 04:05:36PM +0200, Linus Walleij wrote:
> This merges the Moxa and FTTMR010 device tree bindings into the
> Faraday binding document to avoid confusion.
> 
> The FTTMR010 is the IP block used by these SoCs, in vanilla
> or modified variant.
> 
> The Aspeed variant is modified such that it is no longer fully
> register-compatible with FTTMR010 so for this reason it is not
> listed with two compatible strings, instead just one.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> Cc: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/timer/faraday,fttmr010.txt    |  4 +++-
>  .../devicetree/bindings/timer/moxa,moxart-timer.txt   | 19 -------------------
>  2 files changed, 3 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
