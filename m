From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: ls1021a: Remove unused properties from
 QSPI node
Date: Fri, 22 Mar 2019 10:21:15 +0800
Message-ID: <20190322022114.GA12513@dragon>
References: <20190320143800.3555-1-frieder.schrempf@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190320143800.3555-1-frieder.schrempf@kontron.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2019 at 02:38:02PM +0000, Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> After switching to the new FSL QSPI driver the properties
> 'fsl,qspi-has-second-chip' and 'big-endian' are not used anymore.
> 
> The driver now uses the 'reg' property to determine the bus and
> the chipselect. The endianness is selected by the driver depending
> on which SoC is used.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied both, thanks.
