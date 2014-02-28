From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/3] soc: Introduce drivers/soc and add Keystone QMSS driver
Date: Fri, 28 Feb 2014 18:18:37 -0500
Message-ID: <1393629520-12713-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Based on earlier thread "https://lkml.org/lkml/2013/10/7/662" and
further discussion at Kernel Summit'2013, series creates 'driver/soc'
for drivers which are very SOC specific.

Then we add the Keystone QMSS (Queue Manager SubSystem) driver.
The QMSS found on Keystone SOCs is one of the main hardware sub
system which forms the backbone of the Keystone Multi-core Navigator.
QMSS consist of queue managers, packed-data structure processors(PDSP),
linking RAM, descriptor pools and infrastructure DMA.

Sandeep Nair (2):
  soc: keystone: add QMSS driver
  firmware: add Keystone QMSS PDSP accumulator firmware blob

Santosh Shilimkar (1):
  soc: Introduce drivers/soc place-holder for SOC specific drivers

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>
Cc: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>

 .../devicetree/bindings/soc/keystone-qmss.txt      |  209 +++
 drivers/Kconfig                                    |    4 +
 drivers/Makefile                                   |    7 +
 drivers/soc/Kconfig                                |    5 +
 drivers/soc/Makefile                               |    5 +
 drivers/soc/keystone/Kconfig                       |   15 +
 drivers/soc/keystone/Makefile                      |    5 +
 drivers/soc/keystone/qmss_acc.c                    |  591 ++++++++
 drivers/soc/keystone/qmss_queue.c                  | 1533 ++++++++++++++++++++
 drivers/soc/keystone/qmss_queue.h                  |  236 +++
 firmware/Makefile                                  |    1 +
 .../keystone/qmss_pdsp_acc48_k2_le_1_0_0_8.fw.ihex |  110 ++
 include/linux/soc/keystone_qmss.h                  |  390 +++++
 13 files changed, 3111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/keystone-qmss.txt
 create mode 100644 drivers/soc/Kconfig
 create mode 100644 drivers/soc/Makefile
 create mode 100644 drivers/soc/keystone/Kconfig
 create mode 100644 drivers/soc/keystone/Makefile
 create mode 100644 drivers/soc/keystone/qmss_acc.c
 create mode 100644 drivers/soc/keystone/qmss_queue.c
 create mode 100644 drivers/soc/keystone/qmss_queue.h
 create mode 100644 firmware/keystone/qmss_pdsp_acc48_k2_le_1_0_0_8.fw.ihex
 create mode 100644 include/linux/soc/keystone_qmss.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
