From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 04/18] ARM: mvebu: a385-db-ap: enable USB (orion-ehci) port
Date: Wed, 27 Jul 2016 18:09:26 +0200
Message-ID: <87a8h3m5ah.fsf@free-electrons.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
	<1469105055-25181-5-git-send-email-jaz@semihalf.com>
	<87oa5jm5ps.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87oa5jm5ps.fsf@free-electrons.com> (Gregory CLEMENT's message of
	"Wed, 27 Jul 2016 18:00:15 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jason@lakedaemon.net, andrew@lunn.ch, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, alior@marvell.com, robh+dt@kernel.org, mw@semihalf.com, thomas.petazzoni@free-electrons.com, linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

Hi,
 
 On mer., juil. 27 2016, Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:

> Hi Grzegorz,
>  
>  On jeu., juil. 21 2016, Grzegorz Jaszczyk <jaz@semihalf.com> wrote:
>
>> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
>
>
> Here agina, as pointed by Andrew a commit log entry would be
> nice. Except this:
>
> Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

I also forget to mention that the title prefix should be change to:
"ARM: dts: mvebu: a385-db-ap:"

Gregory
>
> Thanks,
>
> Gregory
>> ---
>>  arch/arm/boot/dts/armada-385-db-ap.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/armada-385-db-ap.dts b/arch/arm/boot/dts/armada-385-db-ap.dts
>> index 2d3fd6e..a18f516 100644
>> --- a/arch/arm/boot/dts/armada-385-db-ap.dts
>> +++ b/arch/arm/boot/dts/armada-385-db-ap.dts
>> @@ -155,6 +155,10 @@
>>  				bm,pool-short = <3>;
>>  			};
>>  
>> +			usb@58000 {
>> +				status = "okay";
>> +			};
>> +
>>  			/* CON4 */
>>  			ethernet@70000 {
>>  				pinctrl-names = "default";
>> -- 
>> 1.8.3.1
>>
>
> -- 
> Gregory Clement, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
