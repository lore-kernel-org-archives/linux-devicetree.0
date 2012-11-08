From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC v2 PATCH 2/2] mtd: davinci - remove DaVinci architecture
 depedency
Date: Thu, 8 Nov 2012 10:57:50 -0500
Message-ID: <509BD67E.2090200@ti.com>
References: <1352238427-26085-1-git-send-email-m-karicheri2@ti.com>
 <1352238427-26085-3-git-send-email-m-karicheri2@ti.com>
 <509ABFD9.8090704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <509ABFD9.8090704-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, santosh.shilimkar-l0cyMroinI0@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/07/2012 03:08 PM, Stephen Warren wrote:
> On 11/06/2012 02:47 PM, Murali Karicheri wrote:
>> DaVinci NAND driver is a controller driver based on the AEMIF hardware
>> IP found on TI SoCs. It is also used on SoCs that are not DaVinci based. This
>> patch removes the driver dependency on DaVinci architecture so that it
>> can be used on other architectures such as c6x, keystone etc.
>>
>> Also migrate the driver to use the new AEMIF platform driver API and
>> moving Documentation to Documentation/devicetree/bindings/mtd/davinci-nand.txt
>> as this is expected to be used outside of arm/davinci.
>>   delete mode 100644 Documentation/devicetree/bindings/arm/davinci/nand.txt
>>   create mode 100644 Documentation/devicetree/bindings/mtd/davinci-nand.txt
>>   create mode 100644 include/linux/platform_data/davinci-nand.h
> Using "git format-patch -M" might show this as a file move/rename rather
> than a delete/add, which would be useful to highlight any changes you
> made at the same time.
>
>> diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
>> +Example (enbw_cmc board):
>> +aemif@60000000 {
>> +	compatible = "ti,davinci-aemif";
>> +	#address-cells = <2>;
>> +	#size-cells = <1>;
>> +	reg = <0x68000000 0x80000>;
>> +	ranges = <2 0 0x60000000 0x02000000
>> +		  3 0 0x62000000 0x02000000
>> +		  4 0 0x64000000 0x02000000
>> +		  5 0 0x66000000 0x02000000
>> +		  6 0 0x68000000 0x02000000>;
>> +	nand@3,0 {
> Here, isn't 3,0 the aemif chip-select ID that is decoding the NAND accesses?
>
Yes.
>> +		compatible = "ti,davinci-nand";
>> +		reg = <3 0x0 0x807ff
>> +			6 0x0 0x8000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ti,davinci-chipselect = <1>;
> So I don't understand why that chipselect property is needed, or has a
> different value. Is this muxing the AEMIF output chip-selects onto
> different SoC package pins or something? Seems like a job for pinctrl
> perhaps?
Actually this was added by somebody else. Do you know what 0 in 3,0 
stands for? Is there a way I can retrieve the chip-select id so that I 
can remove the davinci-chipselect property. The driver uses a cs index 
of 0-3 and the hardware documentation refers CS2-5. Actually cs2 is CE0 
signal. So internally driver
translates to 2-5 to 0-3. pinmux is currently done in platform specific 
init code and probably need to migrate to use pictrl later.

Murali
>
>
