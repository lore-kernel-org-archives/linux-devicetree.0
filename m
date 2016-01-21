From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/4] Documentation: fsl-quadspi: Add fsl, ls2080a-qspi
 compatible string
Date: Thu, 21 Jan 2016 17:11:38 -0600
Message-ID: <20160121231138.GA3766@rob-hp-laptop>
References: <1453360158-34236-1-git-send-email-yao.yuan@freescale.com>
 <1453360158-34236-2-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453360158-34236-2-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuan Yao <yao.yuan@freescale.com>
Cc: mark.rutland@arm.com, pawel.moll@arm.com, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yao.yuan@nxp.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 21, 2016 at 03:09:16PM +0800, Yuan Yao wrote:
> new compatible string: "fsl,ls2080a-qspi".
> 
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> ---
> Changed in v3:
> Add the modifier for new compatible string like:
> "fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi"
> 
> Changed in v2:
> Update my email to <yao.yuan@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
