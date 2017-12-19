From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 2/2] misc: xlnx_vcu: Add Xilinx ZYNQMP VCU logicoreIP
 init driver
Date: Tue, 19 Dec 2017 14:24:55 +0100
Message-ID: <f11d2f97-3eda-d43d-2cbd-96d2c331fd47@xilinx.com>
References: <29198c0a-783e-8aa0-00e4-44b1fa1acef7@infradead.org>
 <1513322656-4571-1-git-send-email-dshah@xilinx.com>
 <1513322656-4571-3-git-send-email-dshah@xilinx.com>
 <CAK8P3a0nm_-pxGWXHx_FAXgXt1msE2bK0D4paBMWgryPyeS9xA@mail.gmail.com>
 <b3b41b04-7f93-1c20-2e62-817b4c743b89@xilinx.com>
 <CAK8P3a0z6HF8Rg08HUj7_T+7ZxxnHoReiu68bNzF6CnEooQSdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a0z6HF8Rg08HUj7_T+7ZxxnHoReiu68bNzF6CnEooQSdA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18.12.2017 15:05, Arnd Bergmann wrote:
> On Mon, Dec 18, 2017 at 2:13 PM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> On 15.12.2017 14:26, Arnd Bergmann wrote:
>>> In Fri, Dec 15, 2017 at 8:24 AM, Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>>>> Xilinx ZYNQMP logicoreIP Init driver is based on the new
>>>> LogiCoreIP design created. This driver provides the processing system
>>>> and programmable logic isolation. Set the frequency based on the clock
>>>> information get from the logicoreIP register set.
>>>>
>>>> It is put in drivers/misc as there is no subsystem for this logicoreIP.
>>>>
>>>> Signed-off-by: Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>
>>> After giving this some more thought, I'd suggest you move the driver to
>>> drivers/soc/xilinx or drivers/soc/zynq instead of drivers/misc/, and have
>>> it merged by Michal Simek as a driver patch that will go through arm-soc.
>>
>> I have not a problem of creating drivers/soc/xilinx/ location for this
>> driver. It is not zynq (arm32) but zynqmp(arm64) device where this
>> driver can be used. As far as I understand it is memory mapped soft IP
>> which could be also accessed by soft core CPU.
> 
> Ok. I wouldn't be worried about having a zynq directory for stuff that
> is common between zynq and zynqmp, but the soft code CPU case
> wouldn't make that ideal.
> 
>> It means drivers/soc/xilinx could be shared by all xilinx platforms anyway.
>> We have been discussing that openrisc cases and for sure if someone
>> wants to enable this driver there using misc location would be one
>> option but I also think that using drivers/soc/xilinx location is not a
>> bad option because it is very unlikely that anybody tries it.
>>
>> Arnd: misc or drivers/soc/xilinx?
> 
> drivers/soc/xilinx please, thanks for the clarification.
> 

ok. I have sent patch which prepare structures in drivers/soc/xilinx.

Dhaval: Please rebase your patch based on this and put driver to this
location.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
