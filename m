From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 04/17] fdt: Add basic support for decoding GPIO
 definitions
Date: Mon, 05 Dec 2011 14:46:16 -0700
Message-ID: <4EDD3BA8.8040808@nvidia.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
 <1322878300-5551-5-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322878300-5551-5-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/02/2011 07:11 PM, Simon Glass wrote:
> This adds some support into fdtdec for reading GPIO definitions from
> the fdt. We permit up to FDT_GPIO_MAX GPIOs in the system. Each GPIO
> is of the form:
> 
> gpio-function-name = <phandle gpio_num flags>;
> 
> where:
> 
> phandle is a pointer to the GPIO node
> gpio_num is the number of the GPIO (0 to 223)
> flags is some flags, proposed as follows:
> 
>    bit    meaning
>    0      0=input, 1=output
>    1      for output only: inital value of output
>    2      0=polarity normal, 1=active low (inverted)

The meaning of the flags (and even whether there are any flags any if so
how many cells there are to contain them) is defined by the GPIO
controller's binding. It's not something that can be interpreted in
isolation by a generic DT parsing function. See for example #gpio-cells
in tegra20.dtsi's gpio node and kernel file
Documentation/devicetree/bindings/gpio/gpio_nvidia.txt.

This implies that a lot of the code isn't correct, but I haven't
explicitly mentioned this everywhere for brevity.

> An example is:
> 
> enable-propounder = <&gpio 43 1>;

I /think/ convention is to name such properties foo-gpios rather than
just foo. Still, this is only a comment on the example and not the code,
since the complete property name is passed into the new functions by the
caller.

> +/* For now we allow 224 GPIOs. We can extend this later if required */
> +enum {
> +	FDT_GPIO_NONE = 255,	/* an invalid GPIO used to end our list */

Can't you use 0 for that? (the kernel currently uses -1, but it seems
there's agreement that was a mistake). If you use 255, the number will
have to keep getting bumped as more complex systems become supported. If
not 0, perhaps U32_MAX or whatever the relevant ${type}_MAX is?

-- 
nvpublic
