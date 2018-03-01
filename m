From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v3 0/5] dmaengine: qcom: bam_dma: fixes for remotely
 controlled bam
Date: Thu, 1 Mar 2018 14:14:56 +0530
Message-ID: <20180301084456.GG15443@localhost>
References: <20180215122511.13517-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180215122511.13517-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org
Cc: andy.gross@linaro.org, dmaengine@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, david.brown@linaro.org, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com
List-Id: devicetree@vger.kernel.org

On Thu, Feb 15, 2018 at 12:25:06PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Hi Andy,
> 
> I did hit few issues while trying out SLIMBus BAM on DB820c, this BAM instance
> is remotely controlled and powered up after ADSP is booted using QMI commands.
> 
> Firstly some of the master registers are written even when the BAM is remotely
> controlled, and secondly reading registers when bam is not ready yet.
> 
> These 4 patches address these issues, there are few more issues like doing PM
> in simillar usecase, these will be addressed soon.

Applied all, thanks

-- 
~Vinod
