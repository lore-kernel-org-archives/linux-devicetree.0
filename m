From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: kirkwood: convert orion-wdt to fdt.
Date: Sat, 3 Mar 2012 17:54:40 -0500
Message-ID: <20120303225440.GR11986@titan.lakedaemon.net>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <201203021456.47896.arnd@arndb.de>
 <20120302153614.GG11986@titan.lakedaemon.net>
 <201203021648.52523.arnd@arndb.de>
 <20120302170252.GJ11986@titan.lakedaemon.net>
 <20120302223629.GA21080@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120302223629.GA21080-g2DYL2Zd6BY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Simon Guinot <simon-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 02, 2012 at 11:36:29PM +0100, Andrew Lunn wrote:
> > > Andrew Lunn said that he has a patch for plat-orion to use the generic
> > > clock framework. I think we should look at that before introducing
> > > a hack that will have to be removed again very soon.
> > 
> > I asked him for it earlier [1], apparently it's a very invasive patch
> > series which breaks things.  I would like to look at it as a reference,
> > even if applying it isn't a good idea.
> 
> I did not say it breaks things. I said i have a habit of breaking
> orion5x, because i cannot test it.

Wow, you're right, I was way off.  I must not have read that over before
sending.  My mistake.

> I will send the patches as RFC on Sunday. I'm traveling at the moment.

Awesome, thanks.

Jason.
