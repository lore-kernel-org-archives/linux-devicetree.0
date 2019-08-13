From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [v1 2/3] dt/bindings: clk: Add DT bindings for LS1028A Display output interface
Date: Tue, 13 Aug 2019 11:30:05 -0700
Message-ID: <20190813183005.EC13020665@mail.kernel.org>
References: <20190812100216.34459-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812100216.34459-1-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: leoyang.li@nxp.com, liviu.dudau@arm.com, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Wen He (2019-08-12 03:02:16)
> diff --git a/Documentation/devicetree/bindings/clock/fsl,plldig.txt b/Doc=
umentation/devicetree/bindings/clock/fsl,plldig.txt
> new file mode 100644
> index 000000000000..29c5a6117809
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/fsl,plldig.txt
> @@ -0,0 +1,26 @@
> +NXP QorIQ Layerscape LS1028A Display output interface Clock
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Can you convert this to YAML?

> +
> +Required properties:
> +    - compatible: shall contain "fsl,ls1028a-plldig"
> +    - reg: Physical base address and size of the block registers
> +    - #clock-cells: shall contain 1.

As I said in the previous patch, this should probably be 0. Also, please
order this before the driver in the patch series and thread your
messages please. If you use git-send-email this is done for you pretty
easily.

> +    - clocks: a phandle + clock-specifier pairs, here should be
> +    specify the reference clock of the system
> +
> +
