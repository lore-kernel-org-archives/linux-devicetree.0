Return-Path: <SRS0=QFzW=OX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17833 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbeLNK1u (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Dec 2018 05:27:50 -0500
Subject: Re: [PATCH 1/4] firmware: tegra: reword messaging terminology
References: <1544643088-17678-1-git-send-email-talho@nvidia.com>
 <1544643088-17678-2-git-send-email-talho@nvidia.com>
 <20181212201536.GA31765@sdt>
From: Timo Alho <talho@nvidia.com>
Message-ID: <61cf405f-5295-af0c-f52f-7e85914f57ca@nvidia.com>
Date: Fri, 14 Dec 2018 12:27:47 +0200
MIME-Version: 1.0
In-Reply-To: <20181212201536.GA31765@sdt>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Sivaram Nair <sivaramn@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Sivaram,

On 12.12.2018 22.15, Sivaram Nair wrote:
> On Wed, Dec 12, 2018 at 09:31:25PM +0200, Timo Alho wrote:
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
>>   4) notify BPMP that channel state has been update (ring_doorbell)
> 
> *updated*
> 

Thanks for taking a look of the whole series. I'll fix the things you 
pointed out on next version, after receiving more feedback.
