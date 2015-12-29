From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] Documentation: fsl-quadspi: Add optional properties
Date: Tue, 29 Dec 2015 12:34:58 -0600
Message-ID: <20151229183458.GG12450@rob-hp-laptop>
References: <1450954863-7540-1-git-send-email-yao.yuan@freescale.com>
 <1450954863-7540-4-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450954863-7540-4-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuan Yao <yao.yuan@freescale.com>
Cc: mark.rutland@arm.com, pawel.moll@arm.com, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yao.yuan@nxp.com
List-Id: devicetree@vger.kernel.org

On Thu, Dec 24, 2015 at 07:01:03PM +0800, Yuan Yao wrote:
> Add optional properties for QSPI:
> big-endian
> if the register is big endian on this platform.
> 
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
