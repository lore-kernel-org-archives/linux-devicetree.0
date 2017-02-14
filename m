From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/5] arm64: dts: Add basic DT to support Spreadtrum's SP9860G
Date: Tue, 14 Feb 2017 16:44:53 +0000
Message-ID: <CAPKp9ub35nL8gc_TKx02pSHHNwBhiMacWL=CuEmNGnecWikfGQ@mail.gmail.com>
References: <1487063952-7113-1-git-send-email-chunyan.zhang@spreadtrum.com> <1487063952-7113-2-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487063952-7113-2-git-send-email-chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 14, 2017 at 9:19 AM, Chunyan Zhang
<chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:
> From: Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>
> SC9860G is a 8 cores of A53 SoC with 4G LTE support SoC from Spreadtrum.
>
> According to regular hierarchy of sprd dts, whale2.dtsi contains SoC
> peripherals IP nodes, sc9860.dtsi contains stuff related to ARM core stuff
> and sp9860g dts is for the board level.
>
> Signed-off-by: Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
>  arch/arm64/boot/dts/sprd/Makefile         |   3 +-
>  arch/arm64/boot/dts/sprd/sc9860.dtsi      | 534 ++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/sprd/sp9860g-1h10.dts |  58 ++++
>  arch/arm64/boot/dts/sprd/whale2.dtsi      |  66 ++++
>  4 files changed, 660 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/sprd/sc9860.dtsi
>  create mode 100644 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
>  create mode 100644 arch/arm64/boot/dts/sprd/whale2.dtsi
>
> diff --git a/arch/arm64/boot/dts/sprd/Makefile b/arch/arm64/boot/dts/sprd/Makefile
> index b658c5e..f0535e6 100644
> --- a/arch/arm64/boot/dts/sprd/Makefile
> +++ b/arch/arm64/boot/dts/sprd/Makefile
> @@ -1,4 +1,5 @@
> -dtb-$(CONFIG_ARCH_SPRD) += sc9836-openphone.dtb
> +dtb-$(CONFIG_ARCH_SPRD) += sc9836-openphone.dtb \
> +                       sp9860g-1h10.dtb
>
>  always         := $(dtb-y)
>  subdir-y       := $(dts-dirs)
> diff --git a/arch/arm64/boot/dts/sprd/sc9860.dtsi b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> new file mode 100644
> index 0000000..604a8c9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sprd/sc9860.dtsi
> @@ -0,0 +1,534 @@

[...]

> +       idle-states{
> +               entry-method = "arm,psci";
> +
> +               CORE_PD: core_pd {
> +                       compatible = "arm,idle-state";
> +                       entry-latency-us = <1000>;
> +                       exit-latency-us = <700>;
> +                       min-residency-us = <2500>;
> +                       local-timer-stop;
> +                       arm,psci-suspend-param = <0x00010002>;
> +               };
> +
> +               CLUSTER_PD: cluster_pd {
> +                       compatible = "arm,idle-state";
> +                       entry-latency-us = <1000>;
> +                       exit-latency-us = <1000>;
> +                       min-residency-us = <3000>;
> +                       local-timer-stop;
> +                       arm,psci-suspend-param = <0x01010003>;
> +               };
> +
> +               DEEP_SLEEP: deep_sleep {
> +                       compatible = "arm,idle-state";
> +                       wakeup-latency-us = <0xffffffff>;

A value > 4294 seconds(i.e >1 hour) seems suspicious.
Are you working around the firmware issue with high latency value so
that it's never entered ? Why not remove advertising the state from DT.

Can you get me the dump of:
grep "" /sys/devices/system/cpu/cpu*/cpuidle/state*/{time,usage}

IIUC, you might have seen boot issue without this values and workaround
the issue with such high values ? If so please drop this state.

> +                       entry-latency-us = <1500>;
> +                       exit-latency-us = <1500>;
> +                       min-residency-us = <0xffffffff>;
> +                       local-timer-stop;
> +                       arm,psci-suspend-param = <0x01010005>;
> +               };
> +       };
>

--
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
