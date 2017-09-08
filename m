From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2 0/2] ARM: dts: keystone-k2g-evm: Add I2C nodes and enable
 I2C0 on K2G EVM
Date: Fri, 8 Sep 2017 13:21:40 -0500
Message-ID: <20170908182142.5274-1-fcooper@ti.com>
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
To: ssantosh@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vigneshr@ti.com, nsekhar@ti.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
List-Id: devicetree@vger.kernel.org

Add I2C DT nodes for 66AK2G. Also enable I2C0 in K2G EVM which is needed
to access the I2C EEPROM. 

Version 2 changes:
No real changes. Split patches into their own patchset

Murali Karicheri (1):
  ARM: dts: keystone-k2g-evm: Add I2C EEPROM DT entry

Vitaly Andrianov (1):
  ARM: dts: keystone-k2g: Add I2C nodes

 arch/arm/boot/dts/keystone-k2g-evm.dts | 19 ++++++++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi    | 36 ++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

-- 
2.9.4.dirty
