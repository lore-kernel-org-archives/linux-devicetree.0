From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/6] Integrator devicetree support
Date: Thu, 30 Aug 2012 17:01:18 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1208301659070.1784@xanadu.home>
References: <1345119317-22600-1-git-send-email-linus.walleij@linaro.org>
 <201208161344.55723.arnd@arndb.de>
 <CACRpkdYYgdzAU=nyL7dQbdMLx3z3G+K7ba0uJe1=aX=BLeF_sg@mail.gmail.com>
 <alpine.LFD.2.02.1208191148520.1754@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.02.1208191148520.1754-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
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
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 19 Aug 2012, Nicolas Pitre wrote:

> On Sun, 19 Aug 2012, Linus Walleij wrote:
> 
> > But then we hit #ifdeffing and compiling out a lot of dangerous stuff
> > in arch/arm/kernel and then I get the creeps. I can try, but I think
> > this is typical Nico territory for example...
> 
> I did post a patch moving all the ATAG stuff to a separate source file a 
> while ago, exactly for that purpose.  I should try to dig it out and 
> refresh it.

OK... In this case "a while ago" = 2 years!

Please see the 2 patches to follow.


Nicolas
