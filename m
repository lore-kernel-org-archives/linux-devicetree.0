From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v2] drivers: bus: add ARM CCI support
Date: Tue, 7 May 2013 11:20:42 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1305071113310.13109@syhkavp.arg>
References: <1367425108-4698-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1367425108-4698-2-git-send-email-lorenzo.pieralisi@arm.com>
 <alpine.LFD.2.03.1305011239240.11070@syhkavp.arg>
 <20130507134943.GB19477@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130507134943.GB19477-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Javi Merino <Javi.Merino-5wv7dgnIgG8@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 7 May 2013, Lorenzo Pieralisi wrote:

> On Mon, May 06, 2013 at 04:05:28PM +0100, Nicolas Pitre wrote:
> > When compiled in, module_init() is translated into device_initcall().
> > This is way too late for bringing up secondary CPUs during boot via the
> > MCPM layer.  That is not an issue as far as the code presented here is
> > concerned since there is no integration with MCPM yet, but eventually
> > we'd want the MCPM power_up_setup method to integrate with the port
> > discovery performed here instead of having them hardcoded in the
> > assembly code.  This means it would have to become early_initcall()
> > instead.  And at that point the driver infrastructure isn't fully
> > operational, meaning that driver_probe() won't be usable either (looking
> > at what we did to the TC2 spc init code is a good example of what I mean
> > here).
> 
> Yes, I thought about that. This means that CCI driver should not rely on
> platform device structs, and yes I can mirror SPC probing code to take care
> of ordering issues. I am quite tempted to remove the platform device/driver
> infrastructure altogether and just rely on the DT layer (as GIC, PL310
> do) to initialize CCI. What do you think ?

I think that's probably the best approach.  That's what we ended up 
doing to the spc code for the same reasons.

> I think I will leave the
> platform driver infrastructure, and at probe it will check if data
> structures have already been initialized by an exported function, say:
> 
> cci_of_init()

Please let's try to avoid propagating the "of" acronym further.  We 
don't use Open Firmware here.  Using "dt" is more appropriate IMHO.

> if the data structures are already initialized basically the probe
> function will do precious little and just succeeds otherwise it will
> initialize the driver as it does now.
> 
> Is there really a point in having the CCI driver represented as a
> platform driver ? Not sure at all.

I'm not sure either.


Nicolas
