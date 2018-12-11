From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [RFC PATCH v2 08/15] usb:cdns3: Implements device operations part
 of the API
Date: Tue, 11 Dec 2018 16:56:57 +0530
Message-ID: <6b19b55c-66d7-439e-df8f-7b311b45af5e@ti.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-9-git-send-email-pawell@cadence.com>
 <5BFE8883.7090802@ti.com>
 <CAL411-oKvu3EADStit=JtbcxVzM_fFGF2uPn67-wmXxPzUK6GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL411-oKvu3EADStit=JtbcxVzM_fFGF2uPn67-wmXxPzUK6GQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>, rogerq@ti.com
Cc: pawell@cadence.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, adouglas@cadence.com, jbergsagel@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, balbi@kernel.org
List-Id: devicetree@vger.kernel.org

On 10/12/18 7:42 AM, Peter Chen wrote:
>>> +static struct usb_ep *cdns3_gadget_match_ep(struct usb_gadget *gadget,
>>> +                                         struct usb_endpoint_descriptor *desc,
>>> +                                         struct usb_ss_ep_comp_descriptor *comp_desc)
>>> +{
>>> +     struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
>>> +     struct cdns3_endpoint *priv_ep;
>>> +     unsigned long flags;
>>> +
>>> +     priv_ep = cdns3_find_available_ss_ep(priv_dev, desc);
>>> +     if (IS_ERR(priv_ep)) {
>>> +             dev_err(&priv_dev->dev, "no available ep\n");
>>> +             return NULL;
>>> +     }
>>> +
>>> +     dev_dbg(&priv_dev->dev, "match endpoint: %s\n", priv_ep->name);
>>> +
>>> +     spin_lock_irqsave(&priv_dev->lock, flags);
>>> +     priv_ep->endpoint.desc = desc;
>>> +     priv_ep->dir  = usb_endpoint_dir_in(desc) ? USB_DIR_IN : USB_DIR_OUT;
>>> +     priv_ep->type = usb_endpoint_type(desc);
>>> +
>>> +     list_add_tail(&priv_ep->ep_match_pending_list,
>>> +                   &priv_dev->ep_match_list);
>>> +     spin_unlock_irqrestore(&priv_dev->lock, flags);
>>> +     return &priv_ep->endpoint;
>>> +}
>> Why do you need a custom match_ep?
>> doesn't usb_ep_autoconfig suffice?
>>
>> You can check if EP is claimed or not by checking the ep->claimed flag.
>>
> It is a special requirement for this IP, the EP type and MaxPacketSize
> changing can't be done at runtime, eg, at ep->enable. See below commit
> for detail.
> 
>     usb: cdns3: gadget: configure all endpoints before set configuration
> 
>     Cadence IP has one limitation that all endpoints must be configured
>     (Type & MaxPacketSize) before setting configuration through hardware
>     register, it means we can't change endpoints configuration after
>     set_configuration.
> 
>     In this patch, we add non-control endpoint through usb_ss->ep_match_list,
>     which is added when the gadget driver uses usb_ep_autoconfig to configure
>     specific endpoint; When the udc driver receives set_configurion request,
>     it goes through usb_ss->ep_match_list, and configure all endpoints
>     accordingly.
> 
>     At usb_ep_ops.enable/disable, we only enable and disable endpoint through
>     ep_cfg register which can be changed after set_configuration, and do
>     some software operation accordingly.

All this should be part of comments in code along with information about
controller versions which suffer from the errata.

Is there a version of controller available which does not have the
defect? Is there a future plan to fix this?

If any of that is yes, you probably want to handle this with runtime
detection of version (like done with DWC3_REVISION_XXX macros).
Sometimes the hardware-read versions themselves are incorrect, so its
better to introduce a version specific compatible too like
"cdns,usb-1.0.0" (as hinted to by Rob Herring as well).

Thanks,
Sekhar
