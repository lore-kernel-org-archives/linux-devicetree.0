From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DT version of kirkwood_ge0x_init()
Date: Wed, 05 Jun 2013 11:04:38 +0200
Message-ID: <51AEFF26.8080004@gmail.com>
References: <51ADBEE0.5040500@keymile.com> <51ADC2C2.6010106@gmail.com>
 <51AE53D4.5070208@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51AE53D4.5070208-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
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
To: Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "Longchamp, Valentin" <Valentin.Longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "Brunck, Holger" <Holger.Brunck-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, Simon Guinot <simon-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/04/13 22:53, Gerlando Falauto wrote:
> thanks for your answer and your hard work about this whole cleanup.
>
> Two more questions though -- the whole pulling sequence and the
> mainlining process is still very confusing to me so I really have no
> idea where to look or what to expect.
>
> 1) Has this been pulled somewhere? You provided a pointer to the LKML
> but I assume this would pop up by way of an -arm tree... is that right?
> I'd like to start using that.

mv643xx_eth DT support (i.e. Patches 1-6 of that patch set) have been
pulled into net-next by David Miller. The rest will be pulled by Jason
Cooper as soon as net-next goes into mainline linux.

> 2) About my old fixes for the IRQ conflicts on Kirkwood, I saw that
> Thomas Gleixner's rework was pulled into the "tip" tree, but that's more
> genirq related. Did you (or anyone else) also follow up on that and make
> the changes for Kirkwood in order to enable the separate mask registers?
> I'd like to test that (that's actually why I started looking at recent
> kernels with FDT support to begin with).
> Or shall I just follow Thomas' proof of concept on irq-sun4i and do the
> same for Kirkwood?

I have irqchip and clocksource drivers ready for Orion SoCs (Kirkwood,
Dove, Orion5x, MV78x00). Just need some time to rebase and send patches.

> Sorry, I am really more than lost when it's about tracking
> how/where/when changes are pulled. Any "mainlining for dummies" pointer
> would be more than appreciated.

Hmm, sometimes I am also lost especially about when branches will be
merged. Jason can tell you for sure. Basically, patches go into some
maintainer's or submaintainer's branch first.

For mv643xx_eth DT patches the drivers/net related part goes through
net-next, the dove/kirkwood/orion5x related patches go through mvebu
(Jason Cooper) which will be pulled into arm-soc. But that varies with
every patch set and depends on likes and wishes.

Sebastian
