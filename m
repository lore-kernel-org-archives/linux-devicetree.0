From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [RFC PATCH v2 08/15] usb:cdns3: Implements device operations part
 of the API
Date: Fri, 14 Dec 2018 16:09:37 +0530
Message-ID: <5a41de27-cd1f-0cfd-ccdc-dccbf0854fcb@ti.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-9-git-send-email-pawell@cadence.com>
 <5BFE8883.7090802@ti.com>
 <CAL411-oKvu3EADStit=JtbcxVzM_fFGF2uPn67-wmXxPzUK6GQ@mail.gmail.com>
 <6b19b55c-66d7-439e-df8f-7b311b45af5e@ti.com>
 <BYAPR07MB470972A525D85B03C3037D3BDDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <CAL411-oc-_0H88egpHsc06ptL12UsaE63rWwjN7novuFFx_qbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL411-oc-_0H88egpHsc06ptL12UsaE63rWwjN7novuFFx_qbA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>, pawell@cadence.com
Cc: rogerq@ti.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, adouglas@cadence.com, jbergsagel@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, balbi@kernel.org
List-Id: devicetree@vger.kernel.org

On 14/12/18 7:04 AM, Peter Chen wrote:
> On Wed, Dec 12, 2018 at 3:49 AM Pawel Laszczak <pawell@cadence.com> wrote:
>>
>> Hi,
>>
>>> On 10/12/18 7:42 AM, Peter Chen wrote:
>>>>>> +static struct usb_ep *cdns3_gadget_match_ep(struct usb_gadget *gadget,
>>>>>> +                                         struct usb_endpoint_descriptor *desc,
>>>>>> +                                         struct usb_ss_ep_comp_descriptor *comp_desc)
>>>>>> +{
>>>>>> +     struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
>>>>>> +     struct cdns3_endpoint *priv_ep;
>>>>>> +     unsigned long flags;
>>>>>> +
>>>>>> +     priv_ep = cdns3_find_available_ss_ep(priv_dev, desc);
>>>>>> +     if (IS_ERR(priv_ep)) {
>>>>>> +             dev_err(&priv_dev->dev, "no available ep\n");
>>>>>> +             return NULL;
>>>>>> +     }
>>>>>> +
>>>>>> +     dev_dbg(&priv_dev->dev, "match endpoint: %s\n", priv_ep->name);
>>>>>> +
>>>>>> +     spin_lock_irqsave(&priv_dev->lock, flags);
>>>>>> +     priv_ep->endpoint.desc = desc;
>>>>>> +     priv_ep->dir  = usb_endpoint_dir_in(desc) ? USB_DIR_IN : USB_DIR_OUT;
>>>>>> +     priv_ep->type = usb_endpoint_type(desc);
>>>>>> +
>>>>>> +     list_add_tail(&priv_ep->ep_match_pending_list,
>>>>>> +                   &priv_dev->ep_match_list);
>>>>>> +     spin_unlock_irqrestore(&priv_dev->lock, flags);
>>>>>> +     return &priv_ep->endpoint;
>>>>>> +}
>>>>> Why do you need a custom match_ep?
>>>>> doesn't usb_ep_autoconfig suffice?
>>>>>
>>>>> You can check if EP is claimed or not by checking the ep->claimed flag.
>>>>>
>>>> It is a special requirement for this IP, the EP type and MaxPacketSize
>>>> changing can't be done at runtime, eg, at ep->enable. See below commit
>>>> for detail.
>>>>
>>>>     usb: cdns3: gadget: configure all endpoints before set configuration
>>>>
>>>>     Cadence IP has one limitation that all endpoints must be configured
>>>>     (Type & MaxPacketSize) before setting configuration through hardware
>>>>     register, it means we can't change endpoints configuration after
>>>>     set_configuration.
>>>>
>>>>     In this patch, we add non-control endpoint through usb_ss->ep_match_list,
>>>>     which is added when the gadget driver uses usb_ep_autoconfig to configure
>>>>     specific endpoint; When the udc driver receives set_configurion request,
>>>>     it goes through usb_ss->ep_match_list, and configure all endpoints
>>>>     accordingly.
>>>>
>>>>     At usb_ep_ops.enable/disable, we only enable and disable endpoint through
>>>>     ep_cfg register which can be changed after set_configuration, and do
>>>>     some software operation accordingly.
>>>
>>> All this should be part of comments in code along with information about
>>> controller versions which suffer from the errata.
>>>
>>> Is there a version of controller available which does not have the
>>> defect? Is there a future plan to fix this?
>>>
>>> If any of that is yes, you probably want to handle this with runtime
>>> detection of version (like done with DWC3_REVISION_XXX macros).
>>> Sometimes the hardware-read versions themselves are incorrect, so its
>>> better to introduce a version specific compatible too like
>>> "cdns,usb-1.0.0" (as hinted to by Rob Herring as well).
>>>
>>
>> custom match_ep is used and works with all versions of the gen1
>> controller. Future (gen2) releases of the controller won’t have such
>> limitation but there is no plan to change current (gen1) functionality
>> of the controller.
>>
>> I will add comment before cdns3_gadget_match_ep function.
>> Also I will change cdns,usb3 to cdns,usb3-1.0.0 and add additional
>> cdns,usb3-1.0.1 compatible.
>>
>> cdns,usb3-1.0.1 will be for current version of controller which I use.
>> cdns,usb3-1.0.0 will be for older version - Peter Chan platform.
>> I now that I have some changes in controller, and one of them require
>> some changes in DRD driver. It will be safer to add two separate
>> version in compatibles.
>>
> 
> Pawel, could we have correct register to show controller version? It is
> better we could version judgement at runtime instead of static compatible.

Agree with detecting IP version at runtime.

But please have some indication of version in compatible string too,
especially since you already know there is going to be another revision
of hardware. It has the advantage that one can easily grep to see which
hardware is running current version of controller without having access
to the hardware itself. Becomes useful later on when its time to
clean-up unused code when boards become obsolete or for requesting
testing help.

Thanks,
Sekhar
