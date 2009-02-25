From: Laurent Gregoire <laurent.gregoire-Jdzig1fPfSTQT0dZR+AlfA@public.gmane.org>
Subject: Re: Of the device tree binary format endianness on little-endian
	platform
Date: Wed, 25 Feb 2009 17:16:49 +0100
Message-ID: <1235578609.17001.318.camel@pc-laurentg.intra.local>
References: <1234975585.17001.131.camel@pc-laurentg.intra.local>
	<ed82fe3e0902241326g39a5c7fdj861aa37ebe821aee@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <ed82fe3e0902241326g39a5c7fdj861aa37ebe821aee-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Timur,

On Tue, 2009-02-24 at 15:26 -0600, Timur Tabi wrote:
> Laurent,
> 
> I'm very interested in the work you are planning on doing.  How are
> you planning on integrating device-tree support into the kernel?  That
> is, are you going to be adding the code so that's local to your ARM
> platforms, or are you looking to make the device tree API available
> for all ARM?
> 

We would like to use the device-tree for three purposes:

1. Device-specific parameters like device ID, bluetooth mac address...
2. Platform-device activation and parametrization
3. GPIO pins configuration

We're in research phase, but the current plan is to focus first on point
1 and 2, point 2 being only used for *some* of the platform-devices. We
will use the code only in our platform-specific code for now, ie. our
specific machine_init() routine.

We plan also to stick to the use of the flattened device-tree format,
not using or building any expanded version, and once platform-device
initialization is done to forget about the device-tree data.

We ported some part of the fdt parsing routine from the ppc arch branch,
but we modified the parsing library interface to use external iterators
instead of callbacks. Once validated internally, this library could be
easily moved if needed to some more generic place like arch/arm/kernel.

The loading of the platform-device is done using a callback function,
setup via an arch_init function, with a keyword argument. This keyword
is used as a key to a specific node in the device-tree. If the keyword
is present in the device-tree, the callback is called, with the
responsibility of setting-up specific parameters (through the use of the
fdt library) and registering any needed platform-device. Thus we do not
enforce any one-to-one mapping between device-tree node and
platform-devices, even if it will be probably most of the time the case.
The platform-device initialization order is given by device-tree order.

Also we noticed the lack of type information in device-tree binary
format (could be needed for exporting values to user-land through
something like sysfs, to have human-readable integer values in scripts -
also big-endian integers have to be converted).

HTH,

--Laurent
