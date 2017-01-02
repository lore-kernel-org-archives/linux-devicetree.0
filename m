From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 0/9] dmaengine: stm32-dma: Bug fixes and improvements
 series
Date: Mon, 2 Jan 2017 09:44:34 +0530
Message-ID: <20170102041433.GM3573@localhost>
References: <1481636451-27863-1-git-send-email-cedric.madianga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1481636451-27863-1-git-send-email-cedric.madianga@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 13, 2016 at 02:40:42PM +0100, M'boumba Cedric Madianga wrote:
> This patchset adds bug fixes reported by devices using STM32 DMA and some
> improvements mainly linked to dmaengine framework evolution.

So you should order fixes first and then new additions.

Fixes go in for current release whereas the rest for next one.

I have applied two to fixes and rest to updated, patch 5 didn't apply, please
resend that one.

-- 
~Vinod
