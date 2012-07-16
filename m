From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] pinctrl: pinctrl-imx: add support for set bits for
 general purpose registers
Date: Tue, 17 Jul 2012 00:15:14 +0200
Message-ID: <CACRpkdbCra8C=32wdpqyf9e05AsBDeiADiDn_FesvvW9bteVcA@mail.gmail.com>
References: <1342084080-3145-1-git-send-email-b29396@freescale.com>
 <CACRpkdbHtgKLA3JJxc4VY35zSpJFvk15u62Z3aBCqERoeQ10CA@mail.gmail.com>
 <20120716081703.GH21635@b20223-02.ap.freescale.net>
 <201207161340.18528.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201207161340.18528.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: b20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 16, 2012 at 3:40 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> One thing I've thought about
> before is to create some kind of very simple "system controller"
> framework based on regmap that lets you register a single global
> "struct regmap" pointer from an SoC specific driver, and have drivers
> call a function into that framework to get a reference to that
> regmap.

This sounds like a good idea. "misc-bit-poking" is something a lot
of systems are doing.

I haven't fully grasped regmap so that I can say whether that is the
proper abstraction or not though. But I trust you on this...

Yours,
Linus Walleij
