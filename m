Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Mar 2018 07:48:29 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: ifc: Fix the unit address format in the
 examples
Message-ID: <20180318124829.kiiei2234jndt3fb@rob-hp-laptop>
References: <1520701581-3650-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520701581-3650-1-git-send-email-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, Mar 10, 2018 at 02:06:21PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> DTC warnings will be seen if these examples are used in a real dts file 
> due to a mismatch in the unit address notation.
> 
> Align the unit address notation to what is done in the real dts files
> as per commit f81d7af79575 ("arm64: dts: fsl: fix ifc simple-bus unit
> address format warnings")
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Hi,
> 
> Commit f81d7af79575 ("arm64: dts: fsl: fix ifc simple-bus unit address
> format warnings") is present in Shawn Guo's tree.

This "fix" is wrong. Memory controllers with chip selects should have 
the chip select in the unit-address. The correct fix here is you should drop 
"simple-bus".

Rob
