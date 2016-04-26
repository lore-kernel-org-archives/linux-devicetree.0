From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] drivers: firmware: psci: unify enable-method binding
 on ARM {64, 32}-bit systems
Date: Tue, 26 Apr 2016 19:02:57 +0800
Message-ID: <20160426190257.7b2e6a9a@xhacker>
References: <1461338282-19509-1-git-send-email-sudeep.holla@arm.com>
	<571F4632.6090003@arm.com>	<31757054.8aSO57qemx@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <31757054.8aSO57qemx@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Arnd, Sudeep,

On Tue, 26 Apr 2016 12:49:00 +0200 Arnd Bergmann wrote:

> On Tuesday 26 April 2016 11:42:58 Sudeep Holla wrote:
> > On 22/04/16 16:18, Sudeep Holla wrote:  
> > > Currently ARM CPUs DT bindings allows different enable-method value for
> > > PSCI based systems. On ARM 64-bit this property is required and must be
> > > "psci" while on ARM 32-bit systems this property is optional and must
> > > be "arm,psci" if present.
> > >
> > > However, "arm,psci" has always been the compatible string for the PSCI
> > > node, and was never intended to be the enable-method. So this is a bug
> > > in the binding and not a deliberate attempt at specifying 32-bit
> > > differently.
> > >
> > > This is problematic if 32-bit OS is run on 64-bit system which has
> > > "psci" as enable-method rather than the expected "arm,psci".
> > >
> > > So let's unify the value into "psci" and remove support for "arm,psci"
> > > before it finds any users.
> > >
> > > Reported-by: Soby Mathew <Soby.Mathew-5wv7dgnIgG8@public.gmane.org>
> > > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > > Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > > Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> > > ---
> > >   Documentation/devicetree/bindings/arm/cpus.txt | 1 -
> > >   drivers/firmware/psci.c                        | 2 +-
> > >   2 files changed, 1 insertion(+), 2 deletions(-)
> > >
> > > v2->v1:
> > >       - Added Mark and Lorenzo's ACKs
> > >       - Updated commit message to specify that it also conflicts with
> > >         PSCI compatible(from Mark's reply on the thread)
> > >
> > > Hi ARM-SoC guys,
> > >
> > > Can you please pick up this single fix for PSCI binding/driver for v4.6 ?
> > >  
> > 
> > Gentle ping to include this in next round of arm-soc fixes. It would be
> > good to get this fixed before v4.6 as we don't want to have user of the
> > binding which we want to remove in the release.
> >   
> 
> Applied to the fixes branch. I have to admit that I don't understand
> how the compatible string is really used here, so I have to trust that
> this cannot break any existing machine.

To be honest, this breaks some Marvell DEBU's 32 bit SoCs' kernel, but these
SoCs' support are not mainlined yet, so it's fine to fix it as early as
possible.

Thanks,
Jisheng
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
