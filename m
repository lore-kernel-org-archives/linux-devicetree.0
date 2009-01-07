From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: The usage of compatible 'simple-bus'
Date: Wed, 7 Jan 2009 09:25:51 -0600
Message-ID: <20090107152551.GA15585@ld0162-tx32.am.freescale.net>
References: <20090106014323.GB29456@yookeroo.seuss>
	<3A45394FD742FA419B760BB8D398F9ED0B38C9@zch01exm26.fsl.freescale.net>
	<20090107020006.GD13731@yookeroo.seuss>
	<2a27d3730901061951g333d10b6mf4dc0219570e521b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2a27d3730901061951g333d10b6mf4dc0219570e521b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 07, 2009 at 11:51:12AM +0800, Li Yang wrote:
> > I see two sensible options for this situation:
> >        - Move the MDIO node to outside the gianfar MAC node.  I think
> > this is already done on some boards with gianfar?
> 
> Yes, we can use good old way.  But as Scott has moved the MDIO into
> the gianfar node on MPC8313, maybe it's a better way to describe the
> relationship of the two parts.

Ah, right, that was to reflect the clock domain situation so that someday
when I get time to do device power management the kernel can know that by
shutting down ethernet@25000 it's also shutting down mdio@24520, which is
also used by ethernet@26000.

Adding simple-bus was a bit of a hack, but it preserves the existing
binding whereby mdio sits under a simple-bus.  Ideally, the mdio node
would simply be a container for PHY nodes, and would simply be a part of
gianfar rather than a separate entity.

-Scott
