From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC] [PATCH 3/3] IRQ: irq domain: defer of irq ressoure resolve
 at platform_drv_probe
Date: Thu, 30 May 2013 16:57:33 +0200
Message-ID: <201305301657.34093.arnd@arndb.de>
References: <20130528145219.GA30411@game.jcrosoft.org>
 <201305301510.33650.arnd@arndb.de>
 <CACxGe6vewNv-4AtLeNDkzJnP50StrXtchi3GiKcd2HZG6YMvkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6vewNv-4AtLeNDkzJnP50StrXtchi3GiKcd2HZG6YMvkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 30 May 2013, Grant Likely wrote:
> On Thu, May 30, 2013 at 2:10 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Thursday 30 May 2013, Grant Likely wrote:

> > Right, so we clearly need it. I also though of a second case, which
> > is that the xlate() function might itself return -EPROBE_DEFER in
> > the case that the irqchip driver is registered but e.g. not the
> > parent of a cascaded irqchip.
> 
> That shouldn't happen. If the parent isn't registered, then how can
> the child set itself up?

I guess it can just register the domain, but as long as no irqs
are needed, it doesn't have to set up a chained handler. I don't
think any irqchip driver today does it that way, but I think there
is nothing stopping us from doing a driver that does.

	Arnd
