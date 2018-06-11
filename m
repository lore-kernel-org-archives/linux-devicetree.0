From: Rob Herring <robh@kernel.org>
Subject: Re: [v3, 03/10] dt-binding: ptp_qoriq: add DPAA FMan support
Date: Mon, 11 Jun 2018 12:25:27 -0600
Message-ID: <20180611182527.GA13639@rob-hp-laptop>
References: <20180607092050.46128-1-yangbo.lu@nxp.com>
 <20180607092050.46128-4-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180607092050.46128-4-yangbo.lu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangbo Lu <yangbo.lu@nxp.com>
Cc: netdev@vger.kernel.org, madalin.bucur@nxp.com, Richard Cochran <richardcochran@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 07, 2018 at 05:20:43PM +0800, Yangbo Lu wrote:
> This patch is to add bindings description for DPAA
> FMan 1588 timer, and also remove its description in
> fsl-fman dt-bindings document.
> 
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
> ---
> Changes for v2:
> 	- None.
> Changes for v3:
> 	- None.
> ---
>  Documentation/devicetree/bindings/net/fsl-fman.txt |   25 +-------------------
>  .../devicetree/bindings/ptp/ptp-qoriq.txt          |   15 +++++++++--
>  2 files changed, 13 insertions(+), 27 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
