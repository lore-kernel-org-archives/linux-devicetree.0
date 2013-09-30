From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCHv5 0/4] Add Freescale FTM PWM driver.
Date: Mon, 30 Sep 2013 14:13:27 +0800
Message-ID: <1380521611-2764-1-git-send-email-Li.Xiubo@freescale.com>
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
To: r65073@freescale.com, thierry.reding@gmail.com
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, linux@arm.linux.org.uk, ian.campbell@citrix.com, pawel.moll@arm.com, swarren@wwwdotorg.org, s.hauer@pengutronix.de, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, devicetree@vger.kernel.org, rob@landley.net, grant.likely@linaro.org, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

This patch series is the Freescale FTM PWM implementation. And there are 8 channels most supported by the FTM PWM. This implementation is only compatible with device tree definition.

This patch series is based on linux-next and has been tested on Vybrid VF610 Tower board using device tree.

Changes in v5:
- Remove active/idle pinctrl stuff.

Changes in v4:
- Check for the result and return an error for devm_kzalloc().
- Move pinmux setting from the SoC file to the board specific file.
- Revise the written mistake of 'ret |= FTMSC_CLKEXT;' --> 'reg |= FTMSC_CLKEXT;'.


Changes in v3:
- Remove "availabe" field.
- Remove "fsl,pwm-avaliable-chs" property.
- ...

Changes in v2:
- Remove PWM CPWM/EPWM feature and sysfs.
- Remove some redundant code.
- Revise some code for more readable.
- Remove "fsl,pwm-clk-ps", "fsl,pwm-number", "fsl,pwm-channels",etc.
- Add "fsl,pwm-avaliable-chs", "fsl,pwm-counter-clk", etc.
- Support 8 channels default in dtsi file.
- Add counter clock source selection.
- Rename some function name, macro name, etc.
- Use PWM's and OF's existing function interfaces.
- Split clk_unprepare_enable to clk_unprepare and clk_enable,etc.
- ...

Added in v1:
- Add Freescale FTM PWM driver support.
- Add Freescale FTM PWM node for VF610.
- Enable Enables FTM PWM device for Vybrid VF610 TOWER.
- Add device tree bindings for Freescale.
