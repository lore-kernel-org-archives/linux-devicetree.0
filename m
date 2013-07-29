From: Jason Cooper <jason@lakedaemon.net>
Subject: [RFC PATCH 0/2] impedance-matcher generic improvements
Date: Mon, 29 Jul 2013 21:23:59 +0000
Message-ID: <cover.1375131816.git.jason@lakedaemon.net>
References: <51F2A014.7000209@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51F2A014.7000209@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Mack <zonque@gmail.com>, Nicolas Pitre <nico@fluxnic.net>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: devicetree-discuss@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Daniel,

Here's a patch (plus a cscope target) to attempt to make the impedance-matcher
generic code.  Hopefully I'll have time to test tomorrow.  All I can say atm is
that it compiles cleanly with and without specifying an appended zImage.

Warning: the code in string.c is little better than psuedo-code, maybe not even
that good.  I'm posting this so if anyone else is inclined to work on this,
there's no need to duplicate effort.  And, I have a firm belief in the
motivating effects af posting half-assed code.  ;-)

Basic idea is to replace a device's stock kernel with this impedance-matcher.
Load the kernel and/or the devicetree blob to desired addresses.  Add
'loadaddrs=0xXXXXXXXX,0xYYYYYYYY' to the kernel's command line.  Or, if you are
appending, 'loadaddrs=appended,0xYYYYYYYY'.  First address is the location of
the kernel, second is the location of the dtb.

Then, for u-boot, 'bootm 0xZZZZZZZZ' where 0xZZZZZZZZ is the address of the
impedance-matcher.

For those interested, a public branch can be found at (prone to rebase!):

  git://git.infradead.org/users/jcooper/impedance-matcher.git master

Thomas,

You weren't in the original Cc: of this thread, I added you because this may
help with your shifting register base address issues.

thx,

Jason.

Jason Cooper (2):
  add cscope Makefile target
  WIP: Get kernel and dtb addresses from command line

 .gitignore |  1 +
 Makefile   | 31 ++++++++++------------
 atags.h    |  6 +++++
 board.c    | 88 --------------------------------------------------------------
 board.h    | 13 ----------
 led.c      | 54 --------------------------------------
 led.h      |  6 -----
 main.c     | 52 +++++++++++++++++++++----------------
 string.c   | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 string.h   |  8 ++++++
 10 files changed, 141 insertions(+), 201 deletions(-)
 delete mode 100644 board.c
 delete mode 100644 board.h
 delete mode 100644 led.c
 delete mode 100644 led.h
 create mode 100644 string.c
 create mode 100644 string.h

-- 
1.8.3.2
