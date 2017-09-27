From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/3] firmware: of: populate /firmware/ node during init
Date: Wed, 27 Sep 2017 17:54:01 +0100
Message-ID: <af1836ea-d00b-fced-8665-27ba889e7a4e@arm.com>
References: <1502458237-1683-1-git-send-email-sudeep.holla@arm.com>
 <1502458237-1683-2-git-send-email-sudeep.holla@arm.com>
 <CAK8P3a1p8xS4u5EQ9auqgcmhXaybhDdsa6ah3G-7TeEf+ko9kA@mail.gmail.com>
 <CABGGisyQKfre_qMqnngOiKbqUaHF0KWKtZyYPJ47iPwgL5t6xw@mail.gmail.com>
 <CAK8P3a3=8D5Mz54TYbfyrPC7yyKY-m7=H1OfS9JVKTdC0h-tHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3=8D5Mz54TYbfyrPC7yyKY-m7=H1OfS9JVKTdC0h-tHw@mail.gmail.com>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>
List-Id: devicetree@vger.kernel.org

(sorry for replying on old thread)

On 11/08/17 16:54, Arnd Bergmann wrote:
> On Fri, Aug 11, 2017 at 5:05 PM, Rob Herring <robh@kernel.org> wrote:
>> On Fri, Aug 11, 2017 at 9:37 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>>> On Fri, Aug 11, 2017 at 3:30 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>>>> Since "/firmware" does not have its own "compatible" property as it's
>>>> just collection of nodes representing firmware interface, it's sub-nodes
>>>> are not populated during system initialization.
>>>>
>>>> Currently different firmware drivers search the /firmware/ node and
>>>> populate the sub-node devices selectively. Instead we can populate
>>>> the /firmware/ node during init to avoid more drivers continuing to
>>>> populate the devices selectively.
>>>>
>>>> This patch adds initcall to achieve the same.
>>>
>>> Hmm, I'm a bit skeptical whether representing anything under /firmware
>>> as a platform device is a good idea. Having a more structured way to
>>> probe those seems like a good idea, but maybe a different subsystem
>>> would be more appropriate.
>>>
>>> I do realize that a 'platform_device' has become a rather generic abstraction
>>> for almost anything, but at some point we might want to draw the line
>>> of what is a platform_device.
>>
>> I guess the question how are they different? Most of what's under
>> drivers/firmware/ are platform drivers. I think they are mostly either
>> smc calls or mailbox interfaces. Would there be any advantage to
>> creating an smc bus or mailbox bus?
> 
> I guess one difference I see is between things that are purely software
> based (smc, efi runtime, rtas,  ...) and those that talk to some
> hardware other than the CPU running some firmware.
> 
> The first category seems like a good fit for /firmware in DT and
> for /sys/firmware in sysfs, while the second category would be
> represented elsewhere in both DT and sysfs.
> 

After some thoughts and looking around I see examples of lots of drivers
using platform device for firmware interface including rtc-efi.

So IIUC, anything exposed to userspace about sch firmware interface must
be in "/sys/firmware", but I don't see any issue with kernel handling
them as platform device/driver internally.

-- 
Regards,
Sudeep
