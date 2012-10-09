From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: bcm476x: Add system timer
Date: Mon, 08 Oct 2012 20:43:20 -0600
Message-ID: <50738F48.5010002@wwwdotorg.org>
References: <20121007015300.828366635@gmail.com>
 <20121007015406.470633343@gmail.com> <1822741.oh36baA1m8@flexo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1822741.oh36baA1m8@flexo>
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
> On Sunday 07 October 2012 03:53:02 Domenico Andreoli wrote:
>> From: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
>>
>> System timer implementation for the BCM476x SoCs.

>> Index: b/arch/arm/boot/dts/bcm476x.dtsi

>> +		timer {
>> +			compatible = "brcm,bcm476x-system-timer";
>> +			reg = <0xba000 0x1000>;
>> +			interrupt-parent = <&vic0>;
>> +			interrupts = <4>, <11>;
>> +			clock-frequency = <24000000>;
>> +		};
> 
> This should rather be timer: timer@ba0000 for this node to be uniquely named.

I only see 1 timer node in this series, so "timer" is already unique,
isn't it?
