From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: DT version of kirkwood_ge0x_init()
Date: Tue, 4 Jun 2013 06:43:02 -0400
Message-ID: <20130604104302.GX3803@titan.lakedaemon.net>
References: <51ADBEE0.5040500@keymile.com>
 <51ADC2C2.6010106@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51ADC2C2.6010106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, "Longchamp,
 Valentin" <Valentin.Longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "Brunck,
 Holger" <Holger.Brunck-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, Simon Guinot <simon-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 04, 2013 at 12:34:42PM +0200, Sebastian Hesselbarth wrote:
> On 06/04/13 12:18, Gerlando Falauto wrote:
> >I noticed how most of the DT-aware board-setup files only have a single
> ><board>_init() function, calling kirkwood_ge00_init() with a struct
> >mv643xx_eth_platform_data as a single argument.
> >
> >I was wondering -- is there a reason why we cannot remove all this
> >board-specific code and move all this to the DT?
> 
> Gerlando,
> 
> DT for mv643xx_eth is on the way (https://lkml.org/lkml/2013/5/29/527).
> We wait for the driver to surface to relax branch dependencies and then
> move all DT Orion SoCs to it.
> 
> > I would really love to have all our boards under a single
> > CONFIG_<FAMILY>_DT and a single compatible string, with all the
> > differences within the DTs itself -- no more #ifdef CONFIG_<BOARD>,
> > no more of_machine_is_compatible("boardXXX").
> 
> All those will happen if there is DT support for mv643xx_eth which
> is the only driver left without DT and board dependencies. But there
> will be no CONFIG_LACIE_DT or whatever, but just CONFIG_KIRKWOOD_DT
> and board dependent stuff described in the corresponding dts.

Gerlando,

Yes, the mess you describe is temporary.  Those board files used to have
a lot more code in them, legacy init of partitions, MPP, LEDs, etc.  As
we have converted drivers, they have gotten smaller and smaller.

Now, with Sebastian's hard work, we'll finally be able to remove them
and kirkwood will be completely DT.  We're very excited about this. :)

Next, we'll move the Marvell DT boards over to mach-mvebu/ and only
legacy boards in -kirkwood/, -orion5x/, -dove/, and -mv78xx0/ will
remain.  After a few releases we will deprecate any legacy boards which
haven't been converted to DT.

thx,

Jason.
