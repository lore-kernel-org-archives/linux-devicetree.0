From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [RFC PATCH v2 08/15] usb:cdns3: Implements device operations part
 of the API
Date: Fri, 14 Dec 2018 17:50:55 +0530
Message-ID: <7e6ac47e-61e4-ecd3-73d3-9b1be2d81479@ti.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-9-git-send-email-pawell@cadence.com>
 <5BFE8883.7090802@ti.com>
 <CAL411-oKvu3EADStit=JtbcxVzM_fFGF2uPn67-wmXxPzUK6GQ@mail.gmail.com>
 <6b19b55c-66d7-439e-df8f-7b311b45af5e@ti.com>
 <BYAPR07MB470972A525D85B03C3037D3BDDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <CAL411-oc-_0H88egpHsc06ptL12UsaE63rWwjN7novuFFx_qbA@mail.gmail.com>
 <5a41de27-cd1f-0cfd-ccdc-dccbf0854fcb@ti.com>
 <87bm5ol6zt.fsf@linux.intel.com>
 <d5623e70-7971-d729-f395-7259ab0efdb0@ti.com>
 <875zvwl585.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <875zvwl585.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, pawell@cadence.com
Cc: rogerq@ti.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, adouglas@cadence.com, jbergsagel@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On 14/12/18 4:56 PM, Felipe Balbi wrote:
> Hi,
> 
> Sekhar Nori <nsekhar@ti.com> writes:
>>>>>>> All this should be part of comments in code along with information about
>>>>>>> controller versions which suffer from the errata.
>>>>>>>
>>>>>>> Is there a version of controller available which does not have the
>>>>>>> defect? Is there a future plan to fix this?
>>>>>>>
>>>>>>> If any of that is yes, you probably want to handle this with runtime
>>>>>>> detection of version (like done with DWC3_REVISION_XXX macros).
>>>>>>> Sometimes the hardware-read versions themselves are incorrect, so its
>>>>>>> better to introduce a version specific compatible too like
>>>>>>> "cdns,usb-1.0.0" (as hinted to by Rob Herring as well).
>>>>>>>
>>>>>>
>>>>>> custom match_ep is used and works with all versions of the gen1
>>>>>> controller. Future (gen2) releases of the controller won’t have such
>>>>>> limitation but there is no plan to change current (gen1) functionality
>>>>>> of the controller.
>>>>>>
>>>>>> I will add comment before cdns3_gadget_match_ep function.
>>>>>> Also I will change cdns,usb3 to cdns,usb3-1.0.0 and add additional
>>>>>> cdns,usb3-1.0.1 compatible.
>>>>>>
>>>>>> cdns,usb3-1.0.1 will be for current version of controller which I use.
>>>>>> cdns,usb3-1.0.0 will be for older version - Peter Chan platform.
>>>>>> I now that I have some changes in controller, and one of them require
>>>>>> some changes in DRD driver. It will be safer to add two separate
>>>>>> version in compatibles.
>>>>>>
>>>>>
>>>>> Pawel, could we have correct register to show controller version? It is
>>>>> better we could version judgement at runtime instead of static compatible.
>>>>
>>>> Agree with detecting IP version at runtime.
>>>>
>>>> But please have some indication of version in compatible string too,
>>>
>>> why? Runtime detection by revision register should be the way to go if
>>> the HW provides it. Why duplicate the information in compatible string?
>>>
>>>> especially since you already know there is going to be another revision
>>>> of hardware. It has the advantage that one can easily grep to see which
>>>> hardware is running current version of controller without having access
>>>> to the hardware itself. Becomes useful later on when its time to
>>>> clean-up unused code when boards become obsolete or for requesting
>>>> testing help.
>>>
>>> This doesn't sound like a very strong argument, actually. Specially when
>>> you consider that, since driver will do revision checking based on
>>> revision register, you already have strings to grep. Moreover, we don't
>>> usually drop support just like that.
>>
>> AFAICS, it is impossible to know just by grep'ing if there is any
>> hardware still supported in kernel and using DWC3_REVISION_194A, for
>> example.
> 
> but why do you even care?

When, for example, its coming in the way of some clean-up I am
attempting to do.

> 
>> If we are never going to drop support for any revision, this does not
>> matter much.
>>
>> Also, once you have the controller supported behind PCI, then I guess
>> you are pretty much tied to having to read hardware revision at runtime.
> 
> that's another argument *for* using runtime detection, not against it.

I know :). I should have stated that in last e-mail itself, I am okay
with just runtime detection.

Thanks,
Sekhar
