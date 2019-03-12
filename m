From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 0/2] L2 Cache EDAC Support for HiFive Unleashed
Date: Tue, 12 Mar 2019 14:50:59 +0530
Message-ID: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, bp@alien8.de, mchehab@kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds a L2 Cache EDAC driver and DT documentation
for HiFive Unleashed board.

Yash Shah (2):
  edac: sifive: Add DT documentation for SiFive L2 cache Controller
  sifive: edac: Add EDAC driver for Sifive l2 Cache Controller

 .../devicetree/bindings/edac/sifive-edac-l2.txt    |  31 +++
 arch/riscv/Kconfig                                 |   1 +
 drivers/edac/Kconfig                               |   7 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/sifive_edac-l2.c                      | 292 +++++++++++++++++++++
 5 files changed, 332 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
 create mode 100644 drivers/edac/sifive_edac-l2.c

-- 
1.9.1
