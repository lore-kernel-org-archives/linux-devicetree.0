From: Florian Larysch <fl@n621.de>
Subject: [PATCH v2 0/2] T4240RBD: add device tree entry for W83793
Date: Thu, 17 Nov 2016 11:23:22 +0100
Message-ID: <20161117102324.18319-1-fl@n621.de>
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Scott Wood <oss@buserror.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Florian Larysch <fl@n621.de>
List-Id: devicetree@vger.kernel.org

v2:
 - Ordered DT nodes by address
 - Added an entry for the chip to the trivial-devices list

Florian Larysch (2):
  powerpc/dts: add device tree entry for W83793 on T4240RDB
  DT: i2c: W83793 is a trivial device

 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 1 +
 arch/powerpc/boot/dts/fsl/t4240rdb.dts                    | 4 ++++
 2 files changed, 5 insertions(+)

-- 
2.10.2
