From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v1 0/8] Append several fixes and improvements in STM32 DMA
Date: Wed, 4 Apr 2018 11:49:59 +0530
Message-ID: <20180404061958.GH15443@localhost>
References: <1520959327-25760-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520959327-25760-1-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2018 at 05:41:59PM +0100, Pierre-Yves MORDRET wrote:
> This patchset appends several fixes and some improvements for STM32 DMAv2.
> This includes:
>         * Introduce DMA features bitfield
>         * Threshold manages with bitfield feature
>         * Improve memory burst management
>         * Improve DMA IRQ status handling
>         * Fix max items per transfer to match FIFO Size
>         * Properly mask irq bits to avoid overlaping
>         * Fix incomplete configuration in cyclic mode
>         * Fix typo and reported checkpatch warnings

Applied, thanks

-- 
~Vinod
