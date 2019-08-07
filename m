From: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: next-20190806: arm64: adv7511 3-0039: failed to find dsi host
Date: Wed, 7 Aug 2019 13:47:37 +0530
Message-ID: <CA+G9fYus+cW4775Y2_Xqpc+G6YP_KfjGeCMzoSQq6o2yVY8Q3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hans.verkuil@cisco.com>, mchehab@kernel.org, robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-media@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, agross@kernel.org, david.brown@linaro.org, lkft-triage@lists.linaro.org
List-Id: devicetree@vger.kernel.org

arm64 devices dragonboard 410c (QC410E) and hi6220-hikey running Linux
next-20190806 loading modules causing floods of kernel messages.

We have enabled few extra kernel configs for testing.
CONFIG_DRM_I2C_ADV7511=m
CONFIG_DRM_I2C_ADV7511_CEC=y
...

Please find below boot log and config file link.

[    0.000000] Linux version 5.3.0-rc3-next-20190806 (oe-user@oe-host)
(gcc version 7.3.0 (GCC)) #1 SMP PREEMPT Tue Aug 6 05:49:36 UTC 2019
[    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
....
[   10.051193] adv7511 3-0039: 3-0039 supply dvdd not found, using
dummy regulator
[   10.051633] adv7511 3-0039: 3-0039 supply pvdd not found, using
dummy regulator
[   10.076257] adreno 1c00000.gpu: Adding to iommu group 0
[   10.090929] adv7511 3-0039: 3-0039 supply a2vdd not found, using
dummy regulator
[   10.101703] msm_mdp 1a01000.mdp: Adding to iommu group 1
[   10.102563] msm_mdp 1a01000.mdp: No interconnect support may cause
display underflows!
[   10.139492] adv7511 3-0039: failed to find dsi host
...
[   33.065744] adv7511 3-0039: failed to find dsi host
[   33.076721] msm 1a00000.mdss: 1a00000.mdss supply vdd not found,
using dummy regulator
[   33.078344] msm_mdp 1a01000.mdp: [drm:mdp5_bind [msm]] MDP5 version v1.6
[   33.083862] msm 1a00000.mdss: bound 1a01000.mdp (ops mdp5_ops [msm])
[   33.090892] msm_dsi 1a98000.dsi: 1a98000.dsi supply gdsc not found,
using dummy regulator
[   33.097756] msm_dsi 1a98000.dsi: 1a98000.dsi supply gdsc not found,
using dummy regulator
[   33.106606] msm_dsi_manager_register: failed to register mipi dsi
host for DSI 0
[   33.114579] msm 1a00000.mdss: failed to bind 1a98000.dsi (ops
dsi_ops [msm]): -517
[   33.121263] msm 1a00000.mdss: master bind failed: -517
[   33.135547] adv7511 3-0039: 3-0039 supply dvdd not found, using
dummy regulator
[   33.139360] adv7511 3-0039: 3-0039 supply pvdd not found, using
dummy regulator
[   33.143646] adv7511 3-0039: 3-0039 supply a2vdd not found, using
dummy regulator

Full test log
https://lkft.validation.linaro.org/scheduler/job/860208#L956

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: 958eb4327c1761c609bde8e9f7c04e9d1c6fbb96
  git describe: next-20190806
  make_kernelversion: 5.3.0-rc3
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/579/config
  kernel-defconfig:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/579/defconfig
  build-location:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/579

Best regards
Naresh Kamboju
