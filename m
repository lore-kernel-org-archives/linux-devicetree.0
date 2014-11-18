From: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 1/2] efuse: IMG Pistachio eFuse Controller
Date: Tue, 18 Nov 2014 12:05:12 +0000
Message-ID: <546B35F8.9070902@imgtec.com>
References: <1416237576-21542-1-git-send-email-arul.ramasamy@imgtec.com>	<1416237576-21542-2-git-send-email-arul.ramasamy@imgtec.com>	<546A189B.3090202@imgtec.com>	<27E62D98F903554192E3C13AFCC91C3C2F506FE2@hbmail01.hb.imgtec.org> <CAL1qeaHSevOJ-o=nFqgze8utMgTk-Mh7Y9uRMa6wnjeofji98w@mail.gmail.com> <546B152D.1010804@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546B152D.1010804-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/18/14 09:45, James Hogan wrote:
> On 18/11/14 00:26, Andrew Bresticker wrote:
>> Hi Naidu,
>>
>> On Mon, Nov 17, 2014 at 4:12 PM, Naidu Tellapati
>> <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
>>> Hi Andrew,
>>>
>>> (We will respond to James Hogan's remaining review comments in a separate email)
>>>
>>>>> +obj-$(CONFIG_SOC_IMG)           += pistachio/
>>>> What is CONFIG_SOC_IMG? It sounds very generic.
>>> May I have your suggestions on the above.
>>>
>>> (Assuming we create drivers/soc/img/ instead of drivers/soc/pistachio/)
> What would "belong" in there?
> Basically anything that doesn't belong in some particular subsystem?
>
>> I don't have much visibility into ImgTec SoCs other than Pistachio,
>> but I think introducing a SOC_IMG Kconfig symbol is a good idea as it
>> gives drivers for various pieces of IP present on ImgTec SoCs
>> (watchdog, I2C, DMA, etc.) a more specific dependency than say MIPS or
>> METAG.  Maybe James has a suggestion for how to deal with this?
> I have very limited experience with IMG based SoCs other than Chorus2
> and TZ1090, but I'm not convinced an SOC_IMG adds any value tbh if it is
> simply a way to group drivers. Both SOC_IMG and METAG || MIPS would end
> up being fuzzy/inexact convenience dependencies to reduce clutter on
> other platforms, so perhaps it would be best kept simple, flexible and
> easily understandable. I don't feel strongly about it either way though.
>
> I suspect certain IP blocks may potentially get licensed separately and
> require exceptions (PDP springs to mind?), so it probably is technically
> a per-IP block thing. James Hartley might have a better idea about that.
>
> Cheers
> James
>
I think there is value in keeping the clutter down in the kernel config, 
so if there is already precedent for using a symbol such as IMG_SOC then 
I don't see a strong reason not to do it.  IP blocks present in 
pistachio may also be used in other (non MIPS or META) SoCs, so provided 
it is acceptable to expect other SoC providers to add their own symbols 
when required I think we should go ahead with it.

James.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
