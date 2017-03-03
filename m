From: Peter Senna Tschudin <peter.senna@collabora.com>
Subject: [PATCH V3 0/4] megachips-stdpxxxx-ge-b850v3-fw
Date: Fri,  3 Mar 2017 16:57:06 +0100
Message-ID: <cover.1488555615.git.peter.senna@collabora.com>
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
To: airlied@linux.ie, architt@codeaurora.org, akpm@linux-foundation.org, daniel.vetter@ffwll.ch, davem@davemloft.net, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, enric.balletbo@collabora.com, eballetbo@gmail.com, galak@codeaurora.org, gregkh@linuxfoundation.org, heiko@sntech.de, ijc+devicetree@hellion.org.uk, javier@dowhile0.org, jslaby@suse.cz, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux@roeck-us.net, mark.rutland@arm.com, martin.donnelly@ge.com, martyn.welch@collabora.co.uk, mchehab@osg.samsung.com, pawel.moll@arm.com, peter.senna@collabora.com, peter.senna@gmail.com, p.zabel@pengutronix.de, thierry.reding@gmail.com, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, shawnguo@kernel.org, tiwai@suse.com, treding@nvidia.com, laurent.pinchart@ideasonboard.com
List-Id: devicetree@vger.kernel.org

The video processing pipeline on the second output on the GE B850v3:

  Host -> LVDS|--(STDP4028)--|DP -> DP|--(STDP2690)--|DP++ -> Video output

Each bridge has a dedicated flash containing firmware for supporting the
custom design. The result is that in this design neither the STDP4028
nor the STDP2690 behave as the stock bridges would. The compatible
strings include the suffix "-ge-b850v3-fw" to make it clear that the
driver is for the bridges with the firmware which is specific for the GE
B850v3.

The driver is powerless to control the video processing pipeline, as the
two bridges behaves as a single one. The driver is only needed for
telling the host about EDID / HPD, and for giving the host powers to ack
interrupts.

Changes from V2:
 - Added Acked-by: Rob Herring <robh@kernel.org> on patch 1/4
 - Fixed the driver to allow it to be compiled as a module

Changes from V1:
 - Fix bindings documentation
 - Fix white space issues on the driver
 - Improved ge_b850v3_lvds_remove() to not rely on ge_b850v3_lvds_ptr->edid

Changes from V7(was GE B850v3 LVDS/DP++ Bridge):
 - New devicetree binding with one node per bridge, and two ports per bridge
 - Two i2c_devices, one per bridge
 - Removed uneeded mutexes
 - Moved documentation to bindings/display/bridge
 - Included test for EDID extension blocks
 - Renamed bridge pointer to ge_b850v3_lvds_ptr
 - Removed the call to drm_helper_hpd_irq_event()
 - Removed assignments to bridge.driver_private

Changes from V6:
 - Removed check for pixel clock as the bridge supports up to 330Mhz while the
   host is limited to 264 MHz in very specific conditions.
 - Added a second mutex to avoid concurrency issues while acking interrupts
   from threaded interrupt handlers.
 - Renamed the edid mutex to be more descriptive.
 - Added a .detach() function that disables the interrupts.
 - Adopted i2c_new_secondary_device() and updated the dts and documentation to
   match the new method.
 - Removed useless test to drm_bridge_add()
 - Did some refactoring around devm_request_threaded_irq()
 - Added a missing call to i2c_unregister_device() on the i2c_driver.remove()
   function.

Changes from V5:
 - Change to MAINTAINERS in a separate patch
 - Reworked interrupt handler initialization
 - Removed useless calls to: drm_connector_register(),
   drm_helper_hpd_irq_event(), and drm_bridge_enable()

Changes from V4:
 - Renamed the i2c_driver.name from "ge,b850v3-lvds-dp" to "b850v3-lvds-dp" to
   remove the comma from the driver name

Changes from V3:
 - Removed the patch that was configuring the mapping between IPUs and external
   displays on the dts file

Peter Senna Tschudin (4):
  dt-bindings: display: megachips-stdpxxxx-ge-b850v3-fw
  MAINTAINERS: Add entry for megachips-stdpxxxx-ge-b850v3-fw
  drm/bridge: Drivers for megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)
  dts/imx6q-b850v3: Use megachips-stdpxxxx-ge-b850v3-fw bridges
    (LVDS-DP++)

 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.txt     |  94 +++++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 MAINTAINERS                                        |   8 +
 arch/arm/boot/dts/imx6q-b850v3.dts                 |  68 ++++
 drivers/gpu/drm/bridge/Kconfig                     |  11 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   | 428 +++++++++++++++++++++
 7 files changed, 611 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
 create mode 100644 drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c

-- 
2.9.3
