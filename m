From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] ARM: dts: vexpress: Replace '_' with '-' in node names
Date: Thu, 10 May 2018 15:16:37 +0100
Message-ID: <f4f3e96b-2699-61e6-400e-134b9af9d72b@arm.com>
References: <1525884482-19855-1-git-send-email-sudeep.holla@arm.com>
 <CAL_Jsq+VNuvbxgFTFVouJF-_yMS90u0fd8jaXnYtKwogOP5rww@mail.gmail.com>
 <f28fb5d6-1070-8cbb-e815-4baf7128b19e@arm.com>
 <CAL_Jsq+csM-Z8+bMTdD7gWhWRQLAkD0EMNUS0boWkes345cCrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_Jsq+csM-Z8+bMTdD7gWhWRQLAkD0EMNUS0boWkes345cCrw@mail.gmail.com>
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
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org



On 10/05/18 15:05, Rob Herring wrote:
> On Thu, May 10, 2018 at 5:51 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>
>>
>> On 09/05/18 22:14, Rob Herring wrote:
>>> On Wed, May 9, 2018 at 11:48 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>>> The latest DTC throws warnings for character '_' in the node names.
>>>>
>>>> Warning (node_name_chars_strict): /sysreg@10000/sys_led: Character '_' not recommended in node name
>>>> Warning (node_name_chars_strict): /sysreg@10000/sys_mci: Character '_' not recommended in node name
>>>> Warning (node_name_chars_strict): /sysreg@10000/sys_flash: Character '_' not recommended in node name
>>>>
>>>> The general recommendation is to use character '-' for all the node names.
>>>> This patch fixes the warnings following the recommendation.
>>>>
>>>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>>>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>>>> ---
>>>>  arch/arm/boot/dts/vexpress-v2m-rs1.dtsi | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
>>>> index 7b8ff5b3b912..58e73131ecef 100644
>>>> --- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
>>>> +++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
>>>> @@ -77,19 +77,19 @@
>>>>                                         compatible = "arm,vexpress-sysreg";
>>>>                                         reg = <0x010000 0x1000>;
>>>>
>>>> -                                       v2m_led_gpios: sys_led {
>>>> +                                       v2m_led_gpios: sys-led {
>>>
>>> Except this is a gpio-controller so it should have 'gpio' for its node
>>> name. (I have a dtc check written for that, but there are too many
>>> false positives.)
>>>
>>
>> True, sorry I didn't look at it in detail.
>>
>>> But then you have 3 of them and no addressing, so you need to add reg
>>> property (with the register's offset and size) and unit-address.
>>>
>>
>> Indeed. I had a look at the history but couldn't gather much. All I
>> could get is that this is one of those weird mix of all functionality on
>> ARM Ltd platforms which fits no subsystem. Me and Lorenzo has similar
>> issue on TC2 platform. Pawel seem to have plumed this system control
>> registers block into MFD and GPIO long back.
>>
>>> I'm surprised Linus W accepted these a GPIO when they are not really
>>> general purpose, but then lots of things slip in.
>>>
>>
>> I assume all these happened in early days of DT.
>>
>> I will drop this for now. I will take a look if these nodes can be made
>> better to align with standard gpio controller nodes.
> 
> Why not just make the changes I suggested? It shouldn't break
> anything. You can add reg property even though the kernel doesn't use
> it.
> 

Ah OK. That makes sense. IIRC it used to have some @<offset> value
previously which has some correlation to HW block. I will dig that out.
Sorry I missed that you were suggesting to add reg property.

-- 
Regards,
Sudeep
