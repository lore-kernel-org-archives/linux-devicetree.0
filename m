From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3.9 1/3] misc: new driver for GPIO-connected 7-segment
 displays
Date: Mon, 7 Jan 2013 19:43:39 +0000
Message-ID: <201301071943.40074.arnd@arndb.de>
References: <1357576928-29133-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1357576928-29133-2-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357576928-29133-2-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 07 January 2013, Thomas Petazzoni wrote:

>  .../devicetree/bindings/misc/gpio-7seg.txt         |   18 +++
>  drivers/misc/Kconfig                               |   13 ++
>  drivers/misc/Makefile                              |    1 +
>  drivers/misc/gpio-7seg.c                           |  168 ++++++++++++++++++++

I wonder if it would make sense to merge this into the LED subsystem
rather than having it as a standalone driver.

> diff --git a/Documentation/devicetree/bindings/misc/gpio-7seg.txt b/Documentation/devicetree/bindings/misc/gpio-7seg.txt
> new file mode 100644
> index 0000000..107d178
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/gpio-7seg.txt
> @@ -0,0 +1,18 @@
> +* 7-segment driver connected over GPIO through a BCD decoder
> +
> +Required properties:
> +- compatible: "generic,gpio-7seg"
> +- gpios: list of GPIOs to use to control the 7-segment display

Maybe list the minimum and maximum number of gpio lines here?

> +	sdev->dev_attr.attr.name = "value";
> +	sdev->dev_attr.attr.mode = S_IRUGO | S_IWUGO;
> +	sdev->dev_attr.show = gpio_7seg_show;
> +	sdev->dev_attr.store = gpio_7seg_store;

Any reason why you are not using the DEVICE_ATTR macro?

	Arnd
