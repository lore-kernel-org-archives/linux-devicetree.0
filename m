Return-Path: <SRS0=PuHC=M6=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779{7|8}0: add TMU support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <2abe82e7-c7b2-7696-402d-1140d2ed4006@cogentembedded.com>
Message-ID: <bad4f6a1-9f7b-dc17-7803-b6478b09c976@cogentembedded.com>
Date: Thu, 18 Oct 2018 21:32:27 +0300
MIME-Version: 1.0
In-Reply-To: <2abe82e7-c7b2-7696-402d-1140d2ed4006@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello!

On 09/24/2018 11:13 PM, Sergei Shtylyov wrote:

> Describe TMUs in the R8A779{7|8}0 device trees.
> 
> Based on the original (and large) patches by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This  patch is against the 'renesas-devel-20180924-v4.19-rc5' branch of
> Simon Horman's 'renesas.git' repo.
> 
> Changes in version 2:
> - fixed up the "compatible" prop in the R8A77970 TMU3/4 node;
> - removed the 4th interrupt from the R8A77970 TMU4 node and the R8A77980 TMU1
>   node.
> 
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi |   65 ++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   65 ++++++++++++++++++++++++++++++
>  2 files changed, 130 insertions(+)

   I thought we had a consensus about TMU? Why this patch is marked as superseded
in the patchwork?

MBR, Sergei
