From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/4] Add DT support for davinci remoteproc driver
Date: Fri, 26 May 2017 15:21:36 -0500
Message-ID: <20170526202140.10472-1-s-anna@ti.com>
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Robert Tivy <rtivy@ti.com>, Sekhar Nori <nsekhar@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

The following series adds the device tree support to the Davinci
remoteproc driver. The TI Davinci family has boards booting both
in legacy mode and DT mode, so both modes are still supported by
this driver. Patches are baselined on 4.12-rc1 + the "Davinci
remoteproc cleanups/fixes" series [1].

Following is the patch summary:
 - Patch 1 uses resource names for retrieving resources to be
   independent of the resource order, and prepare the driver
   for DT.
 - Patch 2 parses the internal memory regions, to be able to
   support loading into DSP internal memory regions.
 - Patch 3 adds the binding
 - Patch 4 adds the DT adaptation to the existing driver.

The first 2 patches are dependent on the resource name additions
(no direct build dependencies) to the davinci-rproc devices added
in series [2] for maintaining functional parity for legacy-mode
devices. This series is already accepted and being staged to be
merged for v4.13. DTS nodes for the OMAP-L138 LCDK board will be
added for a subsequent merge window once these patches are picked
up.

regards
Suman

[1] http://marc.info/?l=linux-arm-kernel&m=149514538506046&w=2
[2] http://marc.info/?l=linux-kernel&m=149497287512869&w=2
[3] https://git.kernel.org/pub/scm/linux/kernel/git/nsekhar/linux-davinci.git/?h=v4.13/soc

Suman Anna (4):
  remoteproc/davinci: Switch to platform_get_resource_byname()
  remoteproc/davinci: add support to parse internal memories
  Documentation: dt: Add bindings for Davinci DSP processors
  remoteproc/davinci: Add device tree support for OMAP-L138 DSP

 .../bindings/remoteproc/ti,davinci-rproc.txt       | 92 ++++++++++++++++++++
 drivers/remoteproc/da8xx_remoteproc.c              | 98 ++++++++++++++++++++--
 2 files changed, 185 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,davinci-rproc.txt

-- 
2.12.0
