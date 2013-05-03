From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: u300: push down syscon registers
Date: Fri, 3 May 2013 16:43:47 +0200
Message-ID: <201305031643.47527.arnd@arndb.de>
References: <1367511416-4312-1-git-send-email-linus.walleij@stericsson.com>
 <201305021939.48381.arnd@arndb.de>
 <CACRpkdZHRQqd277Qv8O0dek_jYb=eewhpLYfKtip-YLYx_ukUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdZHRQqd277Qv8O0dek_jYb=eewhpLYfKtip-YLYx_ukUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 03 May 2013, Linus Walleij wrote:
> I could do something similar by creating a U300 syscon node
> and referring to it from the clk node, so the clk looks up its
> syscon to find the base.
> 
> If so, I can build this on top of the current patch series
> with multiplatform and all, as I convert the clocks to DT
> (which is the next and final step).

Yes, I think this is a good plan. If there are just two drivers,
that is probably the easiest way to do it. Using the syscon
driver is not very different in the end and avoids mapping the
same physical address range multiple times (having a static mapping
avoids this too), and I'd prefer that if you have more drivers
that need to get to the same registers.

	Arnd
