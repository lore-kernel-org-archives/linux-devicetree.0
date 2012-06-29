From: Richard Zhao <linuxzsc@gmail.com>
Subject: Re: [PATCH v9 00/14] add imx usb driver based on Greg next tree
Date: Fri, 29 Jun 2012 18:52:54 +0800
Message-ID: <02d626b8-b090-408a-b307-17ebe354aa37@email.android.com>
References: <1340963342-28735-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6009317761957754383=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1340963342-28735-1-git-send-email-richard.zhao@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Richard Zhao <richard.zhao@freescale.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: marex@denx.de, B20596@freescale.com, dong.aisheng@linaro.org, fabio.estevam@freescale.com, alexander.shishkin@linux.intel.com, B29397@freescale.com, balbi@ti.com, stern@rowland.harvard.edu, kernel@pengutronix.de, gregkh@linuxfoundation.org, mkl@pengutronix.de, shawn.guo@linaro.org
List-Id: devicetree@vger.kernel.org

--===============6009317761957754383==
Content-Type: multipart/alternative; boundary="----GYM8GTPO72KZQL3PMBM2NKS0M9GH4M"

------GYM8GTPO72KZQL3PMBM2NKS0M9GH4M
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit

It is v9. Sorry for mistake.
-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.

Richard Zhao <richard.zhao@freescale.com> wrote:

The work is based on ci13xxx rework done by Alexander Shishkin.

To let Greg pick up, I also added patches Alex queued that I depends on.

This patch series can also be found at:
https://github.com/riczhao/kernel-imx/commits/topics/usb-driver

Status:
- this version only support host
- usbotg controler works at host role

Changes since last version:
- mxs_phy: fix build warnings
- ci13xxx_imx: add pm_runtime_disable at exit path

Alexander Shishkin (1):
usb: chipidea: remove unneeded NULL check

Felipe Balbi (3):
usb: chipidea: drop useless arch-check
usb: chipidea: msm: add missing section annotation
usb: chipidea: msm: add remove method

Richard Zhao (10):
USB: Chipidea: rename struct ci13xxx_udc_driver to struct
ci13xxx_platform_data
USB: Chipidea: rename struct ci13xxx variables from udc to ci
USB: Chipidea: add unified ci13xxx_{add,remove}_device for platform
drivers
USB: Chipidea: add ci13xxx device id management
usb: chipidea: select USB_EHCI_ROOT_HUB_TT in USB_CHIPIDEA_HOST of
Kconfig
usb: otg: add notify_connect/notify_disconnect callback
USB: notify phy when root hub port connect change
usb: chipidea: permit driver bindings pass phy pointer
usb: otg: add basic mxs phy driver support
usb: chipidea: add imx platform driver

.../devicetree/bindings/usb/ci13xxx-imx.txt | 18 +
Documentation/devicetree/bindings/usb/mxs-phy.txt | 13 +
drivers/usb/chipidea/Kconfig | 1 +
drivers/usb/chipidea/Makefile | 9 +-
drivers/usb/chipidea/ci.h | 32 +-
drivers/usb/chipidea/ci13xxx_imx.c | 198 ++++++
drivers/usb/chipidea/ci13xxx_msm.c | 63 +-
drivers/usb/chipidea/ci13xxx_pci.c | 52 +-
drivers/usb/chipidea/core.c | 70 ++-
drivers/usb/chipidea/debug.c | 146 ++---
drivers/usb/chipidea/host.c | 3 +-
drivers/usb/chipidea/udc.c | 634 ++++++++++----------
drivers/usb/core/hub.c | 8 +
drivers/usb/otg/Kconfig | 10 +
drivers/usb/otg/Makefile | 1 +
drivers/usb/otg/mxs-phy.c | 186 ++++++
include/linux/usb/chipidea.h | 14 +-
include/linux/usb/otg.h | 21 +
18 files changed, 989 insertions(+), 490 deletions(-)
create mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
create mode 100644 Documentation/devicetree/bindings/usb/mxs-phy.txt
create mode 100644 drivers/usb/chipidea/ci13xxx_imx.c
create mode 100644 drivers/usb/otg/mxs-phy.c

-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at http://vger.kernel.org/majordomo-info.html


