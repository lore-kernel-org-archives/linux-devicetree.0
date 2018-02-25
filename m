Return-Path: <SRS0=pNZn=FT=davemloft.net=davem@kernel.org>
Date: Sat, 24 Feb 2018 21:53:17 -0500 (EST)
Message-Id: <20180224.215317.982381501908572398.davem@davemloft.net>
Subject: Re: [PATCH] DT: net: renesas,ravb: document R8A77980 bindings
From: David Miller <davem@davemloft.net>
In-Reply-To: <ad5fce6e-81df-f898-387e-3c40417fe691@cogentembedded.com>
References: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
	<ad5fce6e-81df-f898-387e-3c40417fe691@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
To: sergei.shtylyov@cogentembedded.com
Cc: robh+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 24 Feb 2018 21:01:15 +0300

> On 02/01/2018 11:13 PM, Sergei Shtylyov wrote:
> 
>> Renesas R-Car V3H (R8A77980) SoC has the R-Car gen3 compatible EtherAVB
>> device, so document the SoC specific bindings.
>> 
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> 
>> ---
>> The patch is against DaveM's 'net-next.git' repo but I wouldn't mind if it's
>> applied to 'net.git' instead. :-)
> 
>    David, I see this patch was marked as "not applicable" in patchwork. Why, because
> it was posted during the merge window?

No because I thought the relevant architecture tree would take a mere
DT update.
