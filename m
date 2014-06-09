From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] regulator: of: Add support for pasing regulator suspend
 state
Date: Mon, 09 Jun 2014 19:29:38 +0900
Message-ID: <1402309780-8118-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The regulators would set different state/mode according to the kind of suspend
state. So regulation_constraints structure has already regulator suspend state filed.
This patch parse regulator suspend state from devicetree file.

For example:

	ldoX_reg: LDOx {
		regulator-name = "VAP_XXX_1.2V";
		regulator-min-microvolt = <1200000>;
		regulator-max-microvolt = <1200000>;
		regulator-always-on;

		regulator-initial-state = <3>;	/* PM_SUSPEND_MEM */
		regulator-state-standby {
			regulator-volt = <1200000>;
			regulator-mode = <0x2>;	/* REGULATOR_MODE_NORMAL */
		};

		regulator-state-mem {
			regulator-volt = <1200000>;
			regulator-mode = <0x8>;	/* REGULATOR_MODE_STANDBY */
			regulator-off-in-suspend;
		};

		regulator-state-disk {
			regulator-volt = <1200000>;
			regulator-mode = <0x2>;	/* REGULATOR_MODE_NORMAL */
			regulator-on-in-suspend;
		};
	};

Chanwoo Choi (2):
  regulator: of: Add support for parsing regulator_state for suspend state
  dt-bindings: regulator: Add regulator suspend state for PM state

 .../devicetree/bindings/regulator/regulator.txt    | 12 +++++
 drivers/regulator/of_regulator.c                   | 61 +++++++++++++++++++++-
 2 files changed, 71 insertions(+), 2 deletions(-)

-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
