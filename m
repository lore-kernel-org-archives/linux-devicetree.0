From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC] [PATCH 3/3] IRQ: irq domain: defer of irq ressoure resolve
 at platform_drv_probe
Date: Thu, 30 May 2013 15:10:33 +0200
Message-ID: <201305301510.33650.arnd@arndb.de>
References: <20130528145219.GA30411@game.jcrosoft.org>
 <201305300952.06036.arnd@arndb.de>
 <CACxGe6uWYnqm5RYDDBhGQv7h8eDuA6skaR4Je18CSP4KfGzw=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6uWYnqm5RYDDBhGQv7h8eDuA6skaR4Je18CSP4KfGzw=w@mail.gmail.com>
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
> On Thu, May 30, 2013 at 8:52 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> >
> > Since a platform device only has one "interrupt-parent", as soon as
> > one of the interrupts can get mapped, I would expect that the controller
> > is present, and we don't need to defer the probing any more.
> 
> If it goes through an interrupt map node then it may only be able to
> resolve a subset.

Right, so we clearly need it. I also though of a second case, which
is that the xlate() function might itself return -EPROBE_DEFER in
the case that the irqchip driver is registered but e.g. not the
parent of a cascaded irqchip.

	Arnd
