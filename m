From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 07/13] bindings: gpio-sx150x: Document "semtech,io-pull*"
 bindings
Date: Tue, 18 Oct 2016 11:25:43 -0500
Message-ID: <20161018162543.zsn5t522lso3e3q7@rob-hp-laptop>
References: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
 <1476714428-11264-8-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476714428-11264-8-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Oct 17, 2016 at 07:27:02AM -0700, Andrey Smirnov wrote:
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-sx150x.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
> index 02b92ae..7574137 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
> @@ -35,6 +35,14 @@ Optional properties:
>    		       polarity. For chips with fewer than 16 IO pins,
>    		       high-end bits are ignored.
>  
> +- semtech,io-pullup:
> +- semtech,io-pulldown: A bit-mask which enables-or disables the
> +  		       pull-up (pull-down) resistor for each IO line
> +  		       in the expander. Setting the bit at position n
> +  		       will enable the pull-down for the IO at the
> +  		       corresponding offset.  For chips with fewer
> +  		       than 16 IO pins, high-end bits are ignored.
> +

I take my ack back. Please put all DT changes in one patch to review as 
a whole. Drivers may evolve with features, but h/w description should 
not.

Rob
