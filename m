Return-Path: <SRS0=aylg=FT=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH] DT: net: renesas,ravb: document R8A77980 bindings
References: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
 <ad5fce6e-81df-f898-387e-3c40417fe691@cogentembedded.com>
 <20180224.215317.982381501908572398.davem@davemloft.net>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <92bde878-2de5-a56f-8074-c1b1313a8c23@cogentembedded.com>
Date: Sun, 25 Feb 2018 11:48:31 +0300
MIME-Version: 1.0
In-Reply-To: <20180224.215317.982381501908572398.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: robh+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello!

On 2/25/2018 5:53 AM, David Miller wrote:

>>> Renesas R-Car V3H (R8A77980) SoC has the R-Car gen3 compatible EtherAVB >>> device, so document the SoC specific bindings.>>>>>> Signed-off-by: 
Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>>>>>>> --->>> The patch is 
against DaveM's 'net-next.git' repo but I wouldn't mind if it's>>> applied to 
'net.git' instead. :-)>>>>     David, I see this patch was marked as "not 
applicable" in patchwork. Why, because>> it was posted during the merge 
window?> > No because I thought the relevant architecture tree would take a 
mere> DT update.
    Well, so far the binding updates have been merged via the appropriate 
driver subsystem trees, look at e.g. this patch:

https://patchwork.ozlabs.org/patch/813037/

MBR, Sergei
