Return-Path: <SRS0=DCom=NL=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: condor: switch from EtherAVB to
 GEther
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <4f9e79ca-5d61-8dd4-fe79-42e8f7562f90@cogentembedded.com>
 <20181031143042.3j4ohumfpxmn7xdu@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0070b215-cd49-edcb-8abc-79e7150589ec@cogentembedded.com>
Date: Wed, 31 Oct 2018 20:29:50 +0300
MIME-Version: 1.0
In-Reply-To: <20181031143042.3j4ohumfpxmn7xdu@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Valentine Barshak <valentine.barshak@cogentembedded.com>
List-ID: <devicetree@vger.kernel.org>

On 10/31/2018 5:30 PM, Simon Horman wrote:

>> The "official" Condor boards have always been wired to mount NFS via
>> GEther, not EtherAVB -- the boards resoldered for EtherAVB were local
>> to Cogent Embedded, so we've been having an unpleasant situation where
>> a "normal" Condor board still can't mount NFS (unless an EtherAVB PHY
>> extension board is plugged in). Switch from EtherAVB to GEther at last!
>>
>> Fixes: 8091788f3d38 ("arm64: dts: renesas: condor: add EtherAVB support")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks, applied for v4.21.

    Wait, this was intended as a fix for 4.20...

MBR, Sergei
