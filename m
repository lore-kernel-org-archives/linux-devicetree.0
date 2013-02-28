From: Graeme Gregory <gg@slimlogic.co.uk>
Subject: Re: [PATCH 1/4] documentation: add palmas dts definition
Date: Thu, 28 Feb 2013 10:57:20 +0000
Message-ID: <512F3810.30109@slimlogic.co.uk>
References: <1361164283-3133-1-git-send-email-j-keerthy@ti.com> <512E5144.9020105@wwwdotorg.org> <512F1ADF.90906@nvidia.com> <512F2A29.8080708@slimlogic.co.uk> <512F3118.6030806@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <512F3118.6030806@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, J Keerthy <j-keerthy@ti.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "b-cousson@ti.com" <b-cousson@ti.com>
List-Id: devicetree@vger.kernel.org

On 28/02/13 10:27, Laxman Dewangan wrote:
> On Thursday 28 February 2013 03:28 PM, Graeme Gregory wrote:
>> On 28/02/13 08:52, Laxman Dewangan wrote:
>>> On Thursday 28 February 2013 12:02 AM, Stephen Warren wrote:
>>>> On 02/17/2013 10:11 PM, J Keerthy wrote:
>>>> +- interrupt-parent : The parent interrupt controller.
>>>> +
>>>> +Optional node:
>>>> +- Child nodes contain in the palmas. The palmas family is made of
>>>> several
>>>> +  variants that support a different number of features.
>>>> +  The child nodes will thus depend of the capability of the variant.
>>>> Are there DT bindings for those child nodes anywhere?
>>>>
>>>> Representing each internal component as a separate DT node feels a
>>>> little like designing the DT bindings to model the Linux-internal MFD
>>>> structure. DT bindings should be driven by the HW design and
>>>> OS-agnostic.
>>>>
>>>>   From a DT perspective, is there any need at all to create a
>>>> separate DT
>>>> node for each component? This would only be needed or useful if the
>>>> child IP blocks (and hence DT bindings for those blocks) could be
>>>> re-used in other top-level devices that aren't represented by this
>>>> top-level ti,palmas DT binding. Are the HW IP blocks here re-used
>>>> anywhere, or will they be?
>>>
>>> I dont think that child IP block can be used outside of the palma
>>> although other mfd device may have same IP.
>>>
>>> The child driver very much used the palma's API for register access
>>> and they can not be separated untill driver is write completely
>>> independent of palmas API. Currently, child driver include the palma
>>> header, uses palma mfd stcruture and plama's api for accessing
>>> registers.
>>>
>> I wonder why break good software principles of keeping data and code
>> localised? Just because there is no current case where a block is
>> re-used does not mean it shall not be so in the future. The original
>> information I got from TI when designing this was blocks may be re-used
>> in future products.
>>
>> This structure also makes it much neater when dealing with palmas
>> varients with different IP blocks which already exist.
>>
>> I also do not see an issue with working like the internal MFD structure,
>> I think it is a good design.
>
>
> I did not get how the register access will be happen from IP driver.
> suppose we have RTC driver which is common IP for device 1 and
> device2. Device1 and device2 are registered as separate MFD driver
> which has different set of chip structure and initialisation.
>
> When I write the RTC register then how do  I call register access?
> Currently RTC driver is saying device1_reg_read() or
> device2_reg_read() etc on which register address passed along with dev
> or chip structure.
>
Since I originally wrote the driver it is now possible to get your
parents regmap without knowledge of the parent.

All that is then needed is a method to pass an offset (possibly re-use
IO_RESOURCE).

The final but of information that would be needed is some method to pass
down product_id/design_rev and for a lot of the IP blocks they could be
made independent of the actual parent.

This is theoretical at the moment because I would not do this work
unless it became neccessary. But this was in my head when I was
originally designing the driver.

The RTC is a good point, the same RTC IP block is used in most tps6591X
and tps800XX devices. My dream would be to make them all one driver!

Graeme

