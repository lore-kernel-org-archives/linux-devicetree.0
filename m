From: Iain Paton <ipaton0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: dts: microsom-ar8035: MDIO pad must be set open
 drain
Date: Tue, 26 Aug 2014 13:16:46 +0100
Message-ID: <53FC7AAE.8090803@gmail.com>
References: <20140823091058.GO30401@n2100.arm.linux.org.uk> <E1XL7M1-0002yD-K3@rmk-PC.arm.linux.org.uk> <53F9B416.5030907@gmail.com> <20140826101538.GA28777@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140826101538.GA28777@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/08/14 11:15, Shawn Guo wrote:
> On Sun, Aug 24, 2014 at 10:44:54AM +0100, Iain Paton wrote:
>> On 23/08/14 10:11, Russell King wrote:
>>> From: Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
>>> To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>>
>>> MDIO pad must be set open drain.
>>>
>>> Signed-off-by: Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
>>> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/imx6qdl-microsom-ar8035.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/imx6qdl-microsom-ar8035.dtsi b/arch/arm/boot/dts/imx6qdl-microsom-ar8035.dtsi
>>> index d16066608e21..db9f45b2c573 100644
>>> --- a/arch/arm/boot/dts/imx6qdl-microsom-ar8035.dtsi
>>> +++ b/arch/arm/boot/dts/imx6qdl-microsom-ar8035.dtsi
>>> @@ -17,7 +17,7 @@
>>>  	enet {
>>>  		pinctrl_microsom_enet_ar8035: microsom-enet-ar8035 {
>>>  			fsl,pins = <
>>> -				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
>>> +				MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b8b0
>>>  				MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
>>>  				/* AR8035 reset */
>>>  				MX6QDL_PAD_KEY_ROW4__GPIO4_IO15		0x130b0
>>>
>>
>> Can you elaborate some more on the reasons for this?  
> 
> I just got the following text from Rabeeh explaining the change.
> 
> "This patch is important for the MicroSOM implementation due to the
> following details -
> 
> 1. VIH of the Atheros phy is 1.7V.
> 2. NVCC_ENET which is the power domain of the MDIO pad is driven by the
>    PHY's LDO (i.e. either 1.8v or 2.5v).
> 3. The MicroSOM implements an onbouard 1.6kohm pull up to 3.3v (R3000).
> 
> In the case the PHY's LDO was 1.8v then there would be only a 100mV
> margin for the signal to be acknowledged as high (1.8v-1.7v).
> Due to that setting the pad as an open drain will let the 1.6kohm pull
> that signal high to 3.3 that assures enough margins to the PHY to be
> acked as '1' logic.
> 
> Notice that this change is not required to the SabreSD boards since that
> hardware drives the NVCC_EIM power island from a 3.3v power rail."
> 
>>
>> I'd like to understand if it's something specific to the hardware on that 
>> board, or if other i.MX6 boards using the ar8035 are doing it wrong as well.
> 
> So from text above, it's a MicroSOM board specific change, I think.

Ok, that makes a lot of sense. Practical implementation reasons wins any 
argument.  
No objections from me to this, I think we understand the reasons now.

Iain

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
