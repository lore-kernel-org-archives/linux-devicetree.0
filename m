From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: kirkwood: Basic support for DNS-320 and DNS-325
Date: Mon, 12 Mar 2012 08:17:19 +0000
Message-ID: <201203120817.19777.arnd@arndb.de>
References: <1331476406-9844-1-git-send-email-jm@lentin.co.uk>
 <1331476406-9844-2-git-send-email-jm@lentin.co.uk>
 <20120312030232.GX5050@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120312030232.GX5050-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
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
> > +     dnskw_gpio_register(39, "dnskw:power:sata0", 1);
> > +     dnskw_gpio_register(40, "dnskw:power:sata1", 1);
> > +
> > +     /* Set NAS to turn back on after a power failure */
> > +     dnskw_gpio_register(37, "dnskw:power:recover", 1);
> > +}
> > +
> 
> I doubt this board is the only one that wants to be added while the
> conversion to devicetree is progressing.  It makes more sense to me to
> break the above out to a separate file, eg board-dnskw.c.  I'll follow
> and break out the dreamplug code to board-dreamplug.c.  Otherwise, I see
> board-dt.c becoming a long mess.
> 
> Arnd, sound okay to you?

Either way is fine with me. I personally wouldn't expect many more boards
to come in before the DT conversion has mostly completed, but I guess you
have a better feeling for what other hardware is out there that people
are interested in.

	Arnd
