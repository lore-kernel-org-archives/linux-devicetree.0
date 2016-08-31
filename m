From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv3 0/3] Devicetree bindings for Ion
Date: Tue, 30 Aug 2016 17:04:26 -0700
Message-ID: <1472601869-19469-1-git-send-email-labbott@redhat.com>
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
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, Andrew Andrianov <andrew@ncrmnt.org>, arve@android.com, Riley Andrews <riandrews@android.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tom Gall <tom.gall@linaro.org>, romlem@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Colin Cross <ccross@google.com>, Bryan Huntsman <bryanh@codeaurora.org>, John Stultz <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

This is a long overdue resend and slight update from the last version[1] of
Ion devicetree bindings.

The goal here is to keep the Ion bindings minimalist. I experimented with
dropping all but a dummy devicetree node and just matching on the machine
name in the platform file. This ends up being a nightmare for the DMA (i.e. CMA)
heap type. That heap requires a device structure to do its allocation and
setting up a device structure properly isn't pretty. I have other ideas for
working with that heap if this gets NAKed.

I've thought about the idea of a devicetree overlay for specifying more
platform configuration but that a) requires Android actually load the overlay
at the right time in the framework and b) opens up an entirely new can of
worms.

In conclusion, if we assume that Ion platform support is something anyone
actually wants, this is still the least bad and intrusive idea I've come up
with. There exists hisilicon Ion code but it came in without being fully acked.
I've converted it over as an example of how it might look.

As always, feedback appreciated.

Thanks,
Laura

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/385452.html

Laura Abbott (3):
  devicetree: bindings for Ion
  staging: ion: Add files for parsing the devicetree
  staging: android: ion: Convert hi6220 to common platform

 drivers/staging/android/ion/Kconfig                |  11 ++
 drivers/staging/android/ion/Makefile               |   1 +
 drivers/staging/android/ion/devicetree.txt         |  51 ++++++
 drivers/staging/android/ion/hisilicon/hi6220_ion.c | 192 +++++----------------
 drivers/staging/android/ion/ion_of.c               | 168 ++++++++++++++++++
 drivers/staging/android/ion/ion_of.h               |  35 ++++
 6 files changed, 306 insertions(+), 152 deletions(-)
 create mode 100644 drivers/staging/android/ion/devicetree.txt
 create mode 100644 drivers/staging/android/ion/ion_of.c
 create mode 100644 drivers/staging/android/ion/ion_of.h

-- 
2.7.4
