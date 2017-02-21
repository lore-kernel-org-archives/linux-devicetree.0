From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: net: generalize moxart-mac to support all
 faraday based ftmac IP
Date: Wed, 22 Feb 2017 00:09:54 +0100
Message-ID: <CACRpkdZyP1r6VeFS4z0-_R4Jy89awEaHBSK=ZQcijcj3RS2F=A@mail.gmail.com>
References: <20170214085621.GA11829@app09>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170214085621.GA11829@app09>
Sender: linux-kernel-owner@vger.kernel.org
To: Greentime Hu <green.hu@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 14, 2017 at 9:56 AM, Greentime Hu <green.hu@gmail.com> wrote:

> Andestech and moxa use the same faraday mac IP, so we use faraday,ftmac.txt to describe it.
>
> Signed-off-by: Greentime Hu <green.hu@gmail.com>
> ---
>  .../net/{moxa,moxart-mac.txt => faraday,ftmac.txt} |    7 +++++--
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  2 files changed, 6 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/net/{moxa,moxart-mac.txt => faraday,ftmac.txt} (68%)
>
> diff --git a/Documentation/devicetree/bindings/net/moxa,moxart-mac.txt b/Documentation/devicetree/bindings/net/faraday,ftmac.txt
> similarity index 68%
> rename from Documentation/devicetree/bindings/net/moxa,moxart-mac.txt
> rename to Documentation/devicetree/bindings/net/faraday,ftmac.txt
> index 583418b..be4f55e 100644
> --- a/Documentation/devicetree/bindings/net/moxa,moxart-mac.txt
> +++ b/Documentation/devicetree/bindings/net/faraday,ftmac.txt
> @@ -1,8 +1,11 @@
> -MOXA ART Ethernet Controller
> +Faraday Ethernet Controller
>
>  Required properties:
>
> -- compatible : Must be "moxa,moxart-mac"
> +- compatible : Must contain "faraday,ftmac", as well as one of
> +               the SoC specific identifiers:
> +               "andestech,atmac100"
> +               "moxa,moxart-mac"

Looks right to me.

> +faraday        Faraday Technology Corporation

I think Rob already has this part on queue.

Yours,
Linus Walleij
