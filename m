From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 6/6] drm/msm/gpu: add ocmem init/cleanup
 functions
Date: Wed, 19 Jun 2019 12:21:50 -0600
Message-ID: <20190619182149.GD17590@jcrouse1-lnx.qualcomm.com>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-7-masneyb@onstation.org>
 <20190619181526.GC17590@jcrouse1-lnx.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190619181526.GC17590@jcrouse1-lnx.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, daniel@ffwll.ch, freedreno@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2019 at 12:15:26PM -0600, Jordan Crouse wrote:
> On Sun, Jun 16, 2019 at 09:29:30AM -0400, Brian Masney wrote:
> > The files a3xx_gpu.c and a4xx_gpu.c have ifdefs for the OCMEM support
> > that was missing upstream. Add two new functions (adreno_gpu_ocmem_init
> > and adreno_gpu_ocmem_cleanup) that removes some duplicated code. We also
> > need to change the ifdef check for CONFIG_MSM_OCMEM to CONFIG_QCOM_OCMEM
> > now that OCMEM support is upstream.

Sorry for reviewing v1 when there was a v2 in flight. That will teach me to not
keep up on my email. I think you caught most of this, but a few things I still
saw.

<snip>

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
