From: =?gb2312?B?Q2h1bnlhbiBaaGFuZyAo1cW0utHeKQ==?=
 <Chunyan.Zhang@spreadtrum.com>
Subject: [PATCH v8 0/2] Add Spreadtrum Sharkl64 Platform support
Date: Wed, 11 Mar 2015 02:27:08 +0000
Message-ID: <1426040790-19495-1-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "arm@kernel.org" <arm@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

This patchset adds Spreadtrum's Sharkl64 support in arm64 device tree.

Changes from v7:
	- Added Mark Rutland's Acked-by
	- Rebased v4.0-rc1

Changes from v6:
	- Setted stdout-path with "serial1:115200n8"

Changes from v5:
	- Added maintenance interrupt for gic
	- Removed reg property from 'soc' and 'apb' nodes


Zhizhou Zhang (2):
  arm64: dts: Add support for Spreadtrum SC9836 SoC in dts and Makefile
  arm64: Add support for Spreadtrum's Sharkl64 Platform in Kconfig and
    defconfig

 arch/arm64/Kconfig                            |  5 ++
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sprd/Makefile             |  5 ++
 arch/arm64/boot/dts/sprd/sc9836-openphone.dts | 49 ++++++++++++++++++
 arch/arm64/boot/dts/sprd/sc9836.dtsi          | 74 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/sprd/sharkl64.dtsi        | 65 +++++++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 7 files changed, 200 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sprd/Makefile
 create mode 100644 arch/arm64/boot/dts/sprd/sc9836-openphone.dts
 create mode 100644 arch/arm64/boot/dts/sprd/sc9836.dtsi
 create mode 100644 arch/arm64/boot/dts/sprd/sharkl64.dtsi

-- 
1.9.1
