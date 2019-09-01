From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v7 0/7] qcom: add OCMEM support
Date: Sun, 1 Sep 2019 17:40:45 -0400
Message-ID: <20190901214045.GA14321@onstation.org>
References: <20190823121637.5861-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190823121637.5861-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robdclark@gmail.com, sean@poorly.run, bjorn.andersson@linaro.org
Cc: agross@kernel.org, robh+dt@kernel.org, airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, jcrouse@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Rob C / Sean P,

On Fri, Aug 23, 2019 at 05:16:30AM -0700, Brian Masney wrote:
> This patch series adds support for Qualcomm's On Chip MEMory (OCMEM)
> that is needed in order to support some a3xx and a4xx-based GPUs
> upstream. This is based on Rob Clark's patch series that he submitted
> in October 2015 and I am resubmitting updated patches with his
> permission. See the individual patches for the changelog.

I talked to Bjorn in person at the Embedded Linux Conference over a
week ago about this series. He thinks that this series should go through
your tree. I assume it's too late for the upcoming merge window, which
is fine. I just want to make sure that this series gets picked up for
the following merge window.

I just sent out a fix for a compiler error on MIPS as a separate patch:
https://lore.kernel.org/lkml/20190901213037.25889-1-masneyb@onstation.org/

Brian
