From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: dts: Add mediatek MT8173 SoC and evaluation
 board dts and Makefile
Date: Tue, 16 Dec 2014 10:17:15 +0000
Message-ID: <20141216101714.GA19412@leverpostej>
References: <1418208602-35584-1-git-send-email-eddie.huang@mediatek.com>
 <1418208602-35584-4-git-send-email-eddie.huang@mediatek.com>
 <20141211180245.GE28150@leverpostej>
 <1418371705.423.31.camel@mtksdaap41>
 <20141215125932.GF462@leverpostej>
 <1418719615.8392.17.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418719615.8392.17.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "louis.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <louis.yu@mediatek.>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 16, 2014 at 08:46:55AM +0000, Eddie Huang wrote:
> Hi,
> 
> On Mon, 2014-12-15 at 12:59 +0000, Mark Rutland wrote:
> > On Fri, Dec 12, 2014 at 08:08:25AM +0000, Eddie Huang wrote:
> > > Hi Mark,
> > > 
> > > On Thu, 2014-12-11 at 18:02 +0000, Mark Rutland wrote:
> > > > Hi,
> > > > 
> > > > On Wed, Dec 10, 2014 at 10:50:01AM +0000, Eddie Huang wrote:
> > > > > Add device tree support for MT8173 SoC and evalutaion board based on it.
> > > > > 
> > > 
> > > > > +
> > > > > +	psci {
> > > > > +		compatible = "arm,psci-0.2";
> > > > > +		method = "smc";
> > > > > +	};
> > > > 
> > > > What are you using as your PSCI 0.2 implementation?
> > > > 
> > > > Is it fully compliant? (e.g. are the reset and power off functions
> > > > implemented, may CPU0 be hotplugged)?
> > > > 
> > > > Given only portions of the GIC seem to be described below, what
> > > > exception level is your kernel entered at? Per the spec it should be
> > > > EL2, but given the brokenness below with the GIC I'm suspicious.
> > > > 
> > > 
> > > Currently we only implement CPU boot, no power off, no CPU0 hotplug
> > > either. And enter kernel at EL2. Actually, we run ATF in EL3, then
> > > switch to EL2 to run lk and kernel.
> > 
> > Ok. In the absence of CPU_OFF, this is not yet a conforming PSCI 0.2
> > implementation, so I'm wary of marking this as PSCI 0.2 until that is
> > the case. Any attempt to power of CPUs will hit a BUG() in cpu_die(),
> > and we don't want that.
> 
> We are still developing PSCI related functions, CPU_ON, CPU_OFF,
> CPU_SUSPEND are ready, others are going. PSCI 0.2 is our target although
> lacks some implements

Ok. It sounds like for now you can describe this with PSCI 0.1 with
those functions implemented.

> > Is CPU0 hotplug planned?
> 
> No

In that case, for PSCI 0.1 you won't be able to have an enable-method of
"psci" for CPU0 (and hence won't get CPU_SUSPEND for the moment).

> > If not, does your PSCI implementation report CPU0 as
> > non-hotpluggable via MIGRATE_INFO_TYPE reporting a UP not migratable
> > trusted OS (and MIGRATE_INFO_UP_CPU reporting CPU0 as the resident CPU)?
> > 
> Will check whether add this

For PSCI 0.2 you will need to implement these if Cthere is no CPU0
hotplug. Luckily they will only need to return constant values so this
should be easy.

We still need to implement the relevant logic in the Linux PSCI client
code for this, but that should be small and self-contained.

> > Are SYSTEM_OFF and SYSTEM_RESET available?
> 
> No yet

Ok.

> > Thanks,
> > Mark.
> 
> Since we miss some PSCI-0.2 implements, I don't know whether I should
> remove PSCI stuff in this patch.

For the moment you will have to remove the PSCI 0.2 parts, as you are
not compliant and it's trivial to break the kernel on such a
configuration. You might get away with claiming PSCI 0.1, without an
enable method on CPU0, but this will come with reduced functionality.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
