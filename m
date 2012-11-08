From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: How about a gpio_get(device *, char *) function?
Date: Thu, 8 Nov 2012 15:23:22 +0900
Message-ID: <1503934.I4tc7K6I6s@percival>
References: <38620644.IyR5R8rjKP@percival> <1801189.6J3flQFRCq@percival>
 <CACRpkdYqCQc0Er1JR_eVzZPCycvKjd0Pph8Dcay0FbU3Q64D8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdYqCQc0Er1JR_eVzZPCycvKjd0Pph8Dcay0FbU3Q64D8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 08 November 2012 05:24:19 Linus Walleij wrote:
> On Tue, Nov 6, 2012 at 2:33 AM, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > How about, in a first time (and because I'd also like to get the power
> > seqs
> > moving on), a typedef from int to gpio_handle_t and a first implementation
> > of the gpio_handle_*() API that would just call the existing
> > integer-based API (apart from gpio_handle_get())? That way things will
> > not break when we switch to a real handle.
> 
> I'm afraid of typedef:ing gpio_handle_t to int because it sort of
> encourages non-handlers to be used mixed with the old integers.
> 
> I would prefer to create, e.g. in <linux/gpio/consumer.h>
> something like:
> 
> struct gpio;
> 
> struct gpio *gpio_get(struct device *dev, const char *name);
> 
> int gpio_get_value(struct gpio *g);
> 
> Nothing more! I.e. struct gpio is an opaque cookie, nothing to be known
> about it.

However these is already a struct gpio declared in linux/gpio.h. Shall the 
opaque handler be renamed something like "struct gpioh", or is your idea to 
make both APIs mutually exclusive?

Alex.
