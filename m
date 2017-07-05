From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3 v2] rtc: gemini: Augment DT bindings for Faraday
Date: Wed, 5 Jul 2017 23:01:19 +0200
Message-ID: <20170705210119.fzzc2hqlj3hftmi7@piout.net>
References: <20170530075332.3740-1-linus.walleij@linaro.org>
 <20170530075332.3740-2-linus.walleij@linaro.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <rtc-linux+bncBCKYNX7Y3IMBBIFH6XFAKGQEXP2HGMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170530075332.3740-2-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Po-Yu Chuang <ratbert-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30/05/2017 at 09:53:31 +0200, Linus Walleij wrote:
> The Gemini RTC is actually a standard IP block from Faraday
> Technology called FTRTC010. Rename the bindings, add the
> generic compatible string and add definitions for the two
> available clocks.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Po-Yu Chuang <ratbert-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> ChangeLog v1->v2:
> - Add Rob's ACK.
> ---
>  .../devicetree/bindings/rtc/cortina,gemini.txt     | 14 -----------
>  .../devicetree/bindings/rtc/faraday,ftrtc010.txt   | 28 ++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/cortina,gemini.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
