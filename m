From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/4] mailbox: add support for System Control and Power
 Interface(SCPI) protocol
Date: Wed, 29 Apr 2015 14:01:57 +0100
Message-ID: <5540D645.10509@arm.com>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>		 <1430134846-24320-2-git-send-email-sudeep.holla@arm.com>	 <1430229283.3321.40.camel@linaro.org> <5540B840.1030900@arm.com> <1430307828.27241.32.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430307828.27241.32.camel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Tixy,

On 29/04/15 12:43, Jon Medhurst (Tixy) wrote:
> On Wed, 2015-04-29 at 11:53 +0100, Sudeep Holla wrote:
>> On 28/04/15 14:54, Jon Medhurst (Tixy) wrote:
>>> On Mon, 2015-04-27 at 12:40 +0100, Sudeep Holla wrote:
> [...]
>>>> +     int ret;
>>>> +     u8 token, chan;
>>>> +     struct scpi_xfer *msg;
>>>> +     struct scpi_chan *scpi_chan;
>>>> +
>>>> +     chan = atomic_inc_return(&scpi_info->next_chan) % scpi_info->num_chans;
>>>> +     scpi_chan = scpi_info->channels + chan;
>>>> +
>>>> +     msg = get_scpi_xfer(scpi_chan);
>>>> +     if (!msg)
>>>> +             return -ENOMEM;
>>>> +
>>>> +     token = atomic_inc_return(&scpi_chan->token) & CMD_TOKEN_ID_MASK;
>>>
>>> So, this 8 bit token is what's used to 'uniquely' identify a pending
>>> command. But as it's just an incrementing value, then if one command
>>> gets delayed for long enough that 256 more are issued then we will have
>>> a non-unique value and scpi_process_cmd can go wrong.
>>>
>>
>> IMO by the time 256 message are queued up and serviced we would timeout
>> on the initial command. Moreover the core mailbox has sent the mailbox
>> length to 20(MBOX_TX_QUEUE_LEN) which needs to removed to even get the
>> remote chance of hit the corner case.
>
> The corner case can be hit even if the queue length is only 2, because
> other processes/cpus can use the other message we don't own here and
> they can send then receive a message using that, 256 times. The corner
> case doesn't require 256 simultaneous outstanding requests.
>

Good point, I missed it completely.

> That is the reason I suggested that rather than using an incrementing
> value for the 'unique' token, that each message instead contain the
> value of the token to use with it.
>
>>
>>> Note, this delay doesn't just have to be at the SCPI end. We could get
>>> preempted here (?) before actually sending the command to the SCP and
>>> other kernel threads or processes could send those other 256 commands
>>> before we get to run again.
>>>
>>
>> Agreed, but we would still timeout after 3 jiffies max.
>
> But we haven't started any timeout yet, the 3 jiffies won't start until
> we get scheduled again and call wait_for_completion_timeout below.

Agreed.

>>
>>> Wouldn't it be better instead to have scpi_alloc_xfer_list add a unique
>>> number to each struct scpi_xfer.
>>>
>>
>> One of reason using it part of command is that SCP gives it back in the
>> response to compare.
>
> Can't we fill the token in the command from the value stored in the
> struct scpi_xfer we are using to send that command?
>

Yes we can but 256 limitation still exists but solve some issues at-least.

>>>> +
>>>> +     msg->slot = BIT(SCPI_SLOT);
>>>> +     msg->cmd = PACK_SCPI_CMD(cmd, token, len);
>>>> +     msg->tx_buf = tx_buf;
>>>> +     msg->tx_len = len;
>>>> +     msg->rx_buf = rx_buf;
>>>> +     init_completion(&msg->done);
>>>> +
>>>> +     ret = mbox_send_message(scpi_chan->chan, msg);
>>>> +     if (ret < 0 || !rx_buf)
>>>> +             goto out;
>>>> +
>>>> +     if (!wait_for_completion_timeout(&msg->done, MAX_RX_TIMEOUT))
>>>> +             ret = -ETIMEDOUT;
>>>> +     else
>>>> +             /* first status word */
>>>> +             ret = le32_to_cpu(msg->status);
>>>> +out:
>>>> +     if (ret < 0 && rx_buf) /* remove entry from the list if timed-out */
>>>
>>> So, even with my suggestion that the unique message identifies are
>>> fixed values stored in struct scpi_xfer, we can still have the situation
>>> where we timeout a request, that scpi_xfer then getting used for another
>>> request, and finally the SCP completes the request that we timed out,
>>> which has the same 'unique' value as the later one.
>>>
>>
>> As explained above I can't imagine hitting this condition. I will think
>> more on that again.
>
> I can imagine :-) If we timeout and discard messages, and reuse it's
> unique id, there is always the possibility of this confusion occurring.
> No amount of coding in the kernel can get around that. The only thing
> you can do to get out of this quandary is make assumptions about how the
> SCP firmware behaves.
>

Agreed again.

>>
>>> One way to handle that it to not have any timeout on requests and assume
>>> the firmware isn't buggy.
>>>
>>
>> That's something I can't do ;) based on my experience so far. It's good
>> to assume firmware *can be buggy* and handle all possible errors.
>
> I'm inclined to agree.
>

Thanks :)

>>   Think
>> about the development firmware using this driver. This has been very
>> useful when I was testing the development versions. Even under stress
>> conditions I still see timeouts(very rarely though), so my personal
>> preference is to have them.
>
> But the SCPI protocol unfortunately doesn't seem to allow us to robustly
> handle timeouts. Well, we could keep a list of tokens used in timed out
> messages, and not reuse them. But if, as you say, timeouts do occur,
> then with only 256 available, we are likely to run out.
>

Yes :(

> When I brought this up 9 months ago, it was pointed out that the
> limitation of an 8-bit token for a message because was because the
> protocol designers had were cramming it into the 32-bit value poked into
> the MHU register. The new finished protocol spec doesn't use the MHU
> register any more for this data, but the limitations we're kept by
> specifying the same command data format but just stored in the shared
> memory. Pity the opportunity wasn't taken to expand the token size to
> something that allowed more robust use.
>

IMO may not be true, since the whole redesign was to align something
similar to ACPI PCC, they got influenced too much from it. Even that
has just 64-bit header and they tried to keep the same.

Regards,
Sudeep
