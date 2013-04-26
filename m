From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC PATCH v3 02/17] Documentation: devicetree: arm: cpus/cpu
 nodes bindings updates
Date: Thu, 25 Apr 2013 21:51:10 -0500
Message-ID: <CAL_JsqL2QOjTffogB6g7VK7oRUwDAmJpr=36uvFXjd+hpBL89A@mail.gmail.com>
References: <1366824502-19729-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366824502-19729-3-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1366824502-19729-3-git-send-email-lorenzo.pieralisi@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Viresh Kumar <viresh.kumar@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Barry Song <baohua.song@csr.com>, Will Deacon <will.deacon@arm.com>, Sekhar Nori <nsekhar@ti.com>, Simon Horman <horms@verge.net.au>, Rob Herring <rob.herring@calxeda.com>, Amit Kucheria <amit.kucheria@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Grant Likely <grant.likely@linaro.org>, David Brown <davidb@codeaurora.org>, Vinayak Kale <vkale@apm.com>, Lennert Buytenhek <kernel@wantstofly.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2013 at 12:28 PM, Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
> In order to extend the current cpu nodes bindings to newer CPUs
> inclusive of AArch64 and to update support for older ARM CPUs this
> patch updates device tree documentation for the cpu nodes bindings.
>
> Main changes:
>     - adds 64-bit bindings
>     - define usage of #address-cells
>     - define 32/64 dts compatibility settings
>     - defines behaviour on pre and post v7 uniprocessor systems
>     - adds ARM 11MPcore specific reg property definition
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> ---

[...]

> +       - enable-method
> +               Value type: <stringlist>
> +               Usage and definition depend on ARM architecture version and
> +               configuration:
> +                       # On ARM v8 64-bit systems running the OS in AArch64,
> +                         this property is required and must be "spin-table".

What about PSCI?

I don't think the ePAPR spin-table definition is sufficient for ARM.
How do you define wake up by SGI or sev instruction.

> +                       # On ARM 32-bit systems or ARM v8 systems running
> +                         the OS in AArch32 this property is prohibited.

Why?

Rob
