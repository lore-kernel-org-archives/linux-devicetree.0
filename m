From: Laura Abbott <laura@labbott.name>
Subject: [PATCHv2 0/3] Devicetree bindings for Ion
Date: Mon, 16 Nov 2015 16:57:32 -0800
Message-ID: <1447721855-7574-1-git-send-email-laura@labbott.name>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Feng Tang <feng.tang@intel.com>, Tom Gall <tom.gall@linaro.org>, romlem@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Colin Cross <ccross@google.com>, John Stultz <john.stultz@linaro.org>, Grant Likely <grant.likely@linaro.org>, Laura Abbott <laura@labbott.name>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org



Hi,

This is another attempt at devicetree bindings for Ion. The big complaint from
v1 was that too much unnecessary data was being pushed into devicetree.
v2 takes a different approach of using just compatbile strings for the heaps.
This gets closer to the devicetree philosophy of describing just the hardware.
Each heap ultimately represents some kind of memory that exists in the system.
The compatible string indicates the match for how to handle the type of memory
on this system. The details like heap-id, name etc. are now pushed out to C
files. This makes Ion heaps look closer to something like a quirks framework.
(I'd argue this isn't a complete mischaracterization given the type of setup
Ion gets used for...) The one downside here is that this leads to more new
bindings for each board that gets added.

This version also includes a sample C file which shows what the structure
might look like. As always, your comments and reviews are appreciated.

Thanks,
Laura

Laura Abbott (3):
  ion: Devicetree bindings for Ion
  staging: ion: Add files for parsing the devicetree (WIP)
  NOMERGE: Sample driver

 drivers/staging/android/ion/Kconfig         |  16 +++
 drivers/staging/android/ion/Makefile        |   2 +
 drivers/staging/android/ion/devicetree.txt  |  50 +++++++++
 drivers/staging/android/ion/ion_of.c        | 168 ++++++++++++++++++++++++++++
 drivers/staging/android/ion/ion_of.h        |  35 ++++++
 drivers/staging/android/ion/ion_of_sample.c |  96 ++++++++++++++++
 6 files changed, 367 insertions(+)
 create mode 100644 drivers/staging/android/ion/devicetree.txt
 create mode 100644 drivers/staging/android/ion/ion_of.c
 create mode 100644 drivers/staging/android/ion/ion_of.h
 create mode 100644 drivers/staging/android/ion/ion_of_sample.c

-- 
2.5.0
