From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 4/5] ARM: DTS: da850: Add cfgchip syscon node
Date: Fri, 28 Oct 2016 13:51:03 +0530
Message-ID: <09eb61b9-d66e-838e-2411-d787fda65096@ti.com>
References: <1477451211-31979-1-git-send-email-david@lechnology.com>
 <1477451211-31979-5-git-send-email-david@lechnology.com>
 <b9bfc4aa-ef52-53c4-dc7e-c0bc1c5969fb@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b9bfc4aa-ef52-53c4-dc7e-c0bc1c5969fb@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Axel Haslam <ahaslam@baylibre.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 26 October 2016 09:38 PM, David Lechner wrote:
> On 10/25/2016 10:06 PM, David Lechner wrote:
>> Add a syscon node for the SoC CFGCHIPn registers. This is needed for
>> the new usb phy driver.
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
>> ---
>>  arch/arm/boot/dts/da850.dtsi | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
>> index f79e1b9..6bbf20d 100644
>> --- a/arch/arm/boot/dts/da850.dtsi
>> +++ b/arch/arm/boot/dts/da850.dtsi
>> @@ -188,6 +188,10 @@
>>              };
>>
>>          };
>> +        cfgchip: cfgchip@1417c {
> 
> I wonder if there is a more generic name instead of cfgchip@. Is there a
> preferred generic name for syscon nodes?

I did not find anything in ePAPR, but chip-controller might be more
appropriate.

> 
>> +            compatible = "ti,da830-cfgchip", "syscon";

Looks like we need "simple-mfd" too in the compatible list?

I think we can also fold patch 5/5 into this patch and add the cfgchip
along with USB phy child node included.

If you respin the patch, I can drop 4/5 and 5/5 that I have queued and
included the updated patch instead.

Thanks,
Sekhar
