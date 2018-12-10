Return-Path: <SRS0=+yaY=OT=verge.net.au=horms@kernel.org>
Date: Mon, 10 Dec 2018 14:30:21 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/2] Add Initial Device Tree for RZ/A2
Message-ID: <20181210133020.4r4upvharhbugguw@verge.net.au>
References: <20181205214449.52165-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181205214449.52165-1-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 05, 2018 at 04:44:47PM -0500, Chris Brandt wrote:
> Add a Device Tree for RZ/A2 and the existing eval board.
> 
> Once these get approved, I'll start piling on the other drivers in
> another patch series.
> 
> 
> NOTE:
> Since Rob is in the middle of converting shmobile.txt to renesas.yaml,
> I'll wait till that is finisehd before I add this RZ/A2M EVB board.

FWIIW, that is now finished.

> Chris Brandt (2):
>   ARM: dts: r7s9210: Initial SoC device tree
>   ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
> 
>  arch/arm/boot/dts/Makefile             |   1 +
>  arch/arm/boot/dts/r7s9210-rza2mevb.dts |  98 ++++++++++++++++
>  arch/arm/boot/dts/r7s9210.dtsi         | 204 +++++++++++++++++++++++++++++++++
>  3 files changed, 303 insertions(+)
>  create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts
>  create mode 100644 arch/arm/boot/dts/r7s9210.dtsi
> 
> -- 
> 2.16.1
> 
