From: Loc Ho <lho@apm.com>
Subject: [PATCH v2 0/3] edac: xgene: Add missing SoC register bus error
 handling and fix CE promotes to UE
Date: Tue, 19 Jan 2016 17:46:49 -0700
Message-ID: <1453250812-15097-1-git-send-email-lho@apm.com>
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
To: bp@alien8.de, dougthompson@xmission.com, mchehab@osg.samsung.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, patches@apm.com, Loc Ho <lho@apm.com>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add missing register bus error handling for SoC and fix an checking
condition for CE error promotes to UE. DT binding and documentation are
also updated.

v2:
* Make the register bus resource optional
* Update DT binding accordinlgy

---
Loc Ho (3):
  Documentation: Update the APM X-Gene SoC EDAC DTS binding for missing
    RB
  edac: xgene: Add missing SoC register bus error handling and fix CE
    promotes to UE
  arm64: Update the APM X-Gene EDAC node with the RB register resource

 .../devicetree/bindings/edac/apm-xgene-edac.txt    |   12 ++++
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |    6 ++
 drivers/edac/xgene_edac.c                          |   70 +++++++++++++++++++-
 3 files changed, 87 insertions(+), 1 deletions(-)
