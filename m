From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH V3 7/8] ARM: dts: Add minimal Raspberry Pi 4 support
Date: Sun, 6 Oct 2019 15:28:21 +0200
Message-ID: <4bc598da-e895-7223-73e8-b4ce6d2ac074@gmx.net>
References: <1569672435-19823-1-git-send-email-wahrenst@gmx.net>
 <1569672435-19823-8-git-send-email-wahrenst@gmx.net>
 <77b0a773-912a-aa5b-6eb5-5423c2c07e58@gmail.com>
 <7d0414bb-fea8-e3e5-8b85-c18615a56c94@gmx.net>
 <e9e6491e-c53e-7255-98cc-dabdfa7ba753@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e9e6491e-c53e-7255-98cc-dabdfa7ba753@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Am 02.10.19 um 18:43 schrieb Florian Fainelli:
> On 10/2/19 9:24 AM, Stefan Wahren wrote:
>> Hi Florian,
>>
>> Am 28.09.19 um 21:58 schrieb Florian Fainelli:
>>> On 9/28/2019 5:07 AM, Stefan Wahren wrote:
>>>
>>>> +	memory@0 {
>>>> +		device_type = "memory";
>>>> +		reg = <0 0 0x00000000>;
>>>> +	};
>>>> +
>>> [snip]
>>>
>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +#include <dt-bindings/soc/bcm2835-pm.h>
>>>> +
>>>> +/ {
>>>> +	compatible = "brcm,bcm2711";
>>>> +
>>>> +	#address-cells = <2>;
>>>> +	#size-cells = <1>;
>>> Trying to see if we may need a #size-cells property value of 2 here, for
>>> the 4GB model, I would assume that we would have to, unless we are fine
>>> with supporting 4GB - 1byte of DRAM?
>> I will try unless this requires a lot of adjustments or break the
>> bootloader.
> OK.
Unfortunately this breaks bootloader or firmware. Since the BCM2711 is
able to address 16 GB RAM this should be fixed later. I will open an
issue and submit V4 without this suggested change.
