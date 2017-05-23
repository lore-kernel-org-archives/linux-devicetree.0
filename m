From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] rtc: gemini: Augment DT bindings for Faraday
Date: Tue, 23 May 2017 09:27:39 -0500
Message-ID: <20170523142739.34wyhtotl4jldsez@rob-hp-laptop>
References: <20170518215635.13505-1-linus.walleij@linaro.org>
 <20170518215635.13505-2-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170518215635.13505-2-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Po-Yu Chuang <ratbert-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 18, 2017 at 11:56:34PM +0200, Linus Walleij wrote:
> The Gemini RTC is actually a standard IP block from Faraday
> Technology called FTRTC010. Rename the bindings, add the
> generic compatible string and add definitions for the two
> available clocks.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Po-Yu Chuang <ratbert-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/cortina,gemini.txt     | 14 -----------
>  .../devicetree/bindings/rtc/faraday,ftrtc010.txt   | 28 ++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/cortina,gemini.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
