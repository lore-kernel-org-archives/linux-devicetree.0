From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 0/9] rtc: stmp3xxx: DT bindings and wakealarm
Date: Fri,  8 Mar 2013 10:01:35 +0100
Message-ID: <1362733304-23037-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

Changes since v1:
	- renamed patches
	- reworked commit messages
	- squashed patches
	- added missing SOB
	- match on rtc nodename instead of using a new binding
	- general cleanup

I did not rework the sysfs stuff, as I'm still not sure if this
is wrong for bin_attributes or not.

Based on v3.9-rc1

Regards,
Steffen


Juergen Beisert (2):
  ARM: i.MX28: define osc in DT
  ARM: i.MX28: define external RTC crystal in DT

Steffen Trumtrar (7):
  ARM: i.MX28: dts: add clocks for stmp3xxx RTC
  rtc: stmp3xxx: allow different oscillators
  rtc: stmp3xxx: enable wakeup functionality
  rtc: stmp3xxx: add sysfs entries for persistent regs
  rtc: stmp3xxx: Re-enable active alarm
  rtc: stmp3xxx: Check copy controller state
  rtc: stmp3xxx: Replace wait_time function

 .../devicetree/bindings/clock/imx28-clock.txt      |   1 +
 arch/arm/boot/dts/imx28.dtsi                       |  19 ++
 drivers/clk/mxs/clk-imx28.c                        |  20 +-
 drivers/rtc/rtc-stmp3xxx.c                         | 282 +++++++++++++++++++--
 4 files changed, 305 insertions(+), 17 deletions(-)

-- 
1.8.2.rc2
