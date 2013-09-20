From: Mike Dunn <mikedunn@newsguy.com>
Subject: [PATCH v5 0/2] PWM: PXA: add device tree support to PWM driver
Date: Fri, 20 Sep 2013 09:12:45 -0700
Message-ID: <1379693567-15860-1-git-send-email-mikedunn@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-pwm@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, Mike Dunn <mikedunn@newsguy.com>, Pawel Moll <pawel.moll@arm.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Stephen Warren <swarren@wwwdotorg.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Chao Xie <chao.xie@marvell.com>, Thierry Reding <thierry.reding@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Grant Likely <grant.likely@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

This is now a patch set because the changes to pxa27x.dtsi have been moved to a
separate patch.  This was done so that it can go through the arm-soc tree.

Changle log:
v5:
- changes to pxa27x.dtsi moved to a separate patch
- minor changes in phrasing made to bindings documentation
- cast removed from void *
- dummy functions for !CONFIG_OF removed; called only if (IS_ENABLED(CONFIG_OF)
- if-else block in pxa_pwm_get_id_dt() replaced with ternary operator

v4:
- add second "compatible" string to pxa27x.dtsi
- change phrasing in binding doc pxa-pwm.txt to "one or more of"

v3:
- remove support for the polarity flag
- remove per-chip pwm index cell; define custom of_xlate()
   (now #pwm-cells = <1>)
- "compatible" strings for all devices added to OF match table
- various stylistic changes recommended by reviewers

v2:
- of_match_table contains only the "pxa250-pwm" compatible string; require one
  device instance per pwm
- add Documentation/devicetree/bindings/pwm/pxa-pwm.txt
- add support for polarity flag in DT and implement set_polarity() method
  (the treo 680 inverts the signal between pwm out and backlight)
- return -EINVAL instead of -ENODEV if platform data or DT node not found
- output dev_info string if platform data missing
- expanded CC list of patch

Mike Dunn (2):
  PWM: PXA: add device tree support to PWM driver
  PXA: add PWM nodes to pxa27x.dtsi

 arch/arm/boot/dts/pxa27x.dtsi | 24 ++++++++++++++++++++
 drivers/pwm/pwm-pxa.c         | 52 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

-- 
1.8.1.5
