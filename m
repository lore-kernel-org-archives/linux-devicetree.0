From: Darshana Padmadas <darshanapadmadas@gmail.com>
Subject: [PATCH v5 0/4] Correct vendor-prefix and document device isl29028
Date: Sat,  8 Nov 2014 22:52:04 +0530
Message-ID: <1415467328-9745-1-git-send-email-darshanapadmadas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: devicetree@vger.kernel.org
Cc: devel@driverdev.osuosl.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, opw-kernel@googlegroups.com, Darshana Padmadas <darshanapadmadas@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Patchset documents correct and the deprecated vendor-prefix found by checkpatch
warning and also documents information of device isl29028 for compatibility.
Patchset also includes corrected vendor-prefix and device name in compatible
property for files with checkpatch warning of undocumented string "isil,isl29028".

Darshana Padmadas (4):
  dt-bindings: Document correct and deprecated vendor-prefix with device
    isl29028
  dt-bindings: Document deprecated device vendor name to fix related
    warning
  Staging: iio: light: Added correct vendor-prefix for device isl29028
  arch: arm: boot: dts: Correct vendor-prefix for iio device isl29028 in
    compatible property

Changes in v5:
    - Shortened subject in PATCH 1/4 and PATCH 2/4.

 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.txt     | 1 +
 drivers/staging/iio/light/isl29028.c                      | 3 ++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi                     | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.9.1
