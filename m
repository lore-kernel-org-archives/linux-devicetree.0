From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] drivers/perf: arm-pmu: Handle per-interrupt affinity
 mask
Date: Mon, 11 Jul 2016 09:37:16 -0500
Message-ID: <20160711143716.GA9267@rob-hp-laptop>
References: <1467815627-4061-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467815627-4061-1-git-send-email-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, Will Deacon <will.deacon@arm.com>, cf@rock-chips.com, huangtao@rock-chips.com, jay.xu@rock-chips.com, Caesar Wang <wxt@rock-chips.com>, David Wu <david.wu@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 06, 2016 at 03:33:47PM +0100, Marc Zyngier wrote:
> On a big-little system, PMUs can be wired to CPUs using per CPU
> interrups (PPI). In this case, it is important to make sure that
> the enable/disable do happen on the right set of CPUs.
> 
> So instead of relying on the interrupt-affinity property, we can
> use the actual percpu affinity that DT exposes as part of the
> interrupt specifier. The DT binding is also updated to reflect
> the fact that the interrupt-affinity property shouldn't be used
> in that case.
> 
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
> * From v1:
>   - propagate the error if irq_get_percpu_devid_partition fails
> 
>  Documentation/devicetree/bindings/arm/pmu.txt |  4 +++-

I acked v1, please add acks.

Rob

>  drivers/perf/arm_pmu.c                        | 27 ++++++++++++++++++++++-----
>  2 files changed, 25 insertions(+), 6 deletions(-)
