From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v2 0/5] ARM: dts: da850-evm/lcdk: Fixes for audio descriptions
Date: Wed, 19 Dec 2018 13:47:22 +0200
Message-ID: <20181219114727.6865-1-peter.ujfalusi@ti.com>
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
To: nsekhar@ti.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Changes since v1s (regulator fixes):
- Card name fixes
- analog mic support for da850-lcdk

The series fixes warnings regarding to regulator voltages and debugfs directory
creation.

Regards,
Peter
---
Peter Ujfalusi (5):
  ARM: dts: da850-evm: Correct the audio codec regulators
  ARM: dts: da850-evm: Correct the sound card name
  ARM: dts: da850-lcdk: Correct the audio codec regulators
  ARM: dts: da850-lcdk: Correct the sound card name
  ARM: dts: da850-lcdk: Enable the analog mic input

 arch/arm/boot/dts/da850-evm.dts  | 31 +++++++++++++++++----
 arch/arm/boot/dts/da850-lcdk.dts | 48 ++++++++++++++++++++++++++++++--
 2 files changed, 71 insertions(+), 8 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
