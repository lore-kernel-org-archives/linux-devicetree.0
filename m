From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: GPIO - marking individual pins (not) available in device tree
Date: Mon, 27 Oct 2008 11:35:10 -0500
Message-ID: <4905EDBE.8020105@freescale.com>
References: <4900ED81.3040202@genesi-usa.com>
	<4900F90B.80703@firmworks.com>	<4901032F.3090805@genesi-usa.com>
	<49011C42.2020101@firmworks.com>	<49024646.3050300@genesi-usa.com>
	<49025DE0.6070403@firmworks.com>	<4904DD76.7070706@genesi-usa.com>	<20081026235303.GE22339@yookeroo.seuss>
	<4905E857.6040206@genesi-usa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <4905E857.6040206-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Matt Sealey wrote:
> I'm all for it being legacy and optional but marking ethernet ports as
> network, and serial ports as serial, is a wonderfully good idea especially
> if they were used in ANY firmware environment to bring up the console,
> drag in the boot files, or provide a framebuffer display.

Nobody is saying that device_type should not be used in real OF when an 
appropriate method interface exists.  What we're saying is that flat 
device trees, which are incapable of providing a method interface, 
should not lie and claim that they have one.

As for "ANY firmware environment", I'd suggest that any new method 
interfaces, where backwards compatibility isn't an issue, use some 
relevant compatible rather than device_type, so that multiple supported 
interfaces can be listed.  What do you have against vendor namespaces 
(don't make the device binding guess which firmware type it's on) and 
multiple interfaces per node?

>> matches the stated device_type.  However, flattened trees clearly
>> can't provide the method interface, and so shouldn't declare the
>> device_type.
> 
> Even if they are used in the firmware environment for console, booting
> or probing? :D

Define "they", "used", and "firmware environment".  Obviously u-boot may 
use the serial port for its console, but there's no method interface 
defined by the device tree, nor is there any firmware resident at all 
after starting the kernel.

>> In practice, we do suggest including device_type in certain, limited,
>> circumstances precisely because there are a whole bunch of buggy
>> drivers out there which match (at least partly) on device_type.
>  > We don't want to break these gratuitously,
> 
> Oh that's rich. If you were that concerned you'd rip the device_type
> out and fix all the drivers in a huge patch, like everyone else does
> when they change the ABI.

This isn't internal ABI, it's an external interface with firmware.

>> driver matching.  Hence the current policy.
> 
> I might say that the policy on device trees has changed by the month
> for the last 2 years and ePAPR didn't fix down a single concern that
> wasn't already documented in the original IEEE 1275 specification.

It fixes three primary concerns:

1. The 1275 documentation is scattered in many places, some of which are 
not easily accessible to the general public (just look at the i2c mess).

2. 1275 did not appear to be actively maintained and updated.

3. It standardized the flattened device tree interface, which did not 
exist in 1275.

-Scott
