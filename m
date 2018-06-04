From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] soc: bcm: brcmstb: pm: Add support for newer rev B3.0
 controllers
Date: Mon, 4 Jun 2018 14:16:22 -0700
Message-ID: <23b65eba-89ee-75e6-589a-deb2cd2ff2d2@gmail.com>
References: <20180511220242.837-1-f.fainelli@gmail.com>
 <20180511220242.837-2-f.fainelli@gmail.com>
 <20180522223024.GA7817@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180522223024.GA7817@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Doug Berger <opendmb@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Justin Chen <justinpopo6@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 05/22/2018 03:30 PM, Rob Herring wrote:
> On Fri, May 11, 2018 at 03:02:41PM -0700, Florian Fainelli wrote:
>> From: Doug Berger <opendmb@gmail.com>
>>
>> Update the Device Tree binding document and add a matching entry for the
>> MEMC DDR controller revision B3.0 which is found on chips like 7278A0
>> and newer.
>>
>> Signed-off-by: Doug Berger <opendmb@gmail.com>
>> [florian: tweak commit message, make it apply to upstream kernel]
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/bcm/brcm,brcmstb.txt | 1 +
>>  drivers/soc/bcm/brcmstb/pm/pm-arm.c                        | 4 ++++
>>  2 files changed, 5 insertions(+)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Side note: this should really move out of bindings/arm/ to 
> bindings/memory-controllers/ or at least to its own file.

Good idea, thanks, will do that.
-- 
-- 
Florian
