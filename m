From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V2 3/3] ARM: kirkwood: Define NAND partitions in dts
Date: Mon, 26 Mar 2012 12:20:50 -0400
Message-ID: <20120326162050.GT2484@titan.lakedaemon.net>
References: <1332594876-8673-1-git-send-email-jm@lentin.co.uk>
 <1332594876-8673-4-git-send-email-jm@lentin.co.uk>
 <4F7090F9.5000603@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F7090F9.5000603-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 26, 2012 at 10:53:29AM -0500, Scott Wood wrote:
> On 03/24/2012 08:14 AM, Jamie Lentin wrote:
> > Use devicetree to define NAND partitions. Use D-link partition scheme by
> > default, to be vaguely compatible with their userland.
> > 
> > Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/kirkwood-dns320.dts |   35 +++++++++++++++++++++++++++++++++
> >  arch/arm/boot/dts/kirkwood-dns325.dts |   35 +++++++++++++++++++++++++++++++++
> >  arch/arm/mach-kirkwood/board-dnskw.c  |   31 -----------------------------
> >  3 files changed, 70 insertions(+), 31 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/kirkwood-dns320.dts b/arch/arm/boot/dts/kirkwood-dns320.dts
> > index 58de7f2..fbf55ff 100644
> > --- a/arch/arm/boot/dts/kirkwood-dns320.dts
> > +++ b/arch/arm/boot/dts/kirkwood-dns320.dts
> > @@ -25,5 +25,40 @@
> >  			clock-frequency = <166666667>;
> >  			status = "ok";
> >  		};
> > +
> > +		nand@3000000 {
> > +			status = "ok";
> > +
> 
> This should be "okay", not "ok" -- see IEEE1275.  Or just leave it out.

Ack, but it needs to be there.  Most, but not all, kirkwood boards have
nand, so we define it in kirkwood.dtsi and set it as disabled.
Individual boards can then enable it as needed.

As for 'okay', looks like we may need to patch of_device_is_available()
in drivers/of/base.c (~284) if we want to be consistent with IEEE1275.

The following boards would need to be updated:

arch/arm/boot/dts/kirkwood-dreamplug.dts
arch/powerpc/boot/dts/currituck.dts
arch/powerpc/boot/dts/iss4xx-mpic.dts

Grant, any thoughts on this?

thx,

Jason.
