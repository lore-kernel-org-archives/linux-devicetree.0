From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: ufs: ti,j721e-ufs.yaml: Add binding
 for TI UFS wrapper
Date: Mon, 14 Oct 2019 13:09:47 -0500
Message-ID: <20191014180947.GA881@bogus>
References: <20191010083357.28982-1-vigneshr@ti.com>
 <20191010083357.28982-2-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191010083357.28982-2-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, jejb@linux.ibm.com, Martin K Petersen <martin.petersen@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, Janek Kotas <jank@cadence.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, nsekhar@ti.com
List-Id: devicetree@vger.kernel.org

On Thu, 10 Oct 2019 14:03:56 +0530, Vignesh Raghavendra wrote:
> Add binding documentation of TI wrapper for Cadence UFS Controller.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> 
> v2:
> Define Cadence UFS controller as child node of the wrapper as suggested
> by Rob H
> 
>  .../devicetree/bindings/ufs/ti,j721e-ufs.yaml | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
