From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] ARM: dts: socfpga: use stdout-path for chosen node
Date: Wed, 8 Aug 2018 14:11:09 +0200
Message-ID: <ba66504e-c002-7dc6-daed-633fee896131@denx.de>
References: <20180808090944.861-1-simon.k.r.goldschmidt@gmail.com>
 <f27a5e90-9783-761e-a87b-9b8a2d46d2a4@denx.de>
 <CAAh8qsyHxMjwBtBa5pYejkOxwFRbbFbt+myC4ynQQonK8MAo-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAh8qsyHxMjwBtBa5pYejkOxwFRbbFbt+myC4ynQQonK8MAo-w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/08/2018 02:02 PM, Simon Goldschmidt wrote:
> On Wed, Aug 8, 2018 at 1:32 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 08/08/2018 11:09 AM, Simon Goldschmidt wrote:
>>> Use stdout-path dts property for kernel console.
>>>
>>> There were two socfpga boards left not using stdout-path:
>>> socrates and vining. Make sure they match the other boards.
>>>
>>> Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
>>> ---
>>>  arch/arm/boot/dts/socfpga_cyclone5_socrates.dts    | 3 ++-
>>>  arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts | 3 ++-
>>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socrates.dts b/arch/arm/boot/dts/socfpga_cyclone5_socrates.dts
>>> index 53bf99eef66d..6f5255a7d192 100644
>>> --- a/arch/arm/boot/dts/socfpga_cyclone5_socrates.dts
>>> +++ b/arch/arm/boot/dts/socfpga_cyclone5_socrates.dts
>>> @@ -22,7 +22,8 @@
>>>       compatible = "ebv,socrates", "altr,socfpga-cyclone5", "altr,socfpga";
>>>
>>>       chosen {
>>> -             bootargs = "console=ttyS0,115200";
>>> +             bootargs = "earlyprintk";
>>> +             stdout-path = "serial0:115200n8";
>>>       };
>>>
>>>       memory@0 {
>>> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
>>> index f50b19447de6..e61efe16e79c 100644
>>> --- a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
>>> +++ b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
>>> @@ -54,7 +54,8 @@
>>>       compatible = "samtec,vining", "altr,socfpga-cyclone5", "altr,socfpga";
>>>
>>>       chosen {
>>> -             bootargs = "console=ttyS0,115200";
>>> +             bootargs = "earlyprintk";
>>
>> Why this earlyprintk ?
> 
> The reason is Dinh added that to all socfpga boards in his commit [1]
> and I wanted the remaining two boards to be the same.

Isn't earlyprintk mostly a debugging aid ?

-- 
Best regards,
Marek Vasut
