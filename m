From: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] gpio: Add simple poweroff-gpio driver
Date: Sun, 11 Nov 2012 17:12:58 -0800
Message-ID: <20121112011258.GA23724@lizard>
References: <1352650891-18356-1-git-send-email-andrew@lunn.ch>
 <1352650891-18356-2-git-send-email-andrew@lunn.ch>
 <CACRpkdZvHBjFQTrQnxvc3WCOb2CqGbjYJxyQ5qQkSbU+UWHYZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZvHBjFQTrQnxvc3WCOb2CqGbjYJxyQ5qQkSbU+UWHYZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gmbnomis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 12, 2012 at 02:00:31AM +0100, Linus Walleij wrote:
> On Sun, Nov 11, 2012 at 5:21 PM, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> 
> > From: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
> >
> > Given appropriate devicetree bindings, this driver registers a
> > pm_power_off function to set a GPIO line high/low to power down
> > your board.
> >
> > Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
> > Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> 
> So this is just a GPIO client like any such thing right?
> 
> I mean this thing has nothing more to do with the GPIO subsystem
> than say, drivers/input/keyboard/gpio_keys.c?
> 
> So from the GPIO subsystem point of view controlling power is
> an alien concept.
> 
> But I suspect Anton may be ready to welcome a driver like this
> under drivers/power/* which I think is where it belongs.

Yup. driver/power/reset/ seems appropriate.

Thanks,
Anton.
