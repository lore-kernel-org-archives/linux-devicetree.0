From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/6] of: Add helper for mapping device node to logical
 CPU number
Date: Mon, 7 Aug 2017 18:33:15 -0500
Message-ID: <CAL_JsqLuvHwnrVKfS34T8xmBMx0x-0Y6VkaYCa7rtGi8fjS_kw@mail.gmail.com>
References: <1502099560-6267-1-git-send-email-suzuki.poulose@arm.com> <1502099560-6267-3-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502099560-6267-3-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Will Deacon <will.deacon@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Peter Zijlstra <peterz@infradead.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 7, 2017 at 4:52 AM, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> Add a helper to map a device node to a logical CPU number to avoid
> duplication. Currently this is open coded in different places (e.g
> gic-v3, coresight). The helper tries to map device node to a "possible"
> logical CPU id, which may not be online yet. It is the responsibility
> of the user to make sure that the CPU is online. The helper uses
> of_get_cpu_node() which uses arch specific backends to match the phyiscal
> ids.
>
> Cc: devicetree@vger.kernel.org
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since V3:
>  - Renamed the helper to of_cpu_node_to_id(), suggested by Rob
>  - Return -ENODEV on failure than nr_cpus_id
> ---
>  drivers/of/base.c  | 26 ++++++++++++++++++++++++++
>  include/linux/of.h |  7 +++++++
>  2 files changed, 33 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
