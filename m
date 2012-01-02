From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCHv2 1/2] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Mon, 2 Jan 2012 12:24:00 +0000
Message-ID: <20120102122400.GA6124@page>
References: <1324345431-12251-1-git-send-email-jamie@jamieiles.com>
 <20111230195955.GA3427@page> <4EFE1E35.106@gmail.com>
 <20120102121428.GA18443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120102121428.GA18443-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 02, 2012 at 12:14:28PM +0000, Mark Brown wrote:
> On Fri, Dec 30, 2011 at 02:25:25PM -0600, Rob Herring wrote:
> 
> > We've got to sort out getting irq domains enabled on x86 and MIPS in
> > order to merge generic irq chip using domains. I'm not sure that will
> > get done in time.
> 
> > Can you leave out the interrupt portion of the driver? Or that is needed
> > to get to a useful state.
> 
> Or just add a dependency in Kconfig?

Yeah, I just saw a post from Grant on another topic where he mentioned 
that 'select IRQ_DOMAIN' is the wrong thing anyway so I should introduce 
a dependency on IRQ_DOMAIN.

The IRQ part is dependent on Rob's patches to introduce irq domain 
support into the generic chip though, so how about I split this into two 
patches, one that does the basic GPIO stuff and another that does the 
IRQ portion (with the dependency change) and if Rob's patches don't make 
it in we drop the IRQ support for the GPIO?

Thanks,

Jamie
