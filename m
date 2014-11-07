From: Caesar Wang <caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v9 0/3] ARM: rk3288: Add PM Domain support
Date: Fri,  7 Nov 2014 12:53:27 +0800
Message-ID: <1415336010-31663-1-git-send-email-caesar.wang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, fzf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

    Add power domain drivers based on generic power domain for
    Rockchip platform, and support RK3288.

    https://chromium-review.googlesource.com/#/c/220253/9
    This is the GPU driver, add the following information in DT,
    and it can support the PMDOMAIN

gpu: gpu@ffa30000 {
    compatible = "arm,malit764",
                 "arm,malit76x",
                 "arm,malit7xx",
                 "arm,mali-midgard";
    reg = <0xffa30000 0x10000>;
    interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
                 <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
                 <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
    interrupt-names = "JOB", "MMU", "GPU";
    clocks = <&cru ACLK_GPU>;
    clock-names = "aclk_gpu";
    operating-points = <
                /* KHz uV */
                100000 800000
                200000 850000
                300000 950000
                400000 1000000
                600000 1150000
    >;
    power-domains = <&power RK3288_PD_GPU>;
    status = "disabled";
};

Based on:
    - [PATCH v1 1/4] PM / clock_ops: Add pm_clk_add_clk()
    http://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg735599.html

Changes in v9:
    - add document decription
    - fix v8 changes as follows:
    - This reconciles the v2 and v7 code so that we power domain have
      lists of clocks they toggle on and off during power transitions and
      independently from power domains clocks we attach clocks to devices
      comprising power domain and prepare them so they are turn on and off
      by runtime PM.
    - add rockchip_pm_add_one_domain() to control domains.
    - add pd_start/pd_stop interface to control clocks
    - add decription for power-doamin node

Changes in v8:
    - document go back to v2
    - This reconciles the v2 and v7 code so that we power domain have
      lists of clocks they toggle on and off during power transitions and
      independently from power domains clocks we attach clocks to devices
      comprising power domain and prepare them so they are turn on and off
      by runtime PM.
    - DTS go back to v2

Changes in v7:
    - Delete unused variables

Changes in v6:
    - delete pmu_lock
    - modify dev_lock using mutex
    - pm_clk_resume(pd->dev) change to pm_clk_resume(ed->dev)
    - pm_clk_suspend(pd->dev) change to pm_clk_suspend(ed->dev)
    - add devm_kfree(pd->dev, de) in rockchip_pm_domain_detach_dev

Changes in v5:
    - delete idle_lock
    - add timeout in rockchip_pmu_set_idle_request()

Changes in v4:
    - use list storage dev

Changes in v3:
    - DT structure has changed
    - change use pm_clk_resume() and pm_clk_suspend()
    - Decomposition power-controller, changed to multiple controller
    (gpu-power-controller, hevc-power-controller)

Changes in v2:
    - move clocks to "optional"
    - remove the "pd->pd.of_node = np"
    - make pd_vio clocks all one entry per line and alphabetize.
    - power: power-controller move back to pinctrl: pinctrl.

Caesar Wang (3):
  dt-bindings: add document of Rockchip power domain
  power-domain: rockchip: add power doamin driver
  ARM: dts: add rk3288 power-domain node

 .../bindings/arm/rockchip/power_domain.txt         |  48 +++
 arch/arm/boot/dts/rk3288.dtsi                      |  66 +++
 arch/arm/mach-rockchip/Kconfig                     |   1 +
 arch/arm/mach-rockchip/Makefile                    |   1 +
 arch/arm/mach-rockchip/pm_domains.c                | 469 +++++++++++++++++++++
 include/dt-bindings/power-domain/rk3288.h          |  11 +
 6 files changed, 596 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/power_domain.txt
 create mode 100644 arch/arm/mach-rockchip/pm_domains.c
 create mode 100644 include/dt-bindings/power-domain/rk3288.h

-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
