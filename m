From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v2 0/5] constify struct imx_pinctrl_soc_info
Date: Sat,  6 Jan 2018 15:25:48 +0100
Message-ID: <20180106142553.15322-1-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset grew out of the discussion around the first version
of "pinctrl: imx6ul: add IOMUXC SNVS pinctrl driver for i.MX 6ULL".
This is necessary for pinctrls of SoCs with multiple compatible
strings (currently only imx7d) since the struct uses the .data
pointer in struct of_device_id. It is also helpful for all other
SoCs since it decreases the .data section for all drivers by 1276
bytes.

Bai Ping (1):
  pinctrl: imx6ul: add IOMUXC SNVS pinctrl driver for i.MX 6ULL

Stefan Agner (4):
  pinctrl: imx: use struct imx_pinctrl_soc_info as a const
  pinctrl: imx7d: simplify imx7d_pinctrl_probe
  pinctrl: imx: constify struct imx_pinctrl_soc_info
  pinctrl: imx7ulp: constify struct imx_cfg_params_decode

 .../bindings/pinctrl/fsl,imx6ul-pinctrl.txt        |  3 +-
 drivers/pinctrl/freescale/pinctrl-imx.c            | 81 ++++++++++------------
 drivers/pinctrl/freescale/pinctrl-imx.h            | 13 ++--
 drivers/pinctrl/freescale/pinctrl-imx25.c          |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx35.c          |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx50.c          |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx51.c          |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx53.c          |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx6dl.c         |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx6q.c          |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx6sl.c         |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx6sx.c         |  2 +-
 drivers/pinctrl/freescale/pinctrl-imx6ul.c         | 52 ++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx7d.c          | 10 +--
 drivers/pinctrl/freescale/pinctrl-imx7ulp.c        |  7 +-
 drivers/pinctrl/freescale/pinctrl-vf610.c          |  5 +-
 16 files changed, 111 insertions(+), 78 deletions(-)

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
