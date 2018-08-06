Return-Path: <SRS0=l8RJ=KV=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH] rcar-csi2: add R8A77980 support
References: <f6edfd44-7b08-e467-3486-795251816187@cogentembedded.com>
 <20180806180250.GD1635@bigcity.dyn.berto.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e2d1e9ea-f524-31f1-1561-2f0363981938@cogentembedded.com>
Date: Mon, 6 Aug 2018 21:24:11 +0300
MIME-Version: 1.0
In-Reply-To: <20180806180250.GD1635@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello!

On 08/06/2018 09:02 PM, Niklas Söderlund wrote:

> On 2018-08-06 19:56:27 +0300, Sergei Shtylyov wrote:
>> Add the R-Car V3H (AKA R8A77980) SoC support to the R-Car CSI2 driver.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> It looks good but before I add my tag I would like to know if you tested 
> this on a V3H?

   No, have not tested the upstream patch, seemed too cumbersome (we did 
test the BSP patch AFAIK).

> In the past extending the R-Car CSI-2 receiver to a new 
> SoC always caught some new corner case :-)
> 
> I don't have access to a V3H myself otherwise I would of course test it 
> myself.

   CSI-2 on the Condor board is connected to a pair of MAX9286 GMSL de-serializers
which are connected to 4 (composite?) connectors... There's supposed to be sensor
chip on the other side, AFAIK...

MBR, Sergei
