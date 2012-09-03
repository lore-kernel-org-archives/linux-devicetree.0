From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 4/6 v2] ARM: integrator: initial device tree support
Date: Mon, 3 Sep 2012 22:55:05 +0100
Message-ID: <20120903215505.GB31511@n2100.arm.linux.org.uk>
References: <1346471760-23993-1-git-send-email-linus.walleij@linaro.org>
 <1346471760-23993-3-git-send-email-linus.walleij@linaro.org>
 <1346471760-23993-4-git-send-email-linus.walleij@linaro.org>
 <201209011841.58977.arnd@arndb.de>
 <CACRpkdZhJyqeeXV_Zcfi7S01oH1Kw95qvAmOqrMKwhSLb-mX=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZhJyqeeXV_Zcfi7S01oH1Kw95qvAmOqrMKwhSLb-mX=Q@mail.gmail.com>
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
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 03, 2012 at 11:43:37PM +0200, Linus Walleij wrote:
> On Sat, Sep 1, 2012 at 8:41 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > I think we discussed this before. It would be nice to replace the #if/#else
> > with
> >
> > #ifdef CONFIG_OF
> > ...
> > #endif
> > #ifdef CONFIG_ATAG
> > ...
> > #endif
> 
> Sure, have you applied Nico's patch adding CONFIG_ATAG to and
> ARM SoC branch so I can base my patches on it?
> 
> I was under the impression that his patch would go through Russell's
> tree and I would thus not be able to rely on it until it has landed there
> and you have pulled Russell's stuff into your tree.

One of them is already in my tree - I put it in on Saturday though on an
unstable branch.

> Currently I would make it impossible to use ATAGs if I do this since
> the symbol does not exist, so I really need to base such an
> approach in a tree which has CONFIG_ATAG in the first place.

I've just merged that patch though.
