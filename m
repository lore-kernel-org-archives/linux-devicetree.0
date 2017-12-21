From: Dhaval Shah <dhaval.shah@xilinx.com>
Subject: [PATCH v6 0/2] Documentation and driver of logicoreIP
Date: Thu, 21 Dec 2017 10:33:04 -0800
Message-ID: <1513881186-26020-1-git-send-email-dshah@xilinx.com>
References: <CAK8P3a0z6HF8Rg08HUj7_T+7ZxxnHoReiu68bNzF6CnEooQSdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a0z6HF8Rg08HUj7_T+7ZxxnHoReiu68bNzF6CnEooQSdA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, rdunlap@infradead.org, gregkh@linuxfoundation.org, pombredanne@nexb.com, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com
Cc: devicetree@vger.kernel.org, hyunk@xilinx.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dhaval Shah <dshah@xilinx.com>
List-Id: devicetree@vger.kernel.org

1st patch provide Device Tree binding document for logicoreIP
2nd patch provide the xlnx_vcu logicoreIP driver, Kconfig changes
and Makefile changes for the driver.

Dhaval Shah (2):
  dt-bindings: misc: Add DT bindings to xlnx_vcu driver
  misc: xlnx_vcu: Add Xilinx ZYNQMP VCU logicoreIP init driver

 .../devicetree/bindings/soc/xilinx/xlnx,vcu.txt    |  31 +
 drivers/soc/xilinx/Kconfig                         |  15 +
 drivers/soc/xilinx/Makefile                        |   1 +
 drivers/soc/xilinx/xlnx_vcu.c                      | 630 +++++++++++++++++++++
 4 files changed, 677 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
 create mode 100644 drivers/soc/xilinx/xlnx_vcu.c

-- 
2.7.4
