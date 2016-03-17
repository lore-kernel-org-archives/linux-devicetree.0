From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 3/7] QE: Add uqe_serial document to bindings
Date: Thu, 17 Mar 2016 11:27:49 -0500
Message-ID: <20160317162749.GA7872@rob-hp-laptop>
References: <1457486494-11377-1-git-send-email-qiang.zhao@nxp.com>
 <1457486494-11377-3-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457486494-11377-3-git-send-email-qiang.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhao Qiang <qiang.zhao@nxp.com>
Cc: oss@buserror.net, leoyang.li@nxp.com, xiaobo.xie@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 09, 2016 at 09:21:30AM +0800, Zhao Qiang wrote:
> Add uqe_serial document to
> Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> 
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---
> Changes for v2
> 	- modify tx/rx-clock-name specification
> Changes for v3
> 	- NA 
> Changes for v4
> 	- drop device_type
> 	- modify to SoC specific compatible 
> Changes for v5
> 	- add fsl to compatible as prefix 
> 
>  .../bindings/powerpc/fsl/cpm_qe/uqe_serial.txt         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt

Acked-by: Rob Herring <robh@kernel.org>
