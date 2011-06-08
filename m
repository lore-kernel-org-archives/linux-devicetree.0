From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v3 2/2] dt: add custom device creation to platform bus
	scan
Date: Wed, 8 Jun 2011 08:16:00 +0200
Message-ID: <201106080816.00565.arnd@arndb.de>
References: <1306359073-16274-1-git-send-email-robherring2@gmail.com>
	<201106012329.20651.arnd@arndb.de> <4DEEE8AF.50603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4DEEE8AF.50603-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 08 June 2011 05:12:47 Rob Herring wrote:
> The simplest solutions are usually the best. With that, the 2nd patch 
> becomes:
>
>   static int of_dev_node_match(struct device *dev, void *data)
>   {
> @@ -234,6 +235,11 @@ static int of_platform_bus_create(struct 
> device_node *bus,
>                  return 0;
>          }
> 
> +       if (of_device_is_compatible(bus, "arm,amba-device")) {
> +               of_amba_device_create(bus, parent);
> +               return 0;
> +       }
> +

Sounds good to me, just remind me what of_amba_device_create does when
amba is disabled. I guess it should do nothing in that case, there
can be no amba drivers loaded, so the device is clearly not needed.

	Arnd
