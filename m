From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/10][v3] dt-bindings: fsl: updates bindings for some
 SoC-specific devices
Date: Fri, 23 Sep 2016 08:22:35 -0500
Message-ID: <20160923132235.GA15732@rob-hp-laptop>
References: <1473754203-22970-1-git-send-email-shh.xie@gmail.com>
 <1473754203-22970-3-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473754203-22970-3-git-send-email-shh.xie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shh.xie@gmail.com
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com, shawnguo@kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, Shaohui Xie <Shaohui.Xie@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 13, 2016 at 04:09:55PM +0800, shh.xie@gmail.com wrote:
> From: Shaohui Xie <Shaohui.Xie@nxp.com>

Again, subject could still be more specific. Aim to make it unique 
enough that the same subject could never appear again.
 
> SCFG and DCFG are SoC-specific devices can be found on SoCs like LS1021A,
> LS1043A and LS1046A, this patch updates bindings for SCFG and DCFG to
> reflect more SoCs.
> 
> Signed-off-by: Shaohui Xie <Shaohui.Xie@nxp.com>
> ---
> changes in V3:
> 1. added supported <chip>s.
> 
> change in V2:
> 1. new patch.
> 
>  Documentation/devicetree/bindings/arm/fsl.txt | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
