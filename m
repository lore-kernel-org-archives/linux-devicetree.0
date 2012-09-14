From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v3 2/5] Documentation: add description of DT binding
 for the gpio-mvebu driver
Date: Fri, 14 Sep 2012 19:46:03 -0400
Message-ID: <20120914234603.GB5469@titan.lakedaemon.net>
References: <1347551658-24449-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1347551658-24449-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <50524026.20104@gmail.com> <20120913223059.2d0606b2@skate>
 <50524363.9070100@gmail.com>
 <CACRpkdY3ePZLUJsX_X9QGyo6dCDmweUd5Lq7BYnQ4P0uGVj-uQ@mail.gmail.com>
 <20120914165408.4beaefe7@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120914165408.4beaefe7@skate>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 14, 2012 at 04:54:08PM +0200, Thomas Petazzoni wrote:
> Dear Linus Walleij,
> 
> On Fri, 14 Sep 2012 15:17:09 +0200, Linus Walleij wrote:
> 
> > >> Yes, I know, but MAINTAINERS does not mention an alternate maintainer
> > >> for the GPIO subsystem. Who is the interim maintainer that will
> > >> ultimately have to ack/nack those patches?
> > >
> > > Linus W. is.
> > 
> > I stated Reviewed-by: on the GPIO patch, please merge it through the
> > Marvell tree (I guess that's the plan?)
> 
> Yes, I guess it's the easiest plan (Jason ? Andrew ?). We however need
> Acks on the pinctrl patch series as well, since this one depends on it.

Yes, that's the plan.  I'm currently waiting for my previous series of
pull requests to get pulled before I start pulling in anything else.

thx,

Jason.