------GYM8GTPO72KZQL3PMBM2NKS0M9GH4M
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head></head><body>It is v9. Sorry for mistake.<br>
-- <br>
Sent from my Android phone with K-9 Mail. Please excuse my brevity.<br><br><div class="gmail_quote">Richard Zhao &lt;richard.zhao@freescale.com&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre style="white-space: pre-wrap; word-wrap:break-word; font-family: monospace">The work is based on  ci13xxx rework done by Alexander Shishkin.<br /><br />To let Greg pick up, I also added patches Alex queued that I depends on.<br /><br />This patch series can also be found at:<br /><a href="https://github.com/riczhao/kernel-imx/commits/topics/usb-driver">https://github.com/riczhao/kernel-imx/commits/topics/usb-driver</a><br /><br />Status:<br />  - this version only support host<br />  - usbotg controler works at host role<br /><br />Changes since last version:<br /> - mxs_phy: fix build warnings<br /> - ci13xxx_imx: add pm_runtime_disable at exit path<br /><br />Alexander Shishkin (1):<br />  usb: chipidea: remove unneeded NULL check<br /><br />Felipe Balbi (3):<br />  usb: chipidea: d
 rop useless arch-check<br />  usb: chipidea: msm: add missing section annotation<br />  usb: chipidea: msm: add remove method<br /><br />Richard Zhao (10):<br />  USB: Chipidea: rename struct
ci13xxx_udc_driver to struct<br />    ci13xxx_platform_data<br />  USB: Chipidea: rename struct ci13xxx variables from udc to ci<br />  USB: Chipidea: add unified ci13xxx_{add,remove}_device for platform<br />    drivers<br />  USB: Chipidea: add ci13xxx device id management<br />  usb: chipidea: select USB_EHCI_ROOT_HUB_TT in USB_CHIPIDEA_HOST of<br />    Kconfig<br />  usb: otg: add notify_connect/notify_disconnect callback<br />  USB: notify phy when root hub port connect change<br />  usb: chipidea: permit driver bindings pass phy pointer<br />  usb: otg: add basic mxs phy driver support<br />  usb: chipidea: add imx platform driver<br /><br /> .../devicetree/bindings/usb/ci13xxx-imx.txt        |   18 +<br /> Documentation/devicetree/bindings/usb/mxs-phy.txt  |   13 +<br /> drivers/usb
 /chipidea/Kconfig                       |    1 +<br /> drivers/usb/chipidea/Makefile                      |    9 +-<br /> drivers/usb/chipidea/ci.h                          |   32 +-<br />
drivers/usb/chipidea/ci13xxx_imx.c                 |  198 ++++++<br /> drivers/usb/chipidea/ci13xxx_msm.c                 |   63 +-<br /> drivers/usb/chipidea/ci13xxx_pci.c                 |   52 +-<br /> drivers/usb/chipidea/core.c                        |   70 ++-<br /> drivers/usb/chipidea/debug.c                       |  146 ++---<br /> drivers/usb/chipidea/host.c                        |    3 +-<br /> drivers/usb/chipidea/udc.c                         |  634 ++++++++++----------<br /> drivers/usb/core/hub.c                             |    8 +<br /> drivers/usb/otg/Kconfig                            |   10 +<br /> drivers/usb/otg/Makefile                           |    1 +<br /> drivers/usb/otg/mxs-phy.c                          |  186 ++++++<br /> include/linux/usb/chipidea.h        
                |   14 +-<br /> include/linux/usb/otg.h                            |   21 +<br /> 18 files changed, 989 insertions(+), 490 deletions(-)<br /> create mode 100644
Documentation/devicetree/bindings/usb/ci13xxx-imx.txt<br /> create mode 100644 Documentation/devicetree/bindings/usb/mxs-phy.txt<br /> create mode 100644 drivers/usb/chipidea/ci13xxx_imx.c<br /> create mode 100644 drivers/usb/otg/mxs-phy.c<br /><br />-- <br /><a href="http://1.7.9.5">1.7.9.5</a><br /><br /><br />--<br />To unsubscribe from this list: send the line "unsubscribe linux-usb" in<br />the body of a message to majordomo@vger.kernel.org<br />More majordomo info at  <a href="http://vger.kernel.org/majordomo-info.html">http://vger.kernel.org/majordomo-info.html</a><br /></pre></blockquote></div></body></html>
------GYM8GTPO72KZQL3PMBM2NKS0M9GH4M--



--===============6009317761957754383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6009317761957754383==--
