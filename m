From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH 0/2] GIC OF bindings
Date: Thu, 29 Sep 2011 10:21:49 +0100
Message-ID: <20110929092149.GL17204@pulham.picochip.com>
References: <1317268436-1613-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1317268436-1613-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, marc.zyngier@arm.com, thomas.abraham@linaro.org, jamie@jamieiles.com, b-cousson@ti.com, shawn.guo@linaro.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2011 at 10:53:54PM -0500, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> With recent patches for VIC device tree support and GIC MULTI_IRQ support,
> it is evident that the irq domain support should be moved into the core GIC
> code and not be dependent on the DT initialization. So I've split things up
> into 2 patches separating irq_domain and device-tree code.
> 
> This should only change the internals of the GIC code. The binding is
> unchanged from the previous version. Yeah!
> 
> The full series is available here. This includes Russell's devel-stable and
> for-next branches and Nico's vmalloc branch.

Looks good to me!

Reviewed-by: Jamie Iles <jamie@jamieiles.com>
