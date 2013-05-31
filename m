From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC/PATCH v2 2/2] gpio-rcar: Add DT support
Date: Fri, 31 May 2013 03:20:08 +0200
Message-ID: <4678059.RuWR6CiQ8n@avalon>
References: <1369136406-23800-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1369136406-23800-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <CACRpkdb8GYpx3ASzXB7HX5oEpAUBe-yBo0N5Ep9S+DqoE6oCLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdb8GYpx3ASzXB7HX5oEpAUBe-yBo0N5Ep9S+DqoE6oCLw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Thursday 30 May 2013 19:38:12 Linus Walleij wrote:
> On Tue, May 21, 2013 at 1:40 PM, Laurent Pinchart
> <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> > Add DT bindings for the gpio-rcar driver and read the device
> > configuration from the DT node at probe time if available.
> > 
> > Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> I am assuming this will go through Simon's tree?

I've so far pushed GPIO and pinctrl patches for SH through Simon's tree due to 
the many cross-dependencies between SH arch code and the GPIO and pinctrl 
drivers. As the situation now stabilizes, we could now push the patches 
through their respective subsystem trees.

Simon, Linus, any opinion/preference on that ?

> Note:
> > +  - gpio-ranges: Range of pins managed by the GPIO controller as a
> > 4-cells
> > +    tuple using the following syntax.
> > +
> > +    <[phandle of the pin controller node]
> > +     0
> > +     [index of the first pin]
> > +     [number of pins]>
> > +
> > +Please refer to gpio.txt in this directory for details of the common GPIO
> > +bindings used by client devices.
> 
> The above ranges are part of that document.

What about replacing that with

  - gpio-ranges: Range of pins managed by the GPIO controller.

Please refer to gpio.txt in this directory for details of gpio-ranges property 
and the common GPIO bindings used by client devices.

-- 
Regards,

Laurent Pinchart
