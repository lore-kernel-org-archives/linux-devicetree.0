From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: mvebu: reorder nodes under internal-regs by address in RN2120 .dts file
Date: Mon, 12 Oct 2015 18:32:17 +0200
Message-ID: <87y4f8jbe6.fsf@free-electrons.com>
References: <cover.1444428035.git.arno@natisbad.org>
	<277de75473af2431849a7494ae65b57dbc9a8309.1444428035.git.arno@natisbad.org>
	<20151012142324.GB30801@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151012142324.GB30801-g2DYL2Zd6BY@public.gmane.org> (Andrew Lunn's message of "Mon,
	12 Oct 2015 16:23:24 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, TuxOholic <tuxoholic-PkbjNfxxIASELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,
 
 On lun., oct. 12 2015, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

> On Sat, Oct 10, 2015 at 12:10:39AM +0200, Arnaud Ebalard wrote:
>> 
>> This cosmetic patch reorder nodes under internal-regs by increasing
>> address order, as epxected.
>
> expected.
>
> Gregory, can you fix that as you commit?

Done!

>
> Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>
> 	  Andrew
>
>> 
>> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 86 +++++++++++++-------------
>>  1 file changed, 43 insertions(+), 43 deletions(-)
>> 
>> diff --git a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
>> index 85b2f87c0b8a..d72a69d97ba2 100644
>> --- a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
>> +++ b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
>> @@ -94,54 +94,11 @@
>>  				status = "disabled";
>>  			};
>>  
>> -			/* Two rear eSATA ports */
>> -			sata@a0000 {
>> -				nr-ports = <2>;
>> -				status = "okay";
>> -			};
>> -
>> -			serial@12000 {
>> -				status = "okay";
>> -			};
>> -
>> -			mdio {
>> -				phy0: ethernet-phy@0 { /* Marvell 88E1318 */
>> -					reg = <0>;
>> -				};
>> -
>> -				phy1: ethernet-phy@1 { /* Marvell 88E1318 */
>> -					reg = <1>;
>> -				};
>> -			};
>> -
>> -			ethernet@70000 {
>> -				status = "okay";
>> -				phy = <&phy0>;
>> -				phy-mode = "rgmii-id";
>> -			};
>> -
>> -			ethernet@74000 {
>> -				status = "okay";
>> -				phy = <&phy1>;
>> -				phy-mode = "rgmii-id";
>> -			};
>> -
>> -			/* Front USB 2.0 port */
>> -			usb@50000 {
>> -				status = "okay";
>> -			};
>> -
>>  			i2c@11000 {
>>  				compatible = "marvell,mv64xxx-i2c";
>>  				clock-frequency = <400000>;
>>  				status = "okay";
>>  
>> -				isl12057: isl12057@68 {
>> -					compatible = "isil,isl12057";
>> -					reg = <0x68>;
>> -					isil,irq2-can-wakeup-machine;
>> -				};
>> -
>>  				/* Controller for rear fan #1 of 3 (Protechnic
>>  				 * MGT4012XB-O20, 8000RPM) near eSATA port */
>>  				g762_fan1: g762@3e {
>> @@ -178,6 +135,49 @@
>>  					compatible = "gmt,g751";
>>  					reg = <0x4c>;
>>  				};
>> +
>> +				isl12057: isl12057@68 {
>> +					compatible = "isil,isl12057";
>> +					reg = <0x68>;
>> +					isil,irq2-can-wakeup-machine;
>> +				};
>> +			};
>> +
>> +			serial@12000 {
>> +				status = "okay";
>> +			};
>> +
>> +			/* Front USB 2.0 port */
>> +			usb@50000 {
>> +				status = "okay";
>> +			};
>> +
>> +			mdio {
>> +				phy0: ethernet-phy@0 { /* Marvell 88E1318 */
>> +					reg = <0>;
>> +				};
>> +
>> +				phy1: ethernet-phy@1 { /* Marvell 88E1318 */
>> +					reg = <1>;
>> +				};
>> +			};
>> +
>> +			ethernet@70000 {
>> +				status = "okay";
>> +				phy = <&phy0>;
>> +				phy-mode = "rgmii-id";
>> +			};
>> +
>> +			ethernet@74000 {
>> +				status = "okay";
>> +				phy = <&phy1>;
>> +				phy-mode = "rgmii-id";
>> +			};
>> +
>> +			/* Two rear eSATA ports */
>> +			sata@a0000 {
>> +				nr-ports = <2>;
>> +				status = "okay";
>>  			};
>>  
>>  			nand@d0000 {
>> -- 
>> 2.5.3
>> 

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
