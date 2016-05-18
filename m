From: Songjun Wu <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] [media] atmel-isc: add driver for Atmel ISC
Date: Wed, 18 May 2016 15:46:27 +0800
Message-ID: <1463557590-29318-1-git-send-email-songjun.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: g.liakhovetski-Mmb7MZpHnFY@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Songjun Wu <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, =?UTF-8?q?Richard=20R=C3=B6jfors?= <richard-hy+oXTTr619xRVliYXHCzg@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Image Sensor Controller driver includes two parts.
1) Driver code to implement the ISC function.
2) Device tree binding documentation, it describes how
   to add the ISC in device tree.

Changes in v2:
- Add "depends on COMMON_CLK && VIDEO_V4L2_SUBDEV_API"
  in Kconfig file.
- Delete the redundant blank in atmel-isc-regs.h
- Enclose the expression in parentheses in some macros.
- Sort the header file alphabetically.
- Move the 'to_isc_clk(hw)' right after the struct
  isc_clk definition
- Move the global variables into the struct isc_device.
- Change some int variable to unsigned int variable.
- Replace pr_debug() with dev_dbg();
- Delete the loop while in 'isc_clk_enable' function.
- Rename the 'tmp_rate' and 'tmp_diff' to 'rate' and
  'diff' in 'isc_clk_determine_rate' function.
- Delete the inner parentheses in 'isc_clk_register'
  function.
- Delete the variable i in 'isc_parse_dt' function.
- Replace 'hsync_active', 'vsync_active' and 'pclk_sample'
  with 'pfe_cfg0' in struct isc_subdev_entity.
- Move the 'isc_parse_dt'function down right above the
  'atmel_isc_probe' function.
- Add the code to support VIDIOC_CREATE_BUFS in
  'isc_queue_setup' function.
- Replace the variable type 'unsigned long' with 'dma_addr_t'
  in 'isc_start_dma' function.
- Remove the list_del call, turn list_for_each_entry_safe
  into list_for_each entry, and add a INIT_LIST_HEAD after
  the loop in 'isc_start_streaming', 'isc_stop_streaming'
  and 'isc_subdev_cleanup' function.
- Invoke isc_config to configure register in
  'isc_start_streaming' function.
- Add the struct completion 'comp' to synchronize with
  the frame end interrupt in 'isc_stop_streaming' function.
- Check the return value of the clk_prepare_enable
  in 'isc_open' function.
- Set the default format in 'isc_open' function.
- Add an exit condition in the loop while in 'isc_config'.
- Delete the hardware setup operation in 'isc_set_format'.
- Refuse format modification during streaming
  in 'isc_s_fmt_vid_cap' function.
- Invoke v4l2_subdev_alloc_pad_config to allocate and
  initialize the pad config in 'isc_async_complete' function.
- Remove the check of the '!res' since devm_ioremap_resource()
  will check for it.
- Remove the error message in case of failure
  when call devm_ioremap_resource.
- Remove the cast the isc pointer to (void *).
- Remove the '.owner  = THIS_MODULE,' in atmel_isc_driver.
- Replace the module_platform_driver_probe() with
  module_platform_driver().
- Remove the unit address of the endpoint.
- Add the unit address to the clock node.
- Avoid using underscores in node names.
- Drop the "0x" in the unit address of the i2c node.
- Modify the description of "atmel,sensor-preferred".
- Add the description for the ISC internal clock.

Songjun Wu (2):
  [media] atmel-isc: add the Image Sensor Controller code
  [media] atmel-isc: DT binding for Image Sensor Controller driver

 .../devicetree/bindings/media/atmel-isc.txt        |  100 ++
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    2 +
 drivers/media/platform/atmel/Kconfig               |    9 +
 drivers/media/platform/atmel/Makefile              |    1 +
 drivers/media/platform/atmel/atmel-isc-regs.h      |  276 ++++
 drivers/media/platform/atmel/atmel-isc.c           | 1583 ++++++++++++++++++++
 7 files changed, 1972 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt
 create mode 100644 drivers/media/platform/atmel/Kconfig
 create mode 100644 drivers/media/platform/atmel/Makefile
 create mode 100644 drivers/media/platform/atmel/atmel-isc-regs.h
 create mode 100644 drivers/media/platform/atmel/atmel-isc.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
