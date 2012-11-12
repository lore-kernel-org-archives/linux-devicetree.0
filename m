From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 12/14] ARM: SPEAr3xx: shirq: simplify and move the shared
 irq multiplexor to DT
Date: Mon, 12 Nov 2012 17:00:36 +0000
Message-ID: <201211121700.36892.arnd@arndb.de>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
 <201211121509.45176.arnd@arndb.de>
 <CAOh2x=nJXVVjFmDFnTN_02PSG9hcDuXToRUzRMi5jwJqUFtgfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOh2x=nJXVVjFmDFnTN_02PSG9hcDuXToRUzRMi5jwJqUFtgfw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: viresh kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 12 November 2012, viresh kumar wrote:
> On Mon, Nov 12, 2012 at 8:39 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Sunday 11 November 2012, Viresh Kumar wrote:
> 
> >>  .../devicetree/bindings/arm/spear/shirq.txt        |  48 ++++
> >>  arch/arm/mach-spear3xx/include/mach/irqs.h         |  10 +-
> >>  arch/arm/mach-spear3xx/spear300.c                  | 103 -------
> >>  arch/arm/mach-spear3xx/spear310.c                  | 202 --------------
> >>  arch/arm/mach-spear3xx/spear320.c                  | 204 --------------
> >>  arch/arm/mach-spear3xx/spear3xx.c                  |   4 +
> >>  arch/arm/plat-spear/include/plat/shirq.h           |  35 +--
> >>  arch/arm/plat-spear/shirq.c                        | 305 +++++++++++++++++----
> >
> > I guess it would be nice to move this to drivers/irqchip/st-shirq.c now
> > that we have introduced that directory.
> 
> I was sure that i will get this one :)
> I wanted to, but was just trying the basic patch first :)
> 
> I would add another patch in this series as the last patch to move stuff
> out of plat :)

Ok, no problem. Do it later then.

	Arnd
