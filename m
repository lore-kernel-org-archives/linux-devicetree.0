From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v4 03/18] Documentation: devicetree: arm: cpus/cpu
 nodes bindings updates
Date: Fri, 12 Jul 2013 09:47:17 -0500
Message-ID: <CAL_JsqLANi5UoVyRMsa6XoQ+_KnmTQDfTz++shEh-dZ3FQGZaQ@mail.gmail.com>
References: <1368804061-4421-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1368804061-4421-4-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1368804061-4421-4-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2013 at 10:20 AM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> In order to extend the current cpu nodes bindings to newer CPUs
> inclusive of AArch64 and to update support for older ARM CPUs this
> patch updates device tree documentation for the cpu nodes bindings.

Sorry for the long delay on this, but I'm still not happy with the binding here.

> Main changes:
>     - adds 64-bit bindings
>     - define usage of #address-cells
>     - define 32/64 dts compatibility settings
>     - defines behaviour on pre and post v7 uniprocessor systems
>     - adds ARM 11MPcore specific reg property definition
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt | 459 ++++++++++++++++++++++---
>  1 file changed, 412 insertions(+), 47 deletions(-)

[snip]

> +                       # On ARM v8 64-bit systems, where the reg property
> +                         size can be 1 or 2 cells (as defined by cpus node's
> +                         #address-cells property), this property is
> +                         required and matches:
> +
> +                         - On systems running the OS in AArch32:

The DTS cannot change based on 32-bit or 64-bit OS.

> +
> +                           * If the cpus node's #address-cells value is 2:
> +
> +                             The first reg cell must be set to 0.
> +
> +                             The second reg cell bits [23:0] must be set to
> +                             bits [23:0] of MPIDR_EL1.
> +
> +                             All other bits in the reg cells must be set to 0.
> +
> +                           * If the cpus node's #address-cells value is 1:
> +
> +                             Bits [23:0] in the reg cell must be set to
> +                             bits [23:0] in MPIDR_EL1.
> +
> +                             All other bits in the reg cell must be 0.
> +
> +                         - On systems running the OS in AArch64:
> +
> +                           * If the cpus node's #address-cells value is 2:
> +
> +                             The first reg cell bits [7:0] must be set to
> +                             bits [39:32] of MPIDR_EL1.
> +
> +                             The second reg cell bits [23:0] must be set to
> +                             bits [23:0] of MPIDR_EL1.
> +
> +                             All other bits in the reg cells must be set to 0.
> +
> +                           * If the cpus node's #address-cells value is 1:
> +
> +                             MPIDR_EL1[63:32] is 0 on all processors in the
> +                             system.

Your logic is backwards here. If the MPIDR_EL1[63:32] is 0, then
#address-cells can be 1. You could say the upper bits are ignored and
treated as 0. However, you should simplify all this and just mandate
that #address-cells must be 2 for ARMv8 or more generally must match
the size of the MPIDR. If we want to boot a 32-bit kernel, then the
kernel will have to adapt to support this.

> +
> +                             The reg cell bits [23:0] must be set to
> +                             bits [23:0] of MPIDR_EL1.
> +
> +                             All other bits in the reg cell must be set to 0.
> +
> +       - compatible:
> +               Usage: required
> +               Value type: <string>
> +               Definition: should be one of:
> +                           "arm,arm710t"
> +                           "arm,arm720t"
> +                           "arm,arm740t"
> +                           "arm,arm7ej-s"
> +                           "arm,arm7tdmi"
> +                           "arm,arm7tdmi-s"
> +                           "arm,arm9es"
> +                           "arm,arm9ej-s"
> +                           "arm,arm920t"
> +                           "arm,arm922t"
> +                           "arm,arm925"
> +                           "arm,arm926e-s"
> +                           "arm,arm926ej-s"
> +                           "arm,arm940t"
> +                           "arm,arm946e-s"
> +                           "arm,arm966e-s"
> +                           "arm,arm968e-s"
> +                           "arm,arm9tdmi"
> +                           "arm,arm1020e"
> +                           "arm,arm1020t"
> +                           "arm,arm1022e"
> +                           "arm,arm1026ej-s"
> +                           "arm,arm1136j-s"
> +                           "arm,arm1136jf-s"
> +                           "arm,arm1156t2-s"
> +                           "arm,arm1156t2f-s"
> +                           "arm,arm1176jzf"
> +                           "arm,arm1176jz-s"
> +                           "arm,arm1176jzf-s"
> +                           "arm,arm11mpcore"
> +                           "arm,cortex-a5"
> +                           "arm,cortex-a7"
> +                           "arm,cortex-a8"
> +                           "arm,cortex-a9"
> +                           "arm,cortex-a15"
> +                           "arm,cortex-a53"
> +                           "arm,cortex-a57"
> +                           "arm,cortex-m0"
> +                           "arm,cortex-m0+"
> +                           "arm,cortex-m1"
> +                           "arm,cortex-m3"
> +                           "arm,cortex-m4"
> +                           "arm,cortex-r4"
> +                           "arm,cortex-r5"
> +                           "arm,cortex-r7"
> +                           "faraday,fa526"
> +                           "intel,sa110"
> +                           "intel,sa1100"
> +                           "marvell,feroceon"
> +                           "marvell,mohawk"
> +                           "marvell,pj4"
> +                           "marvell,sheeva-v7"
> +                           "marvell,xsc3"
> +                           "marvell,xscale"
> +                           "qcom,krait"
> +                           "qcom,scorpion"
> +       - enable-method
> +               Value type: <stringlist>
> +               Usage and definition depend on ARM architecture version and
> +               configuration:
> +                       # On ARM v8 64-bit systems running the OS in AArch64,

Again, the DTS can't depend on the OS type.

> +                         this property is required and must be one of:
> +                            "spin-table"
> +                            "psci"
> +                       # On ARM 32-bit systems or ARM v8 systems running
> +                         the OS in AArch32 this property is prohibited.

I still don't get the distinction between 32 and 64 bit here. On
32-bit, you have 3 choices: psci, spin-table, or SoC specific. So make
this property optional for 32-bit and mandatory for 64-bit.

> +
> +       - cpu-release-addr
> +               Usage: required for systems that have an "enable-method"
> +                      property value of "spin-table".
> +               Value type: <prop-encoded-array>
> +               Definition:
> +                       # On ARM v8 64-bit systems must be a two cell
> +                         property identifying a 64-bit zero-initialised
> +                         memory location.

As I mentioned previously, isn't some wake-up method needed? Most
systems will be in wfi or wfe rather than continuously spinning.

Rob
