From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: Boot interface for device trees on ARM
Date: Tue, 18 May 2010 13:24:43 +0800
Message-ID: <201005181324.45701.jeremy.kerr@canonical.com>
References: <201005181054.32325.jeremy.kerr@canonical.com>
	<alpine.LFD.2.00.1005172341200.12758@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1005172341200.12758-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: nicolas.pitre-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

> I think that, for the moment, it is best if the bootloader on already 
> existing subarchitectures where DT is introduced still preserve the 
> already existing ability to boot using ATAGs.  This allows for the 
> testing and validation of the DT concept against the legacy ATAG method 
> more easily.

Just to clarify - by "still preserve the existing ability to use ATAGs" you 
mean only for non-DT boot, right? This proposal still does not require 
ATAG_DEVTREE?

> Why one DT machine ID per subarchitecture?  Simply because a significant
> part of the DT handling code will have to be subarchitecture specific
> anyway.  The timer hardware, the GPIO configuration and muxing, SOC
> specific platform data handling, power management config, and many other
> things are simply too different from one SOC family to another and
> trying to have a single global DT support code to rule them all is
> insane.

The code for DT boot will be still subarch-specific, but I don't think we need 
IDs for that. There is enough information in the device tree to select the 
subarch-specific code to use for early init, without needing to parameterise 
every element of the machine. The machine-level "compatible" property allows 
us to do this.

Therefore, I don't think we need the machine ID at all: once the DT is 
available, we can use that for any machine-specific stuff. Even though we're 
not *configuring* it from the device tree, we can *select* it from there 
instead.

Cheers,


Jeremy
