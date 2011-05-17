From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: device_tree binding for "amba bus"
Date: Tue, 17 May 2011 23:41:34 +0100
Message-ID: <20110517224134.GC2266@n2100.arm.linux.org.uk>
References: <f9ae780a-2747-427f-826a-e0b510ca8afb@VA3EHSMHS001.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f9ae780a-2747-427f-826a-e0b510ca8afb-+Ck8Kgl/v09ZbvUCbuG1mrjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 17, 2011 at 01:28:33PM -0700, Stephen Neuendorffer wrote:
> None of this seems terribly interesting enough to justify a bus that has
> a small number of users:

However, without this infrastructure, drivers have to start doing those
three points you bring up themselves, manually, with additional code,
which makes for additional bugs.  No thanks.  Let's keep the bus
abstraction there as it serves to ensure that the right things happen
at the right time.

> And at the very least the hardcoded nature of the names seems, well...
> hardcoded.

What hardcoded names?  Driver names no matter what bus are part of the
_userspace_ API - remember that almost everything in the device model
is exported to userspace and is therefore part of the kernel's userspace
API.  So logically the driver names do want to be stable.

> Any thoughts about how to abstract this in a device tree?
> (My thoughts: devices need to reference a clock, devices need to
> reference a regulator,
> and it seems to me that the register check could be pulled out into a
> single call that the
> devices that care about it can do themselves during probe() )

And another during their remove callback - and where do they store the
data associated with that?  Will the drivers need to have a certain
base driver_data structure?

This all sounds like getting rather icky and prone to bugs.
