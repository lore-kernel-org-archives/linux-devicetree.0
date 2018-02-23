From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Add a reserved-gpio-ranges
 property
Date: Fri, 23 Feb 2018 08:37:14 -0800
Message-ID: <20180223163714.GM93895@bjorns-mbp-2.lan>
References: <20180126011400.2191-1-sboyd@codeaurora.org>
 <20180126011400.2191-2-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180126011400.2191-2-sboyd@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Timur Tabi <timur@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu 25 Jan 17:13 PST 2018, Stephen Boyd wrote:

+ Rob

> Some qcom platforms make some GPIOs or pins unavailable for use
> by non-secure operating systems, and thus reading or writing the
> registers for those pins will cause access control issues.
> Introduce a DT property to describe the set of GPIOs that are
> available for use so that higher level OSes are able to know what
> pins to avoid reading/writing.
> 
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/gpio/gpio.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index b5de08e3b1a2..c22b56680fc8 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -151,9 +151,9 @@ in a lot of designs, some using all 32 bits, some using 18 and some using
>  first 18 GPIOs, at local offset 0 .. 17, are in use.
>  
>  If these GPIOs do not happen to be the first N GPIOs at offset 0...N-1, an
> -additional bitmask is needed to specify which GPIOs are actually in use,
> -and which are dummies. The bindings for this case has not yet been
> -specified, but should be specified if/when such hardware appears.
> +additional set of tuples is needed to specify which GPIOs are unusable, with
> +the reserved-gpio-ranges binding. This property indicates the start and size
> +of the GPIOs that can't be used.
>  
>  Optionally, a GPIO controller may have a "gpio-line-names" property. This is
>  an array of strings defining the names of the GPIO lines going out of the
> @@ -178,6 +178,7 @@ gpio-controller@00000000 {
>  	gpio-controller;
>  	#gpio-cells = <2>;
>  	ngpios = <18>;
> +	reserved-gpio-ranges = <0 4>, <12 2>;
>  	gpio-line-names = "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LED R",
>  		"LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
>  		"Row A", "Row B", "Row C", "Row D", "NMI button",
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
