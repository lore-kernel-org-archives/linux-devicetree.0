From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 0/4] dmaengine: qcom: bam_dma: fixes for remotely
 controlled bam
Date: Wed, 17 Jan 2018 21:29:31 +0530
Message-ID: <20180117155930.GO18649@localhost>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
 <20180117101835.GM18649@localhost>
 <d40a9ecb-c620-034a-8e88-e9254bb95305@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d40a9ecb-c620-034a-8e88-e9254bb95305@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com
List-Id: devicetree@vger.kernel.org

On Wed, Jan 17, 2018 at 10:55:34AM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 17/01/18 10:18, Vinod Koul wrote:
> >On Tue, Jan 16, 2018 at 07:02:32PM +0000, srinivas.kandagatla@linaro.org wrote:
> >>From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>
> >>Hi Andy,
> >>
> >>I did hit few issues while trying out SLIMBus BAM on DB820c, this BAM instance
> >>is remotely controlled and powered up after ADSP is booted using QMI commands.
> >
> >What do you mean by "remotely controlled" in this series?
> 
> DMA controller is controlled by the remote processor, which is a DSP in this
> case.
> Linux side is in remote mode in this setup, this can setup transfer
> descriptors and start/stop a transfer. But all the initialization/powerup
> part will be done in the remote processor.

Yeah that was my guess too. So in this case does linux see these
controllers/channels, i would presume no...

-- 
~Vinod
