Return-Path: <SRS0=avNg=QA=nvidia.com=talho@kernel.org>
Subject: Re: [PATCH V2 1/4] firmware: tegra: reword messaging terminology
References: <1548073731-6449-1-git-send-email-talho@nvidia.com>
 <1548073731-6449-2-git-send-email-talho@nvidia.com>
 <2c59d8e4-b348-851f-f98e-74b80b8a45a7@nvidia.com>
From: Timo Alho <talho@nvidia.com>
Message-ID: <d4d6b5e4-4c69-239b-5bbc-b3e2bb8ff574@nvidia.com>
Date: Thu, 24 Jan 2019 14:25:32 +0200
MIME-Version: 1.0
In-Reply-To: <2c59d8e4-b348-851f-f98e-74b80b8a45a7@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jon Hunter <jonathanh@nvidia.com>, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


Hi Jon,

On 24.1.2019 13.33, Jon Hunter wrote:
> 
> On 21/01/2019 12:28, Timo Alho wrote:
>> As a preparatory change to refactor bpmp driver to support other than
>> t186/t194 chip generations, reword and slightly refactor some of the
>> functions to better match with what is actually happening in the
>> wire-level protocol.
>>
>> The communication with bpmp is essentially a Remote Procedure Call
>> consisting of "request" and "response". Either side (BPMP or CPU) can
>> initiate the communication. The state machine for communication
>> consists of following steps (from Linux point of view):
>>
>> Linux initiating the call:
>>   1) check that channel is free to transmit a request (is_req_channel_free)
>>   2) copy request message payload to shared location
>>   3) post the request in channel (post_req)
>>   4) notify BPMP that channel state has been updated (ring_doorbell)
>>   5) wait for response (is_resp_ready)
>>   6) copy response message payload from shared location
>>   7) acknowledge the response in channel (ack_resp)
>>
>> BPMP initiating the call:
>>   1) wait for request (is_req_ready)
>>   2) copy request message payload from shared location
>>   3) acknowledge the request in channel (ack_req)
>>   4) check that channel is free to transmit response (is_resp_channel_free)
>>   5) copy response message payload to shared location
>>   6) post the response message to channel (post_resp)
>>   7) notify BPMP that channel state has been updated (ring_doorbell)
>>
>> Signed-off-by: Timo Alho <talho@nvidia.com>
>> ---
>>   drivers/firmware/tegra/bpmp.c | 106 +++++++++++++++++++++++++++---------------
>>   1 file changed, 68 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
>> index 689478b..af123de 100644
>> --- a/drivers/firmware/tegra/bpmp.c
>> +++ b/drivers/firmware/tegra/bpmp.c
>> @@ -96,7 +96,7 @@ static bool tegra_bpmp_message_valid(const struct tegra_bpmp_message *msg)
>>   	       (msg->rx.size == 0 || msg->rx.data);
>>   }
>>   
>> -static bool tegra_bpmp_master_acked(struct tegra_bpmp_channel *channel)
>> +static bool tegra_bpmp_is_resp_ready(struct tegra_bpmp_channel *channel)
>>   {
>>   	void *frame;
>>   
>> @@ -111,7 +111,12 @@ static bool tegra_bpmp_master_acked(struct tegra_bpmp_channel *channel)
>>   	return true;
>>   }
>>   
>> -static int tegra_bpmp_wait_ack(struct tegra_bpmp_channel *channel)
>> +static bool tegra_bpmp_is_req_ready(struct tegra_bpmp_channel *channel)
>> +{
>> +	return tegra_bpmp_is_resp_ready(channel);
>> +}
>> +
> 
> Any reason not to call this something more generic like
> tegra_bpmp_is_message_ready()? I am just wondering if you need to have
> this additional function and if it can be avoid. However, not a big
> deal, so completely your call.

It is true that it looks bit nonsensical in this patch. However, I made 
it like this in the anticipation of the follow up patches -- the use of 
separate req_ready() and resp_ready() becomes obvious once t210 bpmp 
support is added (where req and resp have different implementation).

So, I'd just leave it as is and I see also Acked this patch already. Thanks.

BR,
Timo
