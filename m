From: Stephen Warren <swarren@nvidia.com>
Subject: Re: [PATCH v4 03/20] fdt: Add basic support for decoding
	GPIO definitions
Date: Wed, 18 Jan 2012 15:17:34 -0700
Message-ID: <4F1744FE.4090409@nvidia.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-4-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1326342789-5781-4-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

On 01/11/2012 09:32 PM, Simon Glass wrote:
> This adds some support into fdtdec for reading GPIO definitions from
> the fdt. We permit up to FDT_GPIO_MAX GPIOs in the system. Each GPIO
> is of the form:
> 
> gpio-function-name = <phandle gpio_num flags>;

That's not true in general.

The binding definition for the GPIO controller that provides the GPIO in
question defines the number and meaning of all cells after the phandle
cell. In practice, this usually does mean two cells with the meanings
above, but there's no need for this to be true in general.

For reference, the correct way to parse such a property is:

* Read the first cell.
* Find the node referenced by the phandle.
* Ensure property gpio-controller is present in the controller node.
* Read property #gpio-cells from the controller node.
* Extract #gpio-cells from the original property.
* Keep processing more cells from the original property; there may be
multiple GPIOs listed.

Still, I'll review this patch under the assumption that it's understood
that its applicability is limited to the subset of controllers that use
the same GPIO specifier as Tegra, i.e. that which you documented.

> where:
> 
> phandle is a pointer to the GPIO node
> gpio_num is the number of the GPIO (0 to 223)
> flags is a flag, as follows:
> 
>    bit    meaning
>    0      0=polarity normal, 1=active low (inverted)

For reference, according to the binding documentation in the Linux
kernel, Samsung Exynos4 doesn't use this format, and while all other
chips do have a flags cell, about 50% of the controllers indicate the
cell is unused.

> An example is:
> 
> gpio-enable-propounder = <&gpio 43 0>;

It appears to be idiomatic to name GPIO-related properties as plural
even when only one GPIO is expected, so e.g. "wp-gpios" for an SDHCI
controller's write-proptect GPIO, rather than simply "wp-gpio.

...
> diff --git a/include/fdtdec.h b/include/fdtdec.h
...
> +/* GPIOs are numbered from 0 */
> +enum {
> +	FDT_GPIO_NONE = -1U,	/* an invalid GPIO used to end our list */

Is this due to the way U-Boot works right now, or something defined by
this patch? It's been pointed out that the kernel's choice to use -1 as
"invalid GPIO" rather than 0 was a mistake, since that prevents GPIO
fields being easily added to platform data structures, since you then
have to go and initialize every new instance to -1, rather than relying
on BSS initializing it to 0. I assume this is just the way U-Boot works,
so solving this is outside the scope of this patch.

Ignoring all the above, the code looks correct to perform as documented.

-- 
nvpublic
