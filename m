Return-Path: <SRS0=+6fA=MW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42088 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbeJJSNt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Oct 2018 14:13:49 -0400
Received: by mail-lj1-f195.google.com with SMTP id y71-v6so4434644lje.9
        for <devicetree@vger.kernel.org>; Wed, 10 Oct 2018 03:52:13 -0700 (PDT)
Date: Wed, 10 Oct 2018 12:52:10 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add thermal support
Message-ID: <20181010105210.GB24305@bigcity.dyn.berto.se>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <90451643-6beb-e61f-912c-3adff4c943cb@cogentembedded.com>
 <20181010083645.sugql3zp4ttj2fll@verge.net.au>
 <43384bfd-bea4-6f5b-0839-fb111427557a@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43384bfd-bea4-6f5b-0839-fb111427557a@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

On 2018-10-10 13:47:36 +0300, Sergei Shtylyov wrote:
> On 10/10/2018 11:36 AM, Simon Horman wrote:
> 
> >> Describe THS/CIVM in the R8A77980 device trees.
> >>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>
> >> ---
> >> This patch is against the 'renesas-devel-20181008-v4.19-rc7' tag of Simon
> >> Horman's 'renesas.git' repo.
> >>
> >> The thermal driver/bindings patches have been just posted...
> >>
> >>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   38 ++++++++++++++++++++++++++++++
> > 
> > Thanks Sergei, one minor nit from me below.
> > 
> > Niklas, I'd value your review of this patch.
> > 
> >>  1 file changed, 38 insertions(+)
> >>
> >> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >> ===================================================================
> >> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >> @@ -330,6 +330,19 @@
> >>  			#power-domain-cells = <1>;
> >>  		};
> >>  
> >> +		thermal: thermal@e6198000 {
> > 
> > "tsc:" would be consistent with other R-Car Gen 3 dtsi that
> > describe this device.
> 
>    There's no consistency even among those: R8A779{5|6}0 use "tsc:", 
> R8A77995 uses "thermal:"... :-)

D3 (R8A77995) uses the Gen2 thermal driver while V3H uses Gen3 thermal 
driver, so there is some consistency and I think we should aim to make 
it as consistent as possible :-)

> 
> [...]
> 
> MBR, Sergei

-- 
Regards,
Niklas S�derlund
