From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 1/3] ARM: dts: imx6: Add Savageboard common file
Date: Mon, 2 Jan 2017 15:41:56 +0800
Message-ID: <20170102074155.GG20956@dragon>
References: <20161209010436.7994-1-woogyom.kim@gmail.com>
 <20161209010436.7994-2-woogyom.kim@gmail.com>
 <20170102065239.GC20956@dragon>
 <450d89c7-7459-6369-3a07-cc60d70de0db@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <450d89c7-7459-6369-3a07-cc60d70de0db@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <woogyom.kim@gmail.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 02, 2017 at 04:31:07PM +0900, Milo Kim wrote:
> 
> On 01/02/2017 03:52 PM, Shawn Guo wrote:
> >>+	panel {
> >>+		compatible = "avic, tm097tdh02", "hannstar,hsd100pxn1";
> >"avic, tm097tdh02" is an undocumented compatible.
> >
> 
> AVIC TM097TDH02 panel is compatible with Hannstar HSD100PXN1, so I
> reuse it. It's the same rule as the usage of imx6q I2C controller.
> 
> 	i2c2: i2c@021a4000 {
> 		compatible = "fsl,imx6q-i2c", "fsl,imx21-i2c";
> 	};

Okay.  Drop the space in the middle of the compatible.

Shawn
