From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 2/3 v4] arm: kirkwood: add dreamplug (fdt) support.
Date: Thu, 1 Mar 2012 07:20:00 -0500
Message-ID: <20120301122000.GA6276@titan.lakedaemon.net>
References: <20120224075753.GA24858@lunn.ch>
 <20120229144450.GB23524@titan.lakedaemon.net>
 <20120229235326.GA3207@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120229235326.GA3207-g2DYL2Zd6BY@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 01, 2012 at 12:53:26AM +0100, Andrew Lunn wrote:
> On Wed, Feb 29, 2012 at 09:44:50AM -0500, Jason wrote:
> > On Fri, Feb 24, 2012 at 08:57:53AM +0100, Andrew Lunn wrote:
> > > I have some patches under development which will help.
> > 
> > Any chance you could shoot those to me?  (on-list preferable)  I'm
> > thinking we could convert it to an interim solution eg
> > kirkwood_{get,put}_clock() that would be easy to migrate to generic
> > CLK/clkdev once it lands.
> 
> It is not that easy. It is not kirkwood, but all platform orion, so
> includes dove, orion5x, mv78xx0 and kirkwood. All these share the same
> device drivers, since they all share the same SoC peripheral
> cores. However, only kirkwood has per peripheral gated clocks and all
> the others share tclk.
> 
> I've also broke orion5x twice so far with my patches, since i don't
> have any hardware with that SoC. So this time i was hoping to ask for
> testing on orion5x before submitting to mainline.
> 
> Mike did say he hoped the generic clk would be ready last week. Maybe
> we should ping him and ask for a new ETA?

Nah, it'll be ready when it's ready.  I'll keep things the way they are
and gut through the conversion once his stuff is in mainline.

thx,

Jason.
