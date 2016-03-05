From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/7] bindings: move cpm_qe binding from powerpc/fsl to
 soc/fsl
Date: Fri, 4 Mar 2016 22:25:41 -0600
Message-ID: <20160305042541.GE13525@rob-hp-laptop>
References: <1456816183-22340-1-git-send-email-qiang.zhao@nxp.com>
 <1456816183-22340-4-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456816183-22340-4-git-send-email-qiang.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhao Qiang <qiang.zhao@nxp.com>
Cc: oss@buserror.net, leoyang.li@nxp.com, xiaobo.xie@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 01, 2016 at 03:09:40PM +0800, Zhao Qiang wrote:
> cpm_qe is supported on both powerpc and arm.
> and the QE code has been moved from arch/powerpc into
> drivers/soc/fsl, so move cpm_qe binding from powerpc/fsl
> to soc/fsl
> 
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---

I already acked this. In the future, please add acks on subsequent revs.

Acked-by: Rob Herring <robh@kernel.org>
