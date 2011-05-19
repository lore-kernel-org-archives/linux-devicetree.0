From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: i2c child devices: binding to uio device driver
Date: Thu, 19 May 2011 09:58:08 -0600
Message-ID: <20110519155808.GC3085@ponder.secretlab.ca>
References: <BANLkTimSBReyncTANTyy4jhah=-QvPigwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTimSBReyncTANTyy4jhah=-QvPigwQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas De Schampheleire <patrickdepinguin+devicetree-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 19, 2011 at 05:32:32PM +0200, Thomas De Schampheleire wrote:
> Hi,
> 
> I am using the uio framework (userspace i/o) to handle devices in
> userspace. This includes memory access and interrupt handling.
> For i2c devices, I'm using the i2c-dev interface, to talk to these
> devices from userspace. This already works fine.
> 
> One of my i2c devices also has an interrupt line connected to the
> processor. To be able to handle this interrupt with uio, I need to
> have a kernel driver matched against the i2c device. However, the i2c
> device described in the device tree does not bind with the driver. Is
> this behavior supported, and if so, what am I doing wrong? Do I have
> to create a dummy bus (non-i2c) and add a shadow node for the
> interrupt?

You're wandering into new territory here.  It is definitely the right
thing to do to describe your i2c device in the device tree with the
interrupt fully specified.

What you probably need to do is create a uio helper driver for your
device that takes care of finding the device node, mapping the
interrupt, and proving the interrupt handling UIO hook to userspace.
The easiest way to work this out would be to make your uio helper
actually bind to the i2c device created by the device node (this is
probably the best way too), but you don't have to.  As long as you
arrange for you uio helper to get called at some point, you can get it
to find the appropriate node in the DT, map the interrupt, and export
it to userspace.

g.

> 
> My device tree nodes look like this:
> 
>         soc@fe000000 {
>                 i2c@118100 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         cell-index = <1>;
>                         compatible = "fsl-i2c";
>                         reg = <0x118100 0x100>;
>                         interrupts = <38 2 0 0>;
>                         dfsrr;
>                         mydevice@68 {
>                                 compatible = "mymanufacturer,mydevice";
>                                 reg = <0x68>;
>                                 interrupts = <7 1 0 0>; /* External
> IRQ7, active-low level */
>                         };
>                 };

This looks to be correct.

> 
> The device driver then has:
> 
> static const struct of_device_id mydevice_ids[] = {
>         {
>                 .compatible = "mymanufacturer,mydevice"
>         },
>         {},
> };
> static struct of_platform_driver mydevice_driver = {

You don't want to do this.  This is an i2c device, not a platform
device.  If anything, this should be an i2c_driver and you should use
the normal creation of i2c devices from the DT.

BTW, of_platform_driver is deprecated and is just a wrapper around
plain platform_driver on recent kernels.  platform_driver should be
used directly now.

>         .owner          = THIS_MODULE,
>         .name           = "mydevice",
>         .match_table    = mydevice_ids,
>         .probe          = mydevice_probe,
>         .remove         = __devexit_p(mydevice_remove),
> };
> 
> static int __init mydevice_init(void)
> {
>         printk(KERN_INFO "mydevice: driver init\n");
>         return of_register_platform_driver(&mydevice_driver);
> }
> 
> Note that the init function is called correctly, but the probe
> function is never called.
> 
> All this is on a p4080ds-based system, with linux 2.6.34.6.
> 
> Best regards,
> Thomas
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
