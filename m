Return-Path: <SRS0=CJ3g=NC=linuxfoundation.org=gregkh@kernel.org>
Date: Mon, 22 Oct 2018 09:29:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: using interrupt controller dt-bindings macros in Non GPL dts
 files
Message-ID: <20181022082906.GE7068@kroah.com>
References: <HE1PR0402MB3323967BD6C0E11C738BFF38F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HE1PR0402MB3323967BD6C0E11C738BFF38F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
To: Pankaj Bansal <pankaj.bansal@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Varun Sethi <V.Sethi@nxp.com>, Udit Kumar <udit.kumar@nxp.com>, Leo Li <leoyang.li@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Oct 22, 2018 at 03:48:28AM +0000, Pankaj Bansal wrote:
> Hi All,
> 
> I have a query about include/dt-bindings/interrupt-controller/irq.h and include/dt-bindings/interrupt-controller/arm-gic.h files.
> I would like to use these header files in NON-GPL (X11 Licensed) dts/dtsi files, to use the macros defined in these header files in our dts/dtsi files.
> 
>   1.  Does including the GPL header files for macros (NON executable code) in NON-GPL files, causes the license of NON-GPL file to be contaminated with GPL code?

Why are you asking developers legal questions?  Would you ask us medical
questions as well?  :)

Seriously, go talk to your corporate lawyers, they know the answers to
this, it's not very complex.

thanks,

greg k-h
