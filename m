From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v3 05/17] ARM: dts: at91: cpus/cpu node dts updates
Date: Tue, 14 May 2013 11:20:00 +0200
Message-ID: <519201C0.2060908@atmel.com>
References: <1366824502-19729-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366824502-19729-6-git-send-email-lorenzo.pieralisi@arm.com>
 <517E4366.4040209@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <517E4366.4040209-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 29/04/2013 11:54, Nicolas Ferre :
> On 04/24/2013 07:28 PM, Lorenzo Pieralisi :
>> This patch updates the in-kernel dts files according to the latest cpus
>> and cpu bindings updates for ARM.
>>
>> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
>
> With changes in compatible string... ok then.
>
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Now that our Cortex-A5 is in mainline, can you please update the:

arch/arm/boot/dts/sama5d3.dtsi

as-well?

Thanks, best regards,

>> ---
>>   arch/arm/boot/dts/at91rm9200.dtsi  | 6 +++++-
>>   arch/arm/boot/dts/at91sam9260.dtsi | 8 ++++++--
>>   arch/arm/boot/dts/at91sam9263.dtsi | 8 ++++++--
>>   arch/arm/boot/dts/at91sam9g45.dtsi | 8 ++++++--
>>   arch/arm/boot/dts/at91sam9n12.dtsi | 8 ++++++--
>>   arch/arm/boot/dts/at91sam9x5.dtsi  | 8 ++++++--
>>   6 files changed, 35 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/at91rm9200.dtsi b/arch/arm/boot/dts/at91rm9200.dtsi
>> index b0268a5..f16b3d4 100644
>> --- a/arch/arm/boot/dts/at91rm9200.dtsi
>> +++ b/arch/arm/boot/dts/at91rm9200.dtsi
>> @@ -34,8 +34,12 @@
>>   		ssc2 = &ssc2;
>>   	};
>>   	cpus {
>> -		cpu@0 {
>> +		#address-cells = <0>;
>> +		#size-cells = <0>;
>> +
>> +		cpu {
>>   			compatible = "arm,arm920t";
>> +			device_type = "cpu";
>>   		};
>>   	};
>>
>> diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
>> index cb7bcc5..c4eeef7 100644
>> --- a/arch/arm/boot/dts/at91sam9260.dtsi
>> +++ b/arch/arm/boot/dts/at91sam9260.dtsi
>> @@ -32,8 +32,12 @@
>>   		ssc0 = &ssc0;
>>   	};
>>   	cpus {
>> -		cpu@0 {
>> -			compatible = "arm,arm926ejs";
>> +		#address-cells = <0>;
>> +		#size-cells = <0>;
>> +
>> +		cpu {
>> +			compatible = "arm,arm926ej-s";
>> +			device_type = "cpu";
>>   		};
>>   	};
>>
>> diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/at91sam9263.dtsi
>> index 271d4de..f3b5c2a 100644
>> --- a/arch/arm/boot/dts/at91sam9263.dtsi
>> +++ b/arch/arm/boot/dts/at91sam9263.dtsi
>> @@ -29,8 +29,12 @@
>>   		ssc1 = &ssc1;
>>   	};
>>   	cpus {
>> -		cpu@0 {
>> -			compatible = "arm,arm926ejs";
>> +		#address-cells = <0>;
>> +		#size-cells = <0>;
>> +
>> +		cpu {
>> +			compatible = "arm,arm926ej-s";
>> +			device_type = "cpu";
>>   		};
>>   	};
>>
>> diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
>> index 6b1d4ca..6c18bd3 100644
>> --- a/arch/arm/boot/dts/at91sam9g45.dtsi
>> +++ b/arch/arm/boot/dts/at91sam9g45.dtsi
>> @@ -35,8 +35,12 @@
>>   		ssc1 = &ssc1;
>>   	};
>>   	cpus {
>> -		cpu@0 {
>> -			compatible = "arm,arm926ejs";
>> +		#address-cells = <0>;
>> +		#size-cells = <0>;
>> +
>> +		cpu {
>> +			compatible = "arm,arm926ej-s";
>> +			device_type = "cpu";
>>   		};
>>   	};
>>
>> diff --git a/arch/arm/boot/dts/at91sam9n12.dtsi b/arch/arm/boot/dts/at91sam9n12.dtsi
>> index 7750f98..c3b11af 100644
>> --- a/arch/arm/boot/dts/at91sam9n12.dtsi
>> +++ b/arch/arm/boot/dts/at91sam9n12.dtsi
>> @@ -31,8 +31,12 @@
>>   		ssc0 = &ssc0;
>>   	};
>>   	cpus {
>> -		cpu@0 {
>> -			compatible = "arm,arm926ejs";
>> +		#address-cells = <0>;
>> +		#size-cells = <0>;
>> +
>> +		cpu {
>> +			compatible = "arm,arm926ej-s";
>> +			device_type = "cpu";
>>   		};
>>   	};
>>
>> diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
>> index aa98e64..6c39d0f 100644
>> --- a/arch/arm/boot/dts/at91sam9x5.dtsi
>> +++ b/arch/arm/boot/dts/at91sam9x5.dtsi
>> @@ -33,8 +33,12 @@
>>   		ssc0 = &ssc0;
>>   	};
>>   	cpus {
>> -		cpu@0 {
>> -			compatible = "arm,arm926ejs";
>> +		#address-cells = <0>;
>> +		#size-cells = <0>;
>> +
>> +		cpu {
>> +			compatible = "arm,arm926ej-s";
>> +			device_type = "cpu";
>>   		};
>>   	};
>>
>>
>
>


-- 
Nicolas Ferre
