From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: =?UTF-8?B?UmVbMl06IFtQQVRDSCAxLzJdIEdQSU86IGNscHM3MTF4OiBSZXdyaXRlIGRy?=
 =?UTF-8?B?aXZlciBmb3IgdXNpbmcgZ2VuZXJpYyBHUElPIGNvZGU=?=
Date: Thu, 25 Apr 2013 15:31:07 +0400
Message-ID: <1366889467.845096985@f366.mail.ru>
References: <1365826900-30136-1-git-send-email-shc_work@mail.ru>
 <20130419140357.GR14496@n2100.arm.linux.org.uk>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work-JGs/UdohzUI@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130419140357.GR14496-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
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
To: =?UTF-8?B?UnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4?= <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, =?UTF-8?B?Um9iIEhlcnJpbmc=?= <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On Sat, Apr 13, 2013 at 08:21:39AM +0400, Alexander Shiyan wrote:
> > +static void __init clps711x_add_gpio(void)
> > +{
> > +	const struct resource clps711x_gpio0_res[] = {
> > +		DEFINE_RES_MEM(PADR, SZ_1),
> > +		DEFINE_RES_MEM(PADDR, SZ_1),
> > +	};
...
> Don't do this - this is incredibly wasteful.
> 
> C lesson 1: do not put unmodified initialised structures onto the stack.
> 
> What the C compiler will do with the above is exactly the same as this
> for each structure:
> 
> static const struct resource private_clps711x_gpio4_res[] = {
> 	DEFINE_RES_MEM(PEDR, SZ_1),
> 	DEFINE_RES_MEM(PEDDR, SZ_1),
> };
> 
> static void __init clps711x_add_gpio(void)
> {
> 	const struct resource clps711x_gpio4_res[] = private_clps711x_gpio4_res;
> 	...
> 
> which will in itself be a call out to memcpy, or an inlined memcpy.  Now
> do you see why it's wasteful?  You might as well write the thing in that
> way to start with and safe the additional code to copy the structures.
> 
> The other way to do this, which will probably be far more space efficient:
> 
> static phys_addr_t gpio_addrs[][2] = {
> 	{ PADR, PADDR },
> 	{ PBDR, PBDDR },
> ...
> };
> 
> static void __init clps711x_add_gpio(void)
> {
> 	struct resource gpio_res[2];
> 	unsigned i;
> 
> 	gpio_res[0].flags = IORESOURCE_MEM;
> 	gpio_res[1].flags = IORESOURCE_MEM;
> 
> 	for (i = 0; i < ARRAY_SIZE(gpio_addrs); i++) {
> 		gpio_res[0].start = gpio_addrs[i][0];
> 		gpio_res[0].end = gpio_res[0].start;
> 		gpio_res[1].start = gpio_addrs[i][1];
> 		gpio_res[1].end = gpio_res[1].start;
> 
> 		platform_device_register_simple("clps711x-gpio", i,
> 					gpio_res, ARRAY_SIZE(gpio_res));
> 	}
> }
> 
> which results in smaller storage and most probably also smaller code size
> too.

Very strange results with this change.
So, I add a debug output before "platform_device_register_simple" for
print resource and in "__request_resource" for print parent.
This is output.
gpio 0 [mem 0x80000000] [mem 0x80000040]
resource: root [??? 0xe3a0f000-0x00000000 flags 0xb00000]
clps711x-gpio.0: failed to claim resource 0

The first line is seems correct. But I do not understand why
parent is wrong here. Normally it should be as:
resource: root [mem 0x00000000-0xffffffff].
And it shows normal with my first version.
Have anyone any ideas?
Thanks.

---
