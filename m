From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: kirkwood: Basic support for DNS-320 and DNS-325
Date: Mon, 12 Mar 2012 14:58:39 +0000
Message-ID: <201203121458.39524.arnd@arndb.de>
References: <1331476406-9844-1-git-send-email-jm@lentin.co.uk>
 <op.wa197mq94cuzmg@gonzo.lentin.co.uk>
 <20120312142716.GA5050@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120312142716.GA5050-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 12 March 2012, Jason Cooper wrote:
> > 
> > It probably depends on how easy it is to add the gpiochips into
> > devicetree. Being able to put the LED, buttons and fans in
> > devicetree would make board-dt.c much more manageable. I started to
> > look into it and wasn't immediately obvious, but will have a closer
> > look.

I would think that gpio should not be too hard, since it has very
little dependencies on other things. GPIO on kirkwood seems to be
tightly coupled with the irq stuff, so I guess these should be done
together. We can discuss how to do these on #linaro-kernel on 
irc.freenode.net if you like.

Once interrupts and GPIO are done, that will enable a lot of
the things that already have bindings like gpio-led and gpio-key.
AFAICT, those won't even need any code changes, only a correct
specification of the device node according to the bindings in
Documentation/devicetree/bindings/gpio/*.

> > Happy to resubmit, breaking it out into a board-dnskw.c though.
> 
> Yeah, let's go ahead and do that.  pinmux and the above are going to take
> a while to sort out.  In the mean time, there's:
> 
> sheevaplug
> guruplug
> guruplug-serverplus
> Lacie-*
> Seagate-*
> rd-boards-*
> 
> just to name a few.  Plus it'll give me something to do while we wait
> for pinmux/common clock to land.

Ok, fair enough. We might also see some interest in having some of the
existing board files moved over to DT based probing in order to slim
them down, which fits in nicely with this approach.

	Arnd
