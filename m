From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/4] mailbox: add support for System Control and Power
 Interface(SCPI) protocol
Date: Wed, 29 Apr 2015 14:08:14 +0100
Message-ID: <5540D7BE.9010201@arm.com>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>	 <1430134846-24320-2-git-send-email-sudeep.holla@arm.com>	 <1430229283.3321.40.camel@linaro.org> <5540B840.1030900@arm.com>	 <1430307828.27241.32.camel@linaro.org> <1430310338.27241.45.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430310338.27241.45.camel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 29/04/15 13:25, Jon Medhurst (Tixy) wrote:
> On Wed, 2015-04-29 at 12:43 +0100, Jon Medhurst (Tixy) wrote:
>> On Wed, 2015-04-29 at 11:53 +0100, Sudeep Holla wrote:
>>> On 28/04/15 14:54, Jon Medhurst (Tixy) wrote:
>>>> On Mon, 2015-04-27 at 12:40 +0100, Sudeep Holla wrote:
>> [...]
>>>>> +     int ret;
>>>>> +     u8 token, chan;
>>>>> +     struct scpi_xfer *msg;
>>>>> +     struct scpi_chan *scpi_chan;
>>>>> +
>>>>> +     chan = atomic_inc_return(&scpi_info->next_chan) % scpi_info->num_chans;
>>>>> +     scpi_chan = scpi_info->channels + chan;
>>>>> +
>>>>> +     msg = get_scpi_xfer(scpi_chan);
>>>>> +     if (!msg)
>>>>> +             return -ENOMEM;
>>>>> +
>>>>> +     token = atomic_inc_return(&scpi_chan->token) & CMD_TOKEN_ID_MASK;
>>>>
>>>> So, this 8 bit token is what's used to 'uniquely' identify a pending
>>>> command. But as it's just an incrementing value, then if one command
>>>> gets delayed for long enough that 256 more are issued then we will have
>>>> a non-unique value and scpi_process_cmd can go wrong.
>>>>
>>>
>>> IMO by the time 256 message are queued up and serviced we would timeout
>>> on the initial command. Moreover the core mailbox has sent the mailbox
>>> length to 20(MBOX_TX_QUEUE_LEN) which needs to removed to even get the
>>> remote chance of hit the corner case.
>>
>> The corner case can be hit even if the queue length is only 2, because
>> other processes/cpus can use the other message we don't own here and
>> they can send then receive a message using that, 256 times. The corner
>> case doesn't require 256 simultaneous outstanding requests.
>>
>> That is the reason I suggested that rather than using an incrementing
>> value for the 'unique' token, that each message instead contain the
>> value of the token to use with it.
>
> Of course, I failed to mention that this solution to this problem makes
> thing worse for the situation where we timeout messages, because the
> same token will get reused quicker in that case. So, in practice, if we
> have timeouts, and a unchangeable protocol limitation of 256 tokens,
> then using those tokens in order, for each message sent is probably the
> best we can do.
>

I agree, I think we must be happy with that for now :)

> Perhaps that's the clue, generate and add the token to the message, just
> before transmission via the MHU, at a point where we know no other
> request can overtake us. In scpi_tx_prepare? Perhaps, it might also be
> good to only use up a token if we are expecting a response, and use zero
> for other messages?
>
> Something like this totally untested patch...
>

Looks good and best we can do with the limitations we have IMO

Regards,
Sudeep
