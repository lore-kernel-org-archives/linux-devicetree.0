From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] Documentation: fsl-mc: binding updates for MSIs,
 ranges, PHYs
Date: Mon, 4 Apr 2016 00:16:05 -0500
Message-ID: <20160404051605.GK17806@rob-hp-laptop>
References: <1459544069-12852-1-git-send-email-stuart.yoder@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459544069-12852-1-git-send-email-stuart.yoder@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Yoder <stuart.yoder@nxp.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, german.rivera@freescale.com, Stuart Yoder <stuart.yoder@freescale.com>, linux-kernel@vger.kernel.org, leoyang.li@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, Apr 01, 2016 at 03:54:29PM -0500, Stuart Yoder wrote:
> From: Stuart Yoder <stuart.yoder@freescale.com>
> 
> -The Freescale Management Complex and all associated objects
>  use message interrupts, and thus an msi-parent is required.
> 
> -Define a ranges property to specify the mapping between
>  the MC address space and the system address space.
> 
> -The fsl-mc node may optionally have dpmac sub-nodes that describe
>  the relationship between the Ethernet MACs which belong to the MC
>  and the Ethernet PHYs on the system board.
> 
> Signed-off-by: Stuart Yoder <stuart.yoder@nxp.com>
> Acked-by: J. German Rivera <German.Rivera@nxp.com>
> ---
>  .../devicetree/bindings/misc/fsl,qoriq-mc.txt      |   81 +++++++++++++++++++-
>  1 file changed, 80 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
