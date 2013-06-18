From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] DMA: shdma: add DT support
Date: Tue, 18 Jun 2013 18:55:27 +0200
Message-ID: <201306181855.27325.arnd@arndb.de>
References: <Pine.LNX.4.64.1306181813380.30844@axis700.grange>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1306181813380.30844@axis700.grange>
Sender: linux-sh-owner@vger.kernel.org
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: linux-sh@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Vinod Koul <vinod.koul@intel.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Simon Horman <horms@verge.net.au>
List-Id: devicetree@vger.kernel.org

On Tuesday 18 June 2013, Guennadi Liakhovetski wrote:
> This patch adds Device Tree support to the shdma driver. No special DT
> properties are used, only standard DMA DT bindings are implemented. Since
> shdma controllers reside on SoCs, their configuration is SoC-specific and
> shall be passed to the driver from the SoC platform data, using the
> auxdata procedure.
> 
> Signed-off-by: Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
