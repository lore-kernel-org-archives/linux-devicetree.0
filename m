From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] dt: xilinx: zynqmp: Add bindings for PM firmware
Date: Mon, 14 Aug 2017 16:35:34 +0200
Message-ID: <dd6173f6-7ae2-913a-321d-ec1e492af629@xilinx.com>
References: <cover.1501854302.git.michal.simek@xilinx.com>
 <8c27b7eec6cc00d37dfe9b3998212ce9c9c27a31.1501854302.git.michal.simek@xilinx.com>
 <20170810191056.ur5b3zdrcgmb6sim@rob-hp-laptop>
 <4e5d9f8c-9e87-bdcd-388a-aab3c32415e8@xilinx.com>
 <20170811135453.GU12347@toto>
 <5d2e3a5e-6060-ff13-a065-c4b6be37e4c9@xilinx.com>
 <CABGGiszb1kr8ggo8Jv9jsvStK5DxpseuBy7z=_OK8pLN==h25Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABGGiszb1kr8ggo8Jv9jsvStK5DxpseuBy7z=_OK8pLN==h25Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Edgar Iglesias <edgari-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 14.8.2017 16:03, Rob Herring wrote:
> On Mon, Aug 14, 2017 at 8:47 AM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> On 11.8.2017 15:54, Edgar E. Iglesias wrote:
>>> On Fri, Aug 11, 2017 at 02:58:03PM +0200, Michal Simek wrote:
>>>> Hi Rob, +Edgar,
>>>>
>>>> On 10.8.2017 21:10, Rob Herring wrote:
>>>>> On Fri, Aug 04, 2017 at 03:45:30PM +0200, Michal Simek wrote:
>>>>>> From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>>>>
>>>>>> Document the DT bindings for the Zynq UltraScale+ PM Firmware.
> 
> [...]
> 
>>>>>> + - method:        The method of calling the PM-API firmware layer.
>>>>>> +          Permitted values are:
>>>>>> +           - "smc" : To be used in configurations without a hypervisor
>>>>>> +           - "hvc" : To be used when hypervisor is present
>>>>>
>>>>> Do you really use both?
>>>>>
>>>>
>>>> SMCs definitely yes.
>>>>
>>>> Interface was designed in that way and I don't know if people are using
>>>> it or not.
>>>>
>>>> Not sure if Xen is blocking SMCs. I know we have discussed it but not
>>>> sure if this is enabled by default or only for certain configurations.
>>>> Also not sure if xen contains handler for hvc.
>>>> Edgar: Do you know?
>>>
>>> We have patches for Xen that implement a power-management mediator.
>>> That implementation handles PM calls over both SMC and HVC insns.
>>> Patches are on the Xen mailing list.
>>>
>>> Other hypervisors may work differently.
>>>
>>> I think we should support both but I don't have a strong opinion on it.
>>
>> Rob: Are you ok with having it there?
> 
> Yes.

Ok. Let me send v2 then.

Thanks,
Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
