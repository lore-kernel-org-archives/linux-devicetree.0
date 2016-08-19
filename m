From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v5 0/5] da8xx USB PHY platform devices and clocks (was
 "da8xx UBS clocks")
Date: Fri, 19 Aug 2016 11:50:59 -0500
Message-ID: <092cb48d-09a5-208a-ea05-c1e66e27f444@lechnology.com>
References: <1462837612-7803-1-git-send-email-david@lechnology.com>
 <57431E73.5030304@lechnology.com> <57458A0A.5010100@ti.com>
 <CAOi56cWCZioi=qU-iaLvCfh-EmbPh4pwwTJ5tDK+9qfv5+8WuQ@mail.gmail.com>
 <57B42FD3.50004@ti.com>
 <CAOi56cU5zicwKmHh_QfNj8fg_7WXvmRC8SgGouzGiMSeFkkXNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOi56cU5zicwKmHh_QfNj8fg_7WXvmRC8SgGouzGiMSeFkkXNg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, petr@barix.com, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

On 08/19/2016 11:40 AM, Kevin Hilman wrote:
> David,
>
> On Wed, Aug 17, 2016 at 4:35 AM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
>>
>> Hi Kevin,
>>
>> On Saturday 13 August 2016 02:54 AM, Kevin Hilman wrote:
>>> On Wed, May 25, 2016 at 6:18 AM, Sekhar Nori <nsekhar@ti.com> wrote:
>>>> On Monday 23 May 2016 08:44 PM, David Lechner wrote:
>>>>> On 05/09/2016 06:46 PM, David Lechner wrote:
>>>>>> v5 changes: renamed "usbphy" to "usb_phy" or "usb-phy" as appropriate
>>>>>>
>>>
>>> [...]
>>>
>>>>>
>>>>> What should I be doing to keep this moving along?
>>>>
>>>> We need the related driver changes to be applied first. I could then use
>>>> an immutable branch to push the platform changes against.
>>>>
>>>> I did take a look at the patches and they look good to me. Except the
>>>> one comment from Sergei which I just now indicated that I agree with.
>>>
>>> Just checking on the status of this.  I'm not seeing the driver
>>> changes in mainline yet.
>>>
>>> Any update?
>>
>> phy driver is already merged which actually introduced a compilation error. The
>> fix for it is currently queued in linux-phy -fixes and it should be merged in
>> this -rc cycle.
>> I think it would be better if David Lechner re-spins the series re-based on top
>> of latest mainline kernel and then merged by Bin/Alan.
>
> Does this work for you?
>
> Kevin
>


Yes, I try to get this done in the next few days.
