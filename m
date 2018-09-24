Return-Path: <SRS0=X0Lk=MG=verge.net.au=horms@kernel.org>
Date: Mon, 24 Sep 2018 17:32:19 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779{7|8}0: add TPU support
Message-ID: <20180924153218.hixwavvtgqvd54ft@verge.net.au>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <0d1a6380-e5f0-35a2-d421-f3c5bdd04a75@cogentembedded.com>
 <20180924090744.6nzzzaw5vqiblebs@verge.net.au>
 <a9a511b9-5919-ba99-8009-fbb3d7c0f6f5@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9a511b9-5919-ba99-8009-fbb3d7c0f6f5@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 24, 2018 at 05:44:22PM +0300, Sergei Shtylyov wrote:
> On 09/24/2018 12:07 PM, Simon Horman wrote:
> 
> >> Describe TPU in the R8A779{7|8}0 device trees.
> >>
> >> Based on the original (and large) patches by Vladimir Barinov.
> >>
> >> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > Thanks, this looks good but I'd like to see the binding update
> > before accepting this.
> 
>    See it merged, you mean? Because the binding updates have been posted
>    before v2, and I'm seeing them in patchwork...

See them Acked.

Somehow I couldn't find them this morning but I see them now.

Could you respond to Geert's comment on this patch regarding interrupts?
