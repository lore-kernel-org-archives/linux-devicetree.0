From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/7] QE: Add ucc hdlc document to bindings
Date: Fri, 4 Mar 2016 22:25:25 -0600
Message-ID: <20160305042525.GC13525@rob-hp-laptop>
References: <1456816183-22340-1-git-send-email-qiang.zhao@nxp.com>
 <1456816183-22340-2-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456816183-22340-2-git-send-email-qiang.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhao Qiang <qiang.zhao@nxp.com>
Cc: oss@buserror.net, leoyang.li@nxp.com, xiaobo.xie@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 01, 2016 at 03:09:38PM +0800, Zhao Qiang wrote:
> Add ucc hdlc document to
> Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
> 
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---
> Changes for v2
> 	- use ucc-hdlc instead of ucc_hdlc
> 	- add more information to properties.
> Changes for v3
> 	- use fsl,tx-timeslot-mask instead of fsl,tx-timeslot 
> 	- use fsl,rx-timeslot-mask instead of fsl,rx-timeslot 
> 	- add more info
> 
>  .../bindings/powerpc/fsl/cpm_qe/network.txt        | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
