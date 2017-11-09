From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add phy-reset property for rk3066a-rayeager emac
Date: Thu, 9 Nov 2017 10:20:57 +0200
Message-ID: <94e38995-e050-db91-0702-bf889e4ff397@ti.com>
References: <1510022959-19440-1-git-send-email-zyw@rock-chips.com>
 <e6f2393e-cb3b-9006-d0f5-6b30fd2a5192@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <e6f2393e-cb3b-9006-d0f5-6b30fd2a5192-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 07/11/17 09:54, Vladimir Zapolskiy wrote:
> Hello Chris,
> 
> On 11/07/2017 04:49 AM, Chris Zhong wrote:
>> The ethernet phy of rk3066a-rayeager has a reset pin, it controlled by
>> GPIO1_D6, this pin should be pull down then pull up to reset the phy.
>> Add a phy-reset property in emac, make the phy can be reset when emac
>> power on.
> 
> for PHY reset there are properties 'reset-gpios' and 'reset-delay-us',
> please reference to Documentation/devicetree/bindings/net/mdio.txt
> 
> Can you try to reuse them instead of adding new custom properties?
> 
> As a side question, which is mainly addressed to Sergei and Roger,
> I don't quite understand why PHY properties were initially added to
> MAC/MDIO bus device tree nodes, in my opinion they must be moved under
> PHY device tree nodes.

The PHY reset *has* to be performed at the MDIO bus driver level so that they
can be pin-strap configured correctly and be detected during MDIO bus scan.

- We have boards where PHYs won't be detected if RESET is not done before the scan. (due to invalid h/w pin-strapping config)
- We have boards where a single GPIO line controls reset of all PHYs on the bus.

Due to these reasons the RESET control lies with the MDIO bus driver.

> 
> --
> With best wishes,
> Vladimir
> 
>>
>> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>>  arch/arm/boot/dts/rk3066a-rayeager.dts | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/rk3066a-rayeager.dts b/arch/arm/boot/dts/rk3066a-rayeager.dts
>> index 570157f..6064a0a 100644
>> --- a/arch/arm/boot/dts/rk3066a-rayeager.dts
>> +++ b/arch/arm/boot/dts/rk3066a-rayeager.dts
>> @@ -173,6 +173,8 @@
>>  	pinctrl-0 = <&emac_xfer>, <&emac_mdio>, <&rmii_rst>;
>>  	phy = <&phy0>;
>>  	phy-supply = <&vcc_rmii>;
>> +	phy-reset-gpios = <&gpio1 RK_PD6 GPIO_ACTIVE_LOW>; /* PHY_RST */
>> +	phy-reset-duration = <10>; /* millisecond */
>>  	status = "okay";
>>  
>>  	phy0: ethernet-phy@0 {
>>

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
