From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/2] Re-Enable support to disable switch regulators
Date: Thu, 12 Jul 2018 13:02:38 +0200
Message-ID: <20180712110240.3006-1-m.felsch@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: fabio.estevam@nxp.com, Anson.Huang@nxp.com, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Anson had added the support to disable the switched regulators, but
there were regressions [1] with old dtb's, so the commit was reverted [2].
At all, the support to disable the switch regulators seems to me to be a
good feature. But we have to add a special dt-property to avoid
regressions with older kernels.

The property allows the user to decide if the switch regulators should
be disabled in real or if it is a 'simulated' disabling. By 'simulated'
I mean that the regulator-fw think it is disabled but the switch keeps
on in real.

Since the revert patch is on Marks regulator repo, my patches are based
on his repo too.

Used Kernel:
Repo:
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
Branch:
regulator/for-4.19

Regards,
Marco

[1] https://patchwork.kernel.org/patch/10490381/
[2] https://patchwork.kernel.org/patch/10500333/

Marco Felsch (2):
  dt-bindings: pfuze100: add optional pfuze-disable-sw binding
  regulator: pfuze100: add support to en-/disable switch regulators

 .../bindings/regulator/pfuze100.txt           |  8 ++++++
 drivers/regulator/pfuze100-regulator.c        | 26 +++++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.18.0
