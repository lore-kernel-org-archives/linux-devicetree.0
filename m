From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/4] Documentation: fsl-quadspi: Add optional
 properties
Date: Thu, 21 Jan 2016 17:10:39 -0600
Message-ID: <20160121231039.GA2985@rob-hp-laptop>
References: <1453360158-34236-1-git-send-email-yao.yuan@freescale.com>
 <1453360158-34236-4-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453360158-34236-4-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuan Yao <yao.yuan@freescale.com>
Cc: mark.rutland@arm.com, pawel.moll@arm.com, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yao.yuan@nxp.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 21, 2016 at 03:09:18PM +0800, Yuan Yao wrote:
> Add optional properties for QSPI:
> big-endian
> if the register is big endian on this platform.
> 
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> ---
> Changed in v3:
> No changes.
> 
> Changed in v2:
> Update my email to <yao.yuan@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
