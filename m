From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 0/4] mailbox: mailbox-test: support single channel with
 separate Tx and Rx buffer
Date: Mon, 15 Feb 2016 12:38:30 +0000
Message-ID: <56C1C6C6.6060108@arm.com>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
 <56C1C1DA.5000207@arm.com>
 <CABb+yY20VRzHa540c6guAJS-U3Y5XFCbAYAWwSLT3ugOJRYmfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY20VRzHa540c6guAJS-U3Y5XFCbAYAWwSLT3ugOJRYmfw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Lee Jones <lee.jones@linaro.org>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 15/02/16 12:31, Jassi Brar wrote:
> On Mon, Feb 15, 2016 at 5:47 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>> Hi Jassi,
>>
>> On 11/02/16 17:13, Sudeep Holla wrote:
>>>
>>> Hi Lee, Jassi,
>>>
>>> Assuming mailbox-test was designed to be generic, I am trying to extend
>>> it to support single channel with separate Tx and Rx buffer. With these
>>> changes I am able to test arm_mhu driver. However I couldn't understand
>>> the intention of converting buffer to ASCII hex dump in read method.
>>> I have a local change to remove that so that it can deal with any data
>>> in any format(e.g. some protocol format) and userspace can deal with the
>>> actual interpretation of the data. Let me know your thoughts on that.
>>>
>>
>> Can you review this ? It would be good to get this in for v4.6
>>
> Seems simple enough. So once you and Lee are in sync...
>

That was quick :). Anyways IIUC Lee agrees with most of the changes.

The question I am asking is not part of this series, I didn't make the
change to remove hexdump yet, I am trying to understand the reasoning
for doing that and also explaining my requirement as why I want to
remove it.

-- 
Regards,
Sudeep
