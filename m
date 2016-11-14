From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] dmaengine: nbpfaxi: add optional max-burst property for
 memory reads/writes
Date: Mon, 14 Nov 2016 10:08:34 +0530
Message-ID: <20161114043834.GP3000@localhost>
References: <1477315755-4783-1-git-send-email-niklass@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477315755-4783-1-git-send-email-niklass@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@axis.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Niklas Cassel <niklass@axis.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 24, 2016 at 03:29:15PM +0200, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@axis.com>
> 
> Due to a hardware bug, reading memory (from the Accelerator Coherency Port)
> with a burst size equal to the maximum burst size allowed by the DMA
> hardware's buffer size will cause a hardware hang on the ARTPEC-6 SoC,
> where the only solution is a manual power cycle.
> On ARTPEC-6, this hardware bug does not trigger when writing memory (to the
> Accelerator Coherency Port) with a burst size equal to the maximum burst
> size allowed by the DMA hardware's buffer size.
> 
> To avoid this hardware hang, introduce a new optional max-burst property
> for memory reads. For completeness, also introduce a max-burst property for
> memory writes.

Applied, thanks

-- 
~Vinod
