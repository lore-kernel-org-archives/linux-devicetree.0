From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/3 v4] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Thu, 28 May 2015 11:33:07 -0700
Message-ID: <1432837987-22861-1-git-send-email-eric@anholt.net>
References: <20150528114500.GP11677@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150528114500.GP11677@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This gives us a function for making mailbox property channel requests
of the firmware, which is most notable in that it will let us get and
set clock rates.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---

v2: Drop power-domains stuff for now since we don't have the driver
    core support to make it useful.  Move to drivers/firmware/.
    Capitalize the enums.  De-global the firmware variable.  Use the
    firmware device to allocate our DMA buffer, so that the dma-ranges
    DT property gets respected.  Simplify the property tag transaction
    interface even more, leaving a multi-tag interface still
    available.  For conciseness, rename "raspberrypi" to "rpi" on all
    functions/enums/structs, and the "firmware" variable to "fw".
    Print when the driver is probed successfully, since debugging
    -EPROBE_DEFER handling is such a big part of bcm2835 development.
    Drop -EBUSY mailbox handling since the mailbox core has been fixed
    to return -EPROBE_DEFER in -next.

v3: Use kernel-doc style for big comments (from Noralf), drop stale
    comment, use "dev" when freeing DMA as well.

v4: Move description comment into copyright comment, drop a dead
    initialization of "ret", and print the firmware revision at probe
    time.

 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/raspberrypi.c                     | 248 +++++++++++++=
++++++++
 .../soc/bcm2835/raspberrypi-firmware-property.h    | 112 ++++++++++
 3 files changed, 361 insertions(+)
 create mode 100644 drivers/firmware/raspberrypi.c
 create mode 100644 include/soc/bcm2835/raspberrypi-firmware-property.h

diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 3fdd391..41ced28 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_ISCSI_IBFT)	+=3D iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+=3D memmap.o
 obj-$(CONFIG_QCOM_SCM)		+=3D qcom_scm.o
 CFLAGS_qcom_scm.o :=3D$(call as-instr,.arch_extension sec,-DREQUIRES_S=
EC=3D1)
+obj-$(CONFIG_BCM2835_MBOX)	+=3D raspberrypi.o
=20
 obj-$(CONFIG_GOOGLE_FIRMWARE)	+=3D google/
 obj-$(CONFIG_EFI)		+=3D efi/
diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberr=
ypi.c
new file mode 100644
index 0000000..e121467
--- /dev/null
+++ b/drivers/firmware/raspberrypi.c
@@ -0,0 +1,248 @@
+/*
+ * Defines interfaces for interacting wtih the Raspberry Pi firmware's
+ * property channel.
+ *
+ * Copyright =C2=A9 2015 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <soc/bcm2835/raspberrypi-firmware-property.h>
+
+#define MBOX_MSG(chan, data28)		(((data28) & ~0xf) | ((chan) & 0xf))
+#define MBOX_CHAN(msg)			((msg) & 0xf)
+#define MBOX_DATA28(msg)		((msg) & ~0xf)
+#define MBOX_CHAN_PROPERTY		8
+
+struct rpi_firmware {
+	struct mbox_client cl;
+	struct mbox_chan *chan; /* The property channel. */
+	struct completion c;
+	u32 enabled;
+};
+
+static DEFINE_MUTEX(transaction_lock);
+
+static void response_callback(struct mbox_client *cl, void *msg)
+{
+	struct rpi_firmware *fw =3D container_of(cl, struct rpi_firmware, cl)=
;
+	complete(&fw->c);
+}
+
+/*
+ * Sends a request to the firmware through the BCM2835 mailbox driver,
+ * and synchronously waits for the reply.
+ */
+static int
+rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
+{
+	u32 message =3D MBOX_MSG(chan, data);
+	int ret;
+
+	WARN_ON(data & 0xf);
+
+	mutex_lock(&transaction_lock);
+	reinit_completion(&fw->c);
+	ret =3D mbox_send_message(fw->chan, &message);
+	if (ret >=3D 0) {
+		wait_for_completion(&fw->c);
+		ret =3D 0;
+	} else {
+		dev_err(fw->cl.dev, "mbox_send_message returned %d\n", ret);
+	}
+	mutex_unlock(&transaction_lock);
+
+	return ret;
+}
+
+/**
+ * rpi_firmware_property_list - Submit firmware property list
+ * @of_node:	Pointer to the firmware Device Tree node.
+ * @data:	Buffer holding tags.
+ * @tag_size:	Size of tags buffer.
+ *
+ * Submits a set of concatenated tags to the VPU firmware through the
+ * mailbox property interface.
+ *
+ * The buffer header and the ending tag are added by this function and
+ * don't need to be supplied, just the actual tags for your operation.
+ * See struct rpi_firmware_property_tag_header for the per-tag
+ * structure.
+ */
+int rpi_firmware_property_list(struct device_node *of_node,
+			       void *data, size_t tag_size)
+{
+	struct platform_device *pdev =3D of_find_device_by_node(of_node);
+	struct rpi_firmware *fw =3D platform_get_drvdata(pdev);
+	size_t size =3D tag_size + 12;
+	u32 *buf;
+	dma_addr_t bus_addr;
+	int ret;
+
+	if (!fw)
+		return -EPROBE_DEFER;
+
+	/* Packets are processed a dword at a time. */
+	if (size & 3)
+		return -EINVAL;
+
+	buf =3D dma_alloc_coherent(fw->cl.dev, PAGE_ALIGN(size), &bus_addr,
+				 GFP_ATOMIC);
+	if (!buf)
+		return -ENOMEM;
+
+	/* The firmware will error out without parsing in this case. */
+	WARN_ON(size >=3D 1024 * 1024);
+
+	buf[0] =3D size;
+	buf[1] =3D RPI_FIRMWARE_STATUS_REQUEST;
+	memcpy(&buf[2], data, tag_size);
+	buf[size / 4 - 1] =3D RPI_FIRMWARE_PROPERTY_END;
+	wmb();
+
+	ret =3D rpi_firmware_transaction(fw, MBOX_CHAN_PROPERTY, bus_addr);
+
+	rmb();
+	memcpy(data, &buf[2], tag_size);
+	if (ret =3D=3D 0 && buf[1] !=3D RPI_FIRMWARE_STATUS_SUCCESS) {
+		/*
+		 * The tag name here might not be the one causing the
+		 * error, if there were multiple tags in the request.
+		 * But single-tag is the most common, so go with it.
+		 */
+		dev_err(fw->cl.dev, "Request 0x%08x returned status 0x%08x\n",
+			buf[2], buf[1]);
+		ret =3D -EINVAL;
+	}
+
+	dma_free_coherent(fw->cl.dev, PAGE_ALIGN(size), buf, bus_addr);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rpi_firmware_property_list);
+
+/**
+ * rpi_firmware_property - Submit single firmware property
+ * @of_node:	Pointer to the firmware Device Tree node.
+ * @tag:	One of enum_mbox_property_tag.
+ * @tag_data:	Tag data buffer.
+ * @buf_size:	Buffer size.
+ *
+ * Submits a single tag to the VPU firmware through the mailbox
+ * property interface.
+ *
+ * This is a convenience wrapper around
+ * rpi_firmware_property_list() to avoid some of the
+ * boilerplate in property calls.
+ */
+int rpi_firmware_property(struct device_node *of_node,
+			  u32 tag, void *tag_data, size_t buf_size)
+{
+	/* Single tags are very small (generally 8 bytes), so the
+	 * stack should be safe.
+	 */
+	u8 data[buf_size + sizeof(struct rpi_firmware_property_tag_header)];
+	struct rpi_firmware_property_tag_header *header =3D
+		(struct rpi_firmware_property_tag_header *)data;
+	int ret;
+
+	header->tag =3D tag;
+	header->buf_size =3D buf_size;
+	header->req_resp_size =3D 0;
+	memcpy(data + sizeof(struct rpi_firmware_property_tag_header),
+	       tag_data, buf_size);
+
+	ret =3D rpi_firmware_property_list(of_node, &data, sizeof(data));
+	memcpy(tag_data,
+	       data + sizeof(struct rpi_firmware_property_tag_header),
+	       buf_size);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rpi_firmware_property);
+
+static void
+rpi_firmware_print_firmware_revision(struct device *dev)
+{
+	u32 packet;
+	int ret =3D rpi_firmware_property(dev->of_node,
+					RPI_FIRMWARE_GET_FIRMWARE_REVISION,
+					&packet, sizeof(packet));
+
+	if (ret =3D=3D 0) {
+		struct tm tm;
+
+		time_to_tm(packet, 0, &tm);
+
+		dev_info(dev,
+			 "Attached to firmware from %04ld-%02d-%02d %02d:%02d\n",
+			 tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+			 tm.tm_hour, tm.tm_min);
+	}
+}
+
+static int rpi_firmware_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct rpi_firmware *fw;
+
+	fw =3D devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return -ENOMEM;
+
+	fw->cl.dev =3D dev;
+	fw->cl.rx_callback =3D response_callback;
+	fw->cl.tx_block =3D true;
+
+	fw->chan =3D mbox_request_channel(&fw->cl, 0);
+	if (IS_ERR(fw->chan)) {
+		int ret =3D PTR_ERR(fw->chan);
+		if (ret !=3D -EPROBE_DEFER)
+			dev_err(dev, "Failed to get mbox channel: %d\n", ret);
+		return ret;
+	}
+
+	init_completion(&fw->c);
+
+	platform_set_drvdata(pdev, fw);
+
+	rpi_firmware_print_firmware_revision(dev);
+
+	return 0;
+}
+
+static int rpi_firmware_remove(struct platform_device *pdev)
+{
+	struct rpi_firmware *fw =3D platform_get_drvdata(pdev);
+
+	mbox_free_channel(fw->chan);
+
+	return 0;
+}
+
+static const struct of_device_id rpi_firmware_of_match[] =3D {
+	{ .compatible =3D "raspberrypi,firmware", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rpi_firmware_of_match);
+
+static struct platform_driver rpi_firmware_driver =3D {
+	.driver =3D {
+		.name =3D "raspberrypi-firmware",
+		.of_match_table =3D rpi_firmware_of_match,
+	},
+	.probe		=3D rpi_firmware_probe,
+	.remove		=3D rpi_firmware_remove,
+};
+module_platform_driver(rpi_firmware_driver);
+
+MODULE_AUTHOR("Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>");
+MODULE_DESCRIPTION("Raspberry Pi firmware driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/soc/bcm2835/raspberrypi-firmware-property.h b/incl=
ude/soc/bcm2835/raspberrypi-firmware-property.h
new file mode 100644
index 0000000..b007e92
--- /dev/null
+++ b/include/soc/bcm2835/raspberrypi-firmware-property.h
@@ -0,0 +1,112 @@
+/*
+ *  Copyright =C2=A9 2015 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/types.h>
+#include <linux/of_device.h>
+
+enum rpi_firmware_property_status {
+	RPI_FIRMWARE_STATUS_REQUEST =3D 0,
+	RPI_FIRMWARE_STATUS_SUCCESS =3D 0x80000000,
+	RPI_FIRMWARE_STATUS_ERROR =3D   0x80000001,
+};
+
+/**
+ * struct rpi_firmware_property_tag_header - Firmware property tag hea=
der
+ * @tag:		One of enum_mbox_property_tag.
+ * @buf_size:		The number of bytes in the value buffer following this
+ *			struct.
+ * @req_resp_size:	On submit, the length of the request (though it doe=
sn't
+ *			appear to be currently used by the firmware).  On return,
+ *			the length of the response (always 4 byte aligned), with
+ *			the low bit set.
+ */
+struct rpi_firmware_property_tag_header {
+	u32 tag;
+	u32 buf_size;
+	u32 req_resp_size;
+};
+
+enum rpi_firmware_property_tag {
+	RPI_FIRMWARE_PROPERTY_END =3D                           0,
+	RPI_FIRMWARE_GET_FIRMWARE_REVISION =3D                  0x00000001,
+
+	RPI_FIRMWARE_SET_CURSOR_INFO =3D                        0x00008010,
+	RPI_FIRMWARE_SET_CURSOR_STATE =3D                       0x00008011,
+
+	RPI_FIRMWARE_GET_BOARD_MODEL =3D                        0x00010001,
+	RPI_FIRMWARE_GET_BOARD_REVISION =3D                     0x00010002,
+	RPI_FIRMWARE_GET_BOARD_MAC_ADDRESS =3D                  0x00010003,
+	RPI_FIRMWARE_GET_BOARD_SERIAL =3D                       0x00010004,
+	RPI_FIRMWARE_GET_ARM_MEMORY =3D                         0x00010005,
+	RPI_FIRMWARE_GET_VC_MEMORY =3D                          0x00010006,
+	RPI_FIRMWARE_GET_CLOCKS =3D                             0x00010007,
+	RPI_FIRMWARE_GET_POWER_STATE =3D                        0x00020001,
+	RPI_FIRMWARE_GET_TIMING =3D                             0x00020002,
+	RPI_FIRMWARE_SET_POWER_STATE =3D                        0x00028001,
+	RPI_FIRMWARE_GET_CLOCK_STATE =3D                        0x00030001,
+	RPI_FIRMWARE_GET_CLOCK_RATE =3D                         0x00030002,
+	RPI_FIRMWARE_GET_VOLTAGE =3D                            0x00030003,
+	RPI_FIRMWARE_GET_MAX_CLOCK_RATE =3D                     0x00030004,
+	RPI_FIRMWARE_GET_MAX_VOLTAGE =3D                        0x00030005,
+	RPI_FIRMWARE_GET_TEMPERATURE =3D                        0x00030006,
+	RPI_FIRMWARE_GET_MIN_CLOCK_RATE =3D                     0x00030007,
+	RPI_FIRMWARE_GET_MIN_VOLTAGE =3D                        0x00030008,
+	RPI_FIRMWARE_GET_TURBO =3D                              0x00030009,
+	RPI_FIRMWARE_GET_MAX_TEMPERATURE =3D                    0x0003000a,
+	RPI_FIRMWARE_ALLOCATE_MEMORY =3D                        0x0003000c,
+	RPI_FIRMWARE_LOCK_MEMORY =3D                            0x0003000d,
+	RPI_FIRMWARE_UNLOCK_MEMORY =3D                          0x0003000e,
+	RPI_FIRMWARE_RELEASE_MEMORY =3D                         0x0003000f,
+	RPI_FIRMWARE_EXECUTE_CODE =3D                           0x00030010,
+	RPI_FIRMWARE_EXECUTE_QPU =3D                            0x00030011,
+	RPI_FIRMWARE_SET_ENABLE_QPU =3D                         0x00030012,
+	RPI_FIRMWARE_GET_DISPMANX_RESOURCE_MEM_HANDLE =3D       0x00030014,
+	RPI_FIRMWARE_GET_EDID_BLOCK =3D                         0x00030020,
+	RPI_FIRMWARE_SET_CLOCK_STATE =3D                        0x00038001,
+	RPI_FIRMWARE_SET_CLOCK_RATE =3D                         0x00038002,
+	RPI_FIRMWARE_SET_VOLTAGE =3D                            0x00038003,
+	RPI_FIRMWARE_SET_TURBO =3D                              0x00038009,
+
+	/* Dispmanx TAGS */
+	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =3D                   0x00040001,
+	RPI_FIRMWARE_FRAMEBUFFER_BLANK =3D                      0x00040002,
+	RPI_FIRMWARE_FRAMEBUFFER_GET_PHYSICAL_WIDTH_HEIGHT =3D  0x00040003,
+	RPI_FIRMWARE_FRAMEBUFFER_GET_VIRTUAL_WIDTH_HEIGHT =3D   0x00040004,
+	RPI_FIRMWARE_FRAMEBUFFER_GET_DEPTH =3D                  0x00040005,
+	RPI_FIRMWARE_FRAMEBUFFER_GET_PIXEL_ORDER =3D            0x00040006,
+	RPI_FIRMWARE_FRAMEBUFFER_GET_ALPHA_MODE =3D             0x00040007,
+	RPI_FIRMWARE_FRAMEBUFFER_GET_PITCH =3D                  0x00040008,
+	RPI_FIRMWARE_FRAMEBUFFER_GET_VIRTUAL_OFFSET =3D         0x00040009,
+	RPI_FIRMWARE_FRAMEBUFFER_GET_OVERSCAN =3D               0x0004000a,
+	RPI_FIRMWARE_FRAMEBUFFER_GET_PALETTE =3D                0x0004000b,
+	RPI_FIRMWARE_FRAMEBUFFER_RELEASE =3D                    0x00048001,
+	RPI_FIRMWARE_FRAMEBUFFER_TEST_PHYSICAL_WIDTH_HEIGHT =3D 0x00044003,
+	RPI_FIRMWARE_FRAMEBUFFER_TEST_VIRTUAL_WIDTH_HEIGHT =3D  0x00044004,
+	RPI_FIRMWARE_FRAMEBUFFER_TEST_DEPTH =3D                 0x00044005,
+	RPI_FIRMWARE_FRAMEBUFFER_TEST_PIXEL_ORDER =3D           0x00044006,
+	RPI_FIRMWARE_FRAMEBUFFER_TEST_ALPHA_MODE =3D            0x00044007,
+	RPI_FIRMWARE_FRAMEBUFFER_TEST_VIRTUAL_OFFSET =3D        0x00044009,
+	RPI_FIRMWARE_FRAMEBUFFER_TEST_OVERSCAN =3D              0x0004400a,
+	RPI_FIRMWARE_FRAMEBUFFER_TEST_PALETTE =3D               0x0004400b,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_PHYSICAL_WIDTH_HEIGHT =3D  0x00048003,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_VIRTUAL_WIDTH_HEIGHT =3D   0x00048004,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_DEPTH =3D                  0x00048005,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_PIXEL_ORDER =3D            0x00048006,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_ALPHA_MODE =3D             0x00048007,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_VIRTUAL_OFFSET =3D         0x00048009,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_OVERSCAN =3D               0x0004800a,
+	RPI_FIRMWARE_FRAMEBUFFER_SET_PALETTE =3D                0x0004800b,
+
+	RPI_FIRMWARE_GET_COMMAND_LINE =3D                       0x00050001,
+	RPI_FIRMWARE_GET_DMA_CHANNELS =3D                       0x00060001,
+};
+
+int rpi_firmware_property(struct device_node *of_node,
+			  u32 tag, void *data, size_t len);
+int rpi_firmware_property_list(struct device_node *of_node,
+			       void *data, size_t tag_size);
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
