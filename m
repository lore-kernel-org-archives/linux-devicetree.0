Return-Path: <SRS0=7BaO=KP=verge.net.au=horms@kernel.org>
Date: Tue, 31 Jul 2018 12:33:20 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 0/2] ARM: shmobile: Add support for RZ/A2
Message-ID: <20180731103320.juh73clsn6p62twg@verge.net.au>
References: <20180727165333.60598-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180727165333.60598-1-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 27, 2018 at 11:53:31AM -0500, Chris Brandt wrote:
> Introduce RZ/A2 (R7S9210) as an SoC that can be selected.
> 
> There is no DT mainlined yet, so this is what the entry would look
> like for the BSID register:
> 
> 	bsid: chipid@fcfe8004 {
> 		compatible = "renesas,bsid";
> 		reg = <0xfcfe8004 4>;
> 	};
> 
> 
> Chris Brandt (2):
>   soc: renesas: identify RZ/A2
>   dt-bindings: arm: Document RZ/A2 SoC DT bindings

Thanks Chris,

applied for v4.20.
