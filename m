From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Mon, 08 Oct 2012 20:41:03 -0600
Message-ID: <50738EBF.2060905@wwwdotorg.org>
References: <20121007015300.828366635@gmail.com>
 <20121007015405.958959522@gmail.com> <19574322.MHE4gIJg5N@flexo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <19574322.MHE4gIJg5N@flexo>
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
To: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/08/2012 05:50 AM, Florian Fainelli wrote:
> Hi Domenico,
> 
> On Sunday 07 October 2012 03:53:01 Domenico Andreoli wrote:
>> From: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
>>
>> BCM476x's minimal infrastructure, Kernel's great reuse.
>>
>> Look mom, no include/mach directory!

>> Index: b/arch/arm/boot/dts/bcm476x.dtsi
>> ===================================================================
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/bcm476x.dtsi
>> @@ -0,0 +1,31 @@
>> +/include/ "skeleton.dtsi"
>> +
>> +/ {
>> +	compatible = "brcm,bcm476x";
>> +	model = "Broadcom BCM476x";
>> +
>> +	chosen {
>> +		bootargs = "earlyprintk";
>> +	};
>> +
>> +	amba {
> 
> I would rather explicitely mention that the peripheral base address is at 0
> so something like this:
> 
> amba@0 {
> 
> to make it clear that the peripherals declared as leaf nodes of this one are
> at a relative address.
> 
>> +		compatible = "arm,amba-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;

You should only put a unit address ("@0") in the node name if there's a
matching reg property and the unit address is needed to make the node
name unique. Neither condition applies in this case.
