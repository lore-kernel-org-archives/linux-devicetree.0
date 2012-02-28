From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH WIP] ARM: kirkwood: covert orion-spi to fdt.
Date: Tue, 28 Feb 2012 10:06:03 -0500
Message-ID: <20120228150603.GY23524@titan.lakedaemon.net>
References: <20120228094059.GA27255@lunn.ch> <201202281004.14366.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201202281004.14366.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2012 at 10:04:14AM +0000, Arnd Bergmann wrote:
> On Tuesday 28 February 2012, Andrew Lunn wrote:
> > I think this code belongs on the board-dts.c file. kirkwood_clk_ctrl
> > is a global so can be set from anywhere. It is also set in other files
> > than common.c, eg pcie.c.
> 
> Ok, that makes sense.

Yes, my goal is to eventually eliminate common.c, pcie.c, etc.  If we do
it right, kirkwood_clock_gate() won't be necessary.

> > In the end, i hope this all goes away. I have patches based on Mike's
> > generic clk infrastructure, which adds clk/clkdev to all orion based
> > machines. So the SPI driver, in its probe function will get its clock,
> > enable it, and also find out the speed of it. The release function
> > also disables the clock, turning it off if nobody else is using it. 
> > 
> > I just hope the generic clk does not take too long to land.
> 
> Excellent, that will of course be the best solution in the long run.

Agreed.

thx,

Jason.
