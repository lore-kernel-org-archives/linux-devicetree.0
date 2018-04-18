From: =?UTF-8?B?TXlsw6huZQ==?= Josserand <mylene.josserand@bootlin.com>
Subject: Re: [PATCH v6 09/11] ARM: sun8i: smp: Add support for A83T
Date: Wed, 18 Apr 2018 07:46:43 +0200
Message-ID: <20180418074643.5bd68168@dell-desktop.home>
References: <20180416215032.5023-1-mylene.josserand@bootlin.com>
        <20180416215032.5023-10-mylene.josserand@bootlin.com>
        <20180417112038.mw7bfhqw4xwvzxcw@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417112038.mw7bfhqw4xwvzxcw@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux@armlinux.org.uk, wens@csie.org, marc.zyngier@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, clabbe.montjoie@gmail.com, quentin.schulz@bootlin.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Maxime,

On Tue, 17 Apr 2018 13:20:38 +0200
Maxime Ripard <maxime.ripard@bootlin.com> wrote:

> On Mon, Apr 16, 2018 at 11:50:30PM +0200, Mylène Josserand wrote:
> > @@ -535,8 +599,12 @@ static int sunxi_mc_smp_cpu_kill(unsigned int l_cpu)
> >  	return !ret;
> >  }
> >  
> > -static bool sunxi_mc_smp_cpu_can_disable(unsigned int __unused)
> > +static bool sunxi_mc_smp_cpu_can_disable(unsigned int cpu)
> >  {
> > +	/* CPU0 hotplug not handled for sun8i-a83t */
> > +	if (is_sun8i)
> > +		if (cpu == 0)
> > +			return false;
> >  	return true;  
> 
> I think Chen-Yu told you how to implement the hotplug in the previous
> iteration, did you have time to test it?

Not yet, I will have a look this evening.

Best regards,

-- 
Mylène Josserand, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
