From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 9/9] Kirkwood: Add basic device tree support for QNAP
 TS219.
Date: Sun, 10 Jun 2012 19:48:42 +0200
Message-ID: <20120610174842.GA22507@lunn.ch>
References: <1339324322-29388-10-git-send-email-andrew@lunn.ch>
 <20120610172313.GA14756@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120610172313.GA14756-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
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
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, machael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > diff --git a/arch/arm/mach-kirkwood/Kconfig b/arch/arm/mach-kirkwood/Kconfig
> > index 199764f..8c6a5cd 100644
> > --- a/arch/arm/mach-kirkwood/Kconfig
> > +++ b/arch/arm/mach-kirkwood/Kconfig
> > @@ -47,6 +47,7 @@ config MACH_GURUPLUG
> >  config ARCH_KIRKWOOD_DT
> >  	bool "Marvell Kirkwood Flattened Device Tree"
> >  	select USE_OF
> > +	select SERIAL_OF_PLATFORM
> 
> Please remove as previously discussed.  I'm in the process of updating
> kirkwood_defconfig (it will include this).  Thanks.

No problems. I just got bitten by this too many times...

It would be good if all the DT boards where compiled all the time.  We
can then see build failures in kisskb.

    Andrew
