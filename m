Return-Path: <SRS0=MSe8=TG=verge.net.au=horms@kernel.org>
Date: Mon, 6 May 2019 16:02:45 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/7] dts: r7s9210: Add RZ/A2 devices
Message-ID: <20190506140245.obsc5g44uvh6awxb@verge.net.au>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430132309.12473-1-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 30, 2019 at 08:23:02AM -0500, Chris Brandt wrote:
> So while I added RZ/A2 drivers a while back, I never actually added them
> all to the device tree.
> 
> This series adds everything that is currently supported.
> 
> Chris Brandt (7):
>   ARM: dts: r7s9210: Add RSPI
>   ARM: dts: r7s9210: Add Ethernet support
>   dt-bindings: i2c: riic: document r7s9210 support
>   ARM: dts: r7s9210: Add RIIC support
>   ARM: dts: r7s9210: Add SDHI support
>   ARM: dts: r7s9210-rza2mevb: Add Ethernet support
>   ARM: dts: r7s9210-rza2mevb: Add SDHI support

Thanks Chris,

I have applied the dts patches for inclusion in v5.3.
Please consider a follow-up patch to add an alias as
per Geert's feedback on the Ethernet support patch.
