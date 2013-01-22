From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/7] ARM i.MX6q: Add GPU, VPU, IPU, and OpenVG resets to
 System Reset Controller (SRC)
Date: Tue, 22 Jan 2013 15:50:05 +0800
Message-ID: <20130122075003.GF2272@S2100-06.ap.freescale.net>
References: <1358352787-15441-1-git-send-email-p.zabel@pengutronix.de>
 <1358352787-15441-4-git-send-email-p.zabel@pengutronix.de>
 <CAKGA1bmjKQcX3RzSjbnuYqoJqbzXYGa_Whv7QQkNyAhBDzZWdw@mail.gmail.com>
 <1358761930.2522.54.camel@pizza.hi.pengutronix.de>
 <CAKGA1bmkyU_LEJt17SvUwUUh0wXG-2o_5nOGaW8RWDV45g3bVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKGA1bmkyU_LEJt17SvUwUUh0wXG-2o_5nOGaW8RWDV45g3bVg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux ARM Kernel ML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2013 at 11:47:12AM -0600, Matt Sealey wrote:
> > Yes, maybe the module reset part of the SRC should be implemented as a
> > proper device driver in drivers/reset. Then we could use the interrupt
> > functionality and WARN_ON(timeout), as you suggest.
> 
> That would be ideal. Maybe Shawn or Fabio can bug a hardware guy to
> shed some light on what a reasonable timeout might actually be for a
> module to cause such a warning. I think it should definitely cause
> one.. as I said, I was using 5 seconds, you used 1 second, I don't
> think a shorter delay would be unreasonable, but maybe it could take
> up to 10 seconds, or maybe I am wrong - maybe it is in fact impossible
> in hardware for a reset to "fail" at least visibly because the
> interrupt will always fire making the warning a never-traveled path.
> It is certainly not something that would be documented, so without a
> view of the RTL logic here, we wouldn't know.
> 
> Shawn, Fabio?
> 
Just talked to hardware people, the reset should finish in a few
clock cycles, so even 1 millisecond should be enough.

Shawn
