From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v3 1/4] ARM: sunxi: Add driver for sunxi
 usb phy
Date: Sat, 01 Mar 2014 14:14:31 +0100
Message-ID: <5311DD37.9000106@redhat.com>
References: <1393157352-21104-1-git-send-email-hdegoede@redhat.com> <1393157352-21104-2-git-send-email-hdegoede@redhat.com> <530B136E.8080702@ti.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBON2Y6MAKGQESR6CFVI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <530B136E.8080702-l0cyMroinI0@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 02/24/2014 10:39 AM, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Sunday 23 February 2014 05:39 PM, Hans de Goede wrote:
>> The Allwinner A1x / A2x SoCs have 2 or 3 usb phys which are all accessed
>> through a single set of registers. Besides this there are also some other
>> phy related bits which need poking, which are per phy, but shared between the
>> ohci and ehci controllers, so these are also controlled from this new phy
>> driver.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
<snip>

>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -64,4 +64,15 @@ config BCM_KONA_USB2_PHY
>>  	help
>>  	  Enable this to support the Broadcom Kona USB 2.0 PHY.
>>  
>> +config PHY_SUN4I_USB
>> +	tristate "Allwinner sunxi SoC USB PHY driver"
>> +	depends on ARCH_SUNXI
>> +	select GENERIC_PHY
> 
> recently some errors have been reported if you don't have depends on HAS_IOMEM.
> Also add depends on CONFIG_OF.

Fixed for v4.

<snip>

>> +		/* set the data bit and clear usbc bit*/
>> +		temp = readb(phy_data->base + REG_PHYCTL);
>> +		if (data & 0x1)
>> +			temp |= BIT(7);
> 
> From the comment, I assume it to be a data bit. Let's add a macro for it?
> 
> If you can fix these minor comments while changing the $subject (PHY: sunxi) it
> should be good to get merged.

All fixed for v4.

Regards,

Hans
