From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: kirkwood: Basic support for DNS-320 and DNS-325
Date: Mon, 12 Mar 2012 08:11:22 +0000
Message-ID: <201203120811.23137.arnd@arndb.de>
References: <1331476406-9844-1-git-send-email-jm@lentin.co.uk>
 <201203111746.09757.arnd@arndb.de>
 <20120312031751.GY5050@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120312031751.GY5050-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
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
> > Or even use the ranges property to remap everything into
> > a simpler address range:
> > 
> >       ocp@f1000000 {
> >               compatible = "simple-bus";
> >               ranges = <0 0xf1000000 0x1000000>;
> >               #address-cells = 1;
> >               #size-cells = 1;
> > 
> >               serial@12000 {
> >                       reg = <0x12000 0x100>;
> >                       ...
> >               };
> > 
> >               ...
> >       };
> 
> Okay, that's pretty slick.  The wdt and intc are at 0xfed00000, is that
> another ocp bus?  Or, am I missing something?

If they are on those addresses, yes. If you have a data sheet, you should
look at what the buses are named there, "ocp" was just an example and I
took that name from the <mach/kirkwood.h> file.

It does seem though that the 0xfed00000 address is where Linux maps
the same 0xf1000000 range in its own virtual address space, so it's
not something that should appear in the device tree.

	Arnd
