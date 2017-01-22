From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/22] mtd: add DT bindings for the Cortina Systems Gemini
 Flash
Date: Sun, 22 Jan 2017 15:40:00 +0100
Message-ID: <fdc38613-18c2-3ae3-09e6-d8103c0a8f93@gmail.com>
References: <20170122122119.10510-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170122122119.10510-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/22/2017 01:21 PM, Linus Walleij wrote:
> This adds device tree bindings for the Cortina systems Gemini
> flash controller, a simple physmap which however need a few
> syscon bits to be poked to operate properly.
> 
> Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Looks pretty OK to me:
Reviewed-by: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> ---
> MTD maintainers: please just apply this to the MTD tree when
> you are happy with it. It is functionally orthogonal to the rest
> of the series and is just in the series for context.
> ---
>  .../bindings/mtd/cortina,gemini-flash.txt          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt b/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> new file mode 100644
> index 000000000000..3fa1b34d69ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> @@ -0,0 +1,24 @@
> +Flash device on Cortina Systems Gemini SoC
> +
> +This flash is regular CFI compatible (Intel or AMD extended) flash chips with
> +some special bits that can be controlled by the machine's system controller.
> +
> +Required properties:
> +- compatible : must be "cortina,gemini-flash", "cfi-flash";
> +- reg : memory address for the flash chip
> +- syscon : must be a phandle to the system controller
> +- bank-width : width in bytes of flash interface, should be <2>
> +
> +For the rest of the properties, see mtd-physmap.txt.
> +
> +The device tree may optionally contain sub-nodes describing partitions of the
> +address space. See partition.txt for more detail.
> +
> +Example:
> +
> +flash@30000000 {
> +	compatible = "cortina,gemini-flash", "cfi-flash";
> +	reg = <0x30000000 0x01000000>;
> +	syscon = <&syscon>;
> +	bank-width = <2>;
> +};
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
