From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 4/6 v2] ARM: integrator: initial device tree support
Date: Tue, 4 Sep 2012 22:34:02 -0700
Message-ID: <20120905053402.GI6747@quad.lixom.net>
References: <1346471760-23993-1-git-send-email-linus.walleij@linaro.org>
 <1346471760-23993-3-git-send-email-linus.walleij@linaro.org>
 <1346471760-23993-4-git-send-email-linus.walleij@linaro.org>
 <201209011841.58977.arnd@arndb.de>
 <CACRpkdZhJyqeeXV_Zcfi7S01oH1Kw95qvAmOqrMKwhSLb-mX=Q@mail.gmail.com>
 <20120903215505.GB31511@n2100.arm.linux.org.uk>
 <CACRpkdbXSaBNystUv9RTmDKrmV=OakFF49LPkoQtoi9FnaXmDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbXSaBNystUv9RTmDKrmV=OakFF49LPkoQtoi9FnaXmDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 04, 2012 at 09:19:10AM +0200, Linus Walleij wrote:
> On Mon, Sep 3, 2012 at 11:55 PM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> > [Me]
> >> Currently I would make it impossible to use ATAGs if I do this since
> >> the symbol does not exist, so I really need to base such an
> >> approach in a tree which has CONFIG_ATAG in the first place.
> >
> > I've just merged that patch though.
> 
> OK great, Arnd do you have a Russell baseline in ARM SoC or is it
> easier if I try to submit this series directly to Russell?

Since Russell said he hasn't applied it to a stable branch we can't pull
anything in yet. But once he does, especially if he does it on a separate topic
branch, we can easily pull that in as a prerequisite in arm-soc. Russell?

There probably isn't much conflicting development in this release cycle
on integrator though, so having all changes go through Russell could be
OK as well. Only time that becomes awkward is if there's changes in both
trees that end up needing manual merge resolution. I don't think that's
high risk in this case.

So, Linus, it's up to you (and Russell) what you prefer, but I'd be
happy to take it through arm-soc if we get a stable base.


-Olof
