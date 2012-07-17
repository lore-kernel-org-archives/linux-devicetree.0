From: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: pinctrl-imx: add support for set bits for
 general purpose registers
Date: Tue, 17 Jul 2012 10:41:04 +0800
Message-ID: <20120717024104.GE19699@shlinux2.ap.freescale.net>
References: <1341565763-10074-1-git-send-email-b29396@freescale.com>
 <CACRpkdbKOQt=gqydQNRfCOU-TaschHtFq0e_86xgvtHYMnwpKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbKOQt=gqydQNRfCOU-TaschHtFq0e_86xgvtHYMnwpKA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Liu Hui-R64343 <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 15, 2012 at 04:24:16AM +0800, Linus Walleij wrote:
> On Fri, Jul 6, 2012 at 11:09 AM, Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > The General Purpose Registers (GPR) is used to select operating modes for
> > general features in the SoC, usually not related to the IOMUX itself,
> > but it does belong to IOMUX controller.
> > We simply provide an convient API for driver to call to set the general purpose
> > register bits if needed.
> >
> > Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> I have an overall objection to this:
> 
> I have no idea at all about what's going on, and why this belongs in the pin
> control subsystem. On the contrary, from the commit description it seems to
> *not* belong in this subsystem at all.
> 
Yes, it's just from hw point of view, these GPR registers are included in IOMUXC
block. But as the spec says in my commit messages, most of what they do are not
related to IOMUX itself.
So i would agree it doesn't belong to pinctrl subsystem if we can find a better
place.

> So: exactly what does this register do, and which are the consumers?
> 
They're used for general settings for different modules like DMA, USB, PCIe,
IPU...

Regards
Dong Aisheng
