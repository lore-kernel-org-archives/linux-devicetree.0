Return-Path: <mchehab@osg.samsung.com>
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH v4 29/29] docs-rst: move HOWTO and mentioned documents to development-process/
Date: Mon, 19 Sep 2016 08:08:03 -0300
Message-Id: <e05d7a0ad23f6ec723b572f217e2ecc1f6123d1d.1474280152.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1474280152.git.mchehab@s-opensource.com>
References: <cover.1474280152.git.mchehab@s-opensource.com>
MIME-Version: 1.0
In-Reply-To: <cover.1474280152.git.mchehab@s-opensource.com>
References: <cover.1474280152.git.mchehab@s-opensource.com>
Content-Type: text/plain; charset=true
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Markus Heiser <markus.heiser@darmarit.de>, Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Karsten Keil <isdn@linux-pingi.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Wim Van Sebroeck <wim@iguana.be>, Harry Wei <harryxiyou@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>, "David S. Miller" <davem@davemloft.net>, Shuah Khan <shuah@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Loctaux <phil@philippeloctaux.com>, Peter Loeffler <peter.loeffler@guruz.at>, Doug Smythies <doug.smythies@gmail.com>, Alex Henrie <alexhenrie24@gmail.com>, Chris Metcalf <cmetcalf@ezchip.com>, Jakub Wilk <jwilk@jwilk.net>, Darren Hart <dvhart@infradead.org>, Eddie Kovsky <ewk@edkovsky.org>, Luis de Bethencourt <luisbg@osg.samsung.com>, Richard Weinberger <richard@nod.at>, SeongJae Park <sj38.park@gmail.com>, Masanari Iida <standby24x7@gmail.com>, Minchan Kim <minchan@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Kalle Valo <kvalo@codeaurora.org>, Diego Viola <diego.viola@gmail.com>, =?UTF-8?q?=C3=98yvind=20A=2E=20Holm?= <sunny@sunbase.org>, =?UTF-8?q?Manuel=20P=C3=A9gouri=C3=A9-Gonnard?= <mpg@elzevir.fr>, Jiri Kosina <jikos@kernel.org>, Alexander Kapshuk <alexander.kapshuk@gmail.com>, Wei Jiangang <weijg.fnst@cn.fujitsu.com>, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, netdev@vger.kernel.org, stable@vger.kernel.org, kvm@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@zh-kernel.org, linux-pcmcia@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

In preparation to add those files to the Sphinx build logic,
move them to development-process/ dir and rename their extension
to RST.

Please notice that the main README file was not moved. It
probably makes sense to move it too as well, in order to be
able to parse it via Sphinx, but this could be counter-intuitive.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/ABI/README                           |  2 +-
 Documentation/BUG-HUNTING                          |  2 +-
 Documentation/DocBook/kernel-hacking.tmpl          |  4 ++--
 Documentation/adding-syscalls.txt                  |  2 +-
 Documentation/development-process/4.Coding.rst     |  2 +-
 Documentation/development-process/5.Posting.rst    |  4 ++--
 .../{Changes => development-process/Changes.rst}   |  0
 .../CodingStyle.rst}                               |  0
 .../{HOWTO => development-process/HOWTO.rst}       | 22 ++++++++---------
 .../ManagementStyle.rst}                           |  0
 .../SecurityBugs.rst}                              |  0
 .../SubmitChecklist.rst}                           | 10 ++++----
 .../SubmittingDrivers.rst}                         |  9 +++----
 .../SubmittingPatches.rst}                         | 26 ++++++++++++--------
 .../applying-patches.rst}                          |  0
 .../development-process/development-process.rst    |  2 ++
 .../email-clients.rst}                             |  2 ++
 Documentation/development-process/index.rst        | 20 ++++++++++++++++
 .../kernel-docs.rst}                               |  0
 .../stable_api_nonsense.rst}                       |  0
 .../stable_kernel_rules.rst}                       |  7 ++++--
 .../devicetree/bindings/submitting-patches.txt     |  2 +-
 Documentation/filesystems/locks.txt                |  2 +-
 Documentation/hwmon/submitting-patches             |  8 +++----
 Documentation/isdn/README                          |  2 +-
 Documentation/ja_JP/HOWTO                          | 28 +++++++++++-----------
 Documentation/ja_JP/SubmitChecklist                |  6 ++---
 Documentation/ja_JP/SubmittingPatches              | 16 ++++++-------
 Documentation/ja_JP/stable_api_nonsense.txt        |  4 ++--
 Documentation/ja_JP/stable_kernel_rules.txt        |  6 ++---
 Documentation/ko_KR/HOWTO                          | 28 +++++++++++-----------
 Documentation/ko_KR/stable_api_nonsense.txt        |  4 ++--
 Documentation/networking/PLIP.txt                  |  2 +-
 Documentation/networking/netdev-FAQ.txt            |  8 +++----
 Documentation/scsi/scsi_mid_low_api.txt            |  2 +-
 Documentation/virtual/kvm/review-checklist.txt     |  4 ++--
 .../watchdog/convert_drivers_to_kernel_api.txt     |  2 +-
 Documentation/zh_CN/CodingStyle                    |  4 ++--
 Documentation/zh_CN/HOWTO                          | 28 +++++++++++-----------
 Documentation/zh_CN/SecurityBugs                   |  4 ++--
 Documentation/zh_CN/SubmittingDrivers              |  8 +++----
 Documentation/zh_CN/SubmittingPatches              | 12 +++++-----
 Documentation/zh_CN/stable_api_nonsense.txt        |  4 ++--
 Documentation/zh_CN/stable_kernel_rules.txt        |  6 ++---
 MAINTAINERS                                        |  2 +-
 README                                             |  4 ++--
 REPORTING-BUGS                                     |  2 +-
 drivers/net/ppp/Kconfig                            |  2 +-
 drivers/pcmcia/Kconfig                             |  2 +-
 fs/Kconfig.binfmt                                  |  2 +-
 fs/fuse/Kconfig                                    |  2 +-
 net/Kconfig                                        |  4 ++--
 scripts/ver_linux                                  |  2 +-
 tools/testing/selftests/futex/README               |  2 +-
 54 files changed, 182 insertions(+), 146 deletions(-)
 rename Documentation/{Changes => development-process/Changes.rst} (100%)
 rename Documentation/{CodingStyle => development-process/CodingStyle.rst} (100%)
 rename Documentation/{HOWTO => development-process/HOWTO.rst} (96%)
 rename Documentation/{ManagementStyle => development-process/ManagementStyle.rst} (100%)
 rename Documentation/{SecurityBugs => development-process/SecurityBugs.rst} (100%)
 rename Documentation/{SubmitChecklist => development-process/SubmitChecklist.rst} (93%)
 rename Documentation/{SubmittingDrivers => development-process/SubmittingDrivers.rst} (96%)
 rename Documentation/{SubmittingPatches => development-process/SubmittingPatches.rst} (97%)
 rename Documentation/{applying-patches.txt => development-process/applying-patches.rst} (100%)
 rename Documentation/{email-clients.txt => development-process/email-clients.rst} (99%)
 rename Documentation/{kernel-docs.txt => development-process/kernel-docs.rst} (100%)
 rename Documentation/{stable_api_nonsense.txt => development-process/stable_api_nonsense.rst} (100%)
 rename Documentation/{stable_kernel_rules.txt => development-process/stable_kernel_rules.rst} (96%)

diff --git a/Documentation/ABI/README b/Documentation/ABI/README
index 1fafc4b0753b..232cade3a59c 100644
--- a/Documentation/ABI/README
+++ b/Documentation/ABI/README
@@ -84,4 +84,4 @@ stable:
 
 - Kernel-internal symbols.  Do not rely on the presence, absence, location, or
   type of any kernel symbol, either in System.map files or the kernel binary
-  itself.  See Documentation/stable_api_nonsense.txt.
+  itself.  See Documentation/development-process/stable_api_nonsense.rst.
diff --git a/Documentation/BUG-HUNTING b/Documentation/BUG-HUNTING
index 65022a87bf17..e0e4637fb30a 100644
--- a/Documentation/BUG-HUNTING
+++ b/Documentation/BUG-HUNTING
@@ -242,5 +242,5 @@ Once you have worked out a fix please submit it upstream. After all open
 source is about sharing what you do and don't you want to be recognised for
 your genius?
 
-Please do read Documentation/SubmittingPatches though to help your code get
+Please do read Documentation/development-process/SubmittingPatches.rst though to help your code get
 accepted.
diff --git a/Documentation/DocBook/kernel-hacking.tmpl b/Documentation/DocBook/kernel-hacking.tmpl
index 589b40cc5eb5..562c0648738e 100644
--- a/Documentation/DocBook/kernel-hacking.tmpl
+++ b/Documentation/DocBook/kernel-hacking.tmpl
@@ -1208,8 +1208,8 @@ static struct block_device_operations opt_fops = {
    
    <listitem>
     <para>
-     Finally, don't forget to read <filename>Documentation/SubmittingPatches</filename>
-     and possibly <filename>Documentation/SubmittingDrivers</filename>.
+     Finally, don't forget to read <filename>Documentation/development-process/SubmittingPatches.rst</filename>
+     and possibly <filename>Documentation/development-process/SubmittingDrivers.rst</filename>.
     </para>
    </listitem>
   </itemizedlist>
diff --git a/Documentation/adding-syscalls.txt b/Documentation/adding-syscalls.txt
index bbb31e091b28..7dd00b344844 100644
--- a/Documentation/adding-syscalls.txt
+++ b/Documentation/adding-syscalls.txt
@@ -3,7 +3,7 @@ Adding a New System Call
 
 This document describes what's involved in adding a new system call to the
 Linux kernel, over and above the normal submission advice in
-Documentation/SubmittingPatches.
+Documentation/development-process/SubmittingPatches.rst.
 
 
 System Call Alternatives
diff --git a/Documentation/development-process/4.Coding.rst b/Documentation/development-process/4.Coding.rst
index 9d5cef996f7f..a52465835c7b 100644
--- a/Documentation/development-process/4.Coding.rst
+++ b/Documentation/development-process/4.Coding.rst
@@ -22,7 +22,7 @@ Coding style
 ************
 
 The kernel has long had a standard coding style, described in
-Documentation/CodingStyle.  For much of that time, the policies described
+Documentation/development-process/CodingStyle.rst.  For much of that time, the policies described
 in that file were taken as being, at most, advisory.  As a result, there is
 a substantial amount of code in the kernel which does not meet the coding
 style guidelines.  The presence of that code leads to two independent
diff --git a/Documentation/development-process/5.Posting.rst b/Documentation/development-process/5.Posting.rst
index 945d40200538..7b0d07d2a1f9 100644
--- a/Documentation/development-process/5.Posting.rst
+++ b/Documentation/development-process/5.Posting.rst
@@ -210,7 +210,7 @@ The tags in common use are:
  - Signed-off-by: this is a developer's certification that he or she has
    the right to submit the patch for inclusion into the kernel.  It is an
    agreement to the Developer's Certificate of Origin, the full text of
-   which can be found in Documentation/SubmittingPatches.  Code without a
+   which can be found in Documentation/development-process/SubmittingPatches.rst.  Code without a
    proper signoff cannot be merged into the mainline.
 
  - Acked-by: indicates an agreement by another developer (often a
@@ -221,7 +221,7 @@ The tags in common use are:
    it to work.
 
  - Reviewed-by: the named developer has reviewed the patch for correctness;
-   see the reviewer's statement in Documentation/SubmittingPatches for more
+   see the reviewer's statement in Documentation/development-process/SubmittingPatches.rst for more
    detail.
 
  - Reported-by: names a user who reported a problem which is fixed by this
diff --git a/Documentation/Changes b/Documentation/development-process/Changes.rst
similarity index 100%
rename from Documentation/Changes
rename to Documentation/development-process/Changes.rst
diff --git a/Documentation/CodingStyle b/Documentation/development-process/CodingStyle.rst
similarity index 100%
rename from Documentation/CodingStyle
rename to Documentation/development-process/CodingStyle.rst
diff --git a/Documentation/HOWTO b/Documentation/development-process/HOWTO.rst
similarity index 96%
rename from Documentation/HOWTO
rename to Documentation/development-process/HOWTO.rst
index adde88a6d9c4..9898ef930223 100644
--- a/Documentation/HOWTO
+++ b/Documentation/development-process/HOWTO.rst
@@ -90,19 +90,19 @@ required reading:
     what is necessary to do to configure and build the kernel.  People
     who are new to the kernel should start here.
 
-  :ref:`Documentation/Changes <changes>`
+  :ref:`Documentation/development-process/Changes.rst <changes>`
     This file gives a list of the minimum levels of various software
     packages that are necessary to build and run the kernel
     successfully.
 
-  :ref:`Documentation/CodingStyle <codingstyle>`
+  :ref:`Documentation/development-process/CodingStyle.rst <codingstyle>`
     This describes the Linux kernel coding style, and some of the
     rationale behind it. All new code is expected to follow the
     guidelines in this document. Most maintainers will only accept
     patches if these rules are followed, and many people will only
     review code if it is in the proper style.
 
-  :ref:`Documentation/SubmittingPatches <submittingpatches>` and :ref:`Documentation/SubmittingDrivers <submittingdrivers>`
+  :ref:`Documentation/development-process/SubmittingPatches.rst <submittingpatches>` and :ref:`Documentation/development-process/SubmittingDrivers.rst <submittingdrivers>`
     These files describe in explicit detail how to successfully create
     and send a patch, including (but not limited to):
 
@@ -122,7 +122,7 @@ required reading:
 	"Linux kernel patch submission format"
 		http://linux.yyz.us/patch-format.html
 
-  :ref:`Documentation/stable_api_nonsense.txt <stable_api_nonsense>`
+  :ref:`Documentation/development-process/stable_api_nonsense.rst <stable_api_nonsense>`
     This file describes the rationale behind the conscious decision to
     not have a stable API within the kernel, including things like:
 
@@ -135,29 +135,29 @@ required reading:
     philosophy and is very important for people moving to Linux from
     development on other Operating Systems.
 
-  :ref:`Documentation/SecurityBugs <securitybugs>`
+  :ref:`Documentation/development-process/SecurityBugs.rst <securitybugs>`
     If you feel you have found a security problem in the Linux kernel,
     please follow the steps in this document to help notify the kernel
     developers, and help solve the issue.
 
-  :ref:`Documentation/ManagementStyle <managementstyle>`
+  :ref:`Documentation/development-process/ManagementStyle.rst <managementstyle>`
     This document describes how Linux kernel maintainers operate and the
     shared ethos behind their methodologies.  This is important reading
     for anyone new to kernel development (or anyone simply curious about
     it), as it resolves a lot of common misconceptions and confusion
     about the unique behavior of kernel maintainers.
 
-  :ref:`Documentation/stable_kernel_rules.txt <stable_kernel_rules>`
+  :ref:`Documentation/development-process/stable_kernel_rules.rst <stable_kernel_rules>`
     This file describes the rules on how the stable kernel releases
     happen, and what to do if you want to get a change into one of these
     releases.
 
-  :ref:`Documentation/kernel-docs.txt <kernel_docs>`
+  :ref:`Documentation/development-process/kernel-docs.rst <kernel_docs>`
     A list of external documentation that pertains to kernel
     development.  Please consult this list if you do not find what you
     are looking for within the in-kernel documentation.
 
-  :ref:`Documentation/applying-patches.txt <applying_patches>`
+  :ref:`Documentation/development-process/applying-patches.rst <applying_patches>`
     A good introduction describing exactly what a patch is and how to
     apply it to the different development branches of the kernel.
 
@@ -313,7 +313,7 @@ two weeks, but it can be longer if there are no pressing problems.  A
 security-related problem, instead, can cause a release to happen almost
 instantly.
 
-The file Documentation/stable_kernel_rules.txt in the kernel tree
+The file Documentation/development-process/stable_kernel_rules.rst in the kernel tree
 documents what kinds of changes are acceptable for the -stable tree, and
 how the release process works.
 
@@ -446,7 +446,7 @@ add your statements between the individual quoted sections instead of
 writing at the top of the mail.
 
 If you add patches to your mail, make sure they are plain readable text
-as stated in Documentation/SubmittingPatches.
+as stated in Documentation/development-process/SubmittingPatches.rst.
 Kernel developers don't want to deal with
 attachments or compressed patches; they may want to comment on
 individual lines of your patch, which works only that way. Make sure you
diff --git a/Documentation/ManagementStyle b/Documentation/development-process/ManagementStyle.rst
similarity index 100%
rename from Documentation/ManagementStyle
rename to Documentation/development-process/ManagementStyle.rst
diff --git a/Documentation/SecurityBugs b/Documentation/development-process/SecurityBugs.rst
similarity index 100%
rename from Documentation/SecurityBugs
rename to Documentation/development-process/SecurityBugs.rst
diff --git a/Documentation/SubmitChecklist b/Documentation/development-process/SubmitChecklist.rst
similarity index 93%
rename from Documentation/SubmitChecklist
rename to Documentation/development-process/SubmitChecklist.rst
index 22a370ff34e5..6845a4e4d96e 100644
--- a/Documentation/SubmitChecklist
+++ b/Documentation/development-process/SubmitChecklist.rst
@@ -1,3 +1,5 @@
+.. _submitchecklist:
+
 Linux Kernel patch submission checklist
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -5,7 +7,7 @@ Here are some basic things that developers should do if they want to see their
 kernel patch submissions accepted more quickly.
 
 These are all above and beyond the documentation that is provided in
-Documentation/SubmittingPatches
+:ref:`Documentation/development-process/SubmittingPatches.rst <submittingpatches>`
 and elsewhere regarding submitting Linux kernel patches.
 
 
@@ -28,8 +30,8 @@ and elsewhere regarding submitting Linux kernel patches.
 4) ppc64 is a good architecture for cross-compilation checking because it
    tends to use ``unsigned long`` for 64-bit quantities.
 
-5: Check your patch for general style as detailed in
-   Documentation/CodingStyle.
+5) Check your patch for general style as detailed in
+   :ref:`Documentation/development-process/CodingStyle.rst <codingstyle>`.
    Check for trivial violations with the patch style checker prior to
    submission (``scripts/checkpatch.pl``).
    You should be able to justify all violations that remain in
@@ -54,7 +56,7 @@ and elsewhere regarding submitting Linux kernel patches.
        but any one function that uses more than 512 bytes on the stack is a
        candidate for change.
 
-11: Include :ref:`kernel-doc <kernel_doc>` to document global  kernel APIs.
+11) Include :ref:`kernel-doc <kernel_doc>` to document global  kernel APIs.
     (Not required for static functions, but OK there also.) Use
     ``make htmldocs`` or ``make pdfdocs`` to check the
     :ref:`kernel-doc <kernel_doc>` and fix any issues.
diff --git a/Documentation/SubmittingDrivers b/Documentation/development-process/SubmittingDrivers.rst
similarity index 96%
rename from Documentation/SubmittingDrivers
rename to Documentation/development-process/SubmittingDrivers.rst
index 2ac931645e53..e4810fb8f4e2 100644
--- a/Documentation/SubmittingDrivers
+++ b/Documentation/development-process/SubmittingDrivers.rst
@@ -8,7 +8,7 @@ various kernel trees. Note that if you are interested in video card drivers
 you should probably talk to XFree86 (http://www.xfree86.org/) and/or X.Org
 (http://x.org/) instead.
 
-Also read the Documentation/SubmittingPatches document.
+Also read the Documentation/development-process/SubmittingPatches.rst document.
 
 
 Allocating Device Numbers
@@ -40,9 +40,9 @@ Linux 2.4:
 	maintainer does not respond or you cannot find the appropriate
 	maintainer then please contact Willy Tarreau <w@1wt.eu>.
 
-Linux 2.6:
+Linux 2.6 and upper:
 	The same rules apply as 2.4 except that you should follow linux-kernel
-	to track changes in API's. The final contact point for Linux 2.6
+	to track changes in API's. The final contact point for Linux 2.6+
 	submissions is Andrew Morton.
 
 What Criteria Determine Acceptance
@@ -73,7 +73,8 @@ Interfaces:
 
 Code:
 		Please use the Linux style of code formatting as documented
-		in Documentation/CodingStyle. If you have sections of code
+		in :ref:`Documentation/development-process/CodingStyle.rst <codingStyle>`.
+		If you have sections of code
 		that need to be in other formats, for example because they
 		are shared with a windows driver kit and you want to
 		maintain them just once separate them out nicely and note
diff --git a/Documentation/SubmittingPatches b/Documentation/development-process/SubmittingPatches.rst
similarity index 97%
rename from Documentation/SubmittingPatches
rename to Documentation/development-process/SubmittingPatches.rst
index 801f5cd5103b..8e8c857d24d1 100644
--- a/Documentation/SubmittingPatches
+++ b/Documentation/development-process/SubmittingPatches.rst
@@ -10,10 +10,12 @@ can greatly increase the chances of your change being accepted.
 
 This document contains a large number of suggestions in a relatively terse
 format.  For detailed information on how the kernel development process
-works, see Documentation/development-process.  Also, read
-Documentation/SubmitChecklist for a list of items to check before
+works, see :ref:`Documentation/development-process <development_process_main>`.
+Also, read :ref:`Documentation/development-process/SubmitChecklist.rst <submitchecklist>`
+for a list of items to check before
 submitting code.  If you are submitting a driver, also read
-Documentation/SubmittingDrivers; for device tree binding patches, read
+:ref:`Documentation/development-process/SubmittingDrivers.rst <submittingdrivers>`;
+for device tree binding patches, read
 Documentation/devicetree/bindings/submitting-patches.txt.
 
 Many of these steps describe the default behavior of the ``git`` version
@@ -235,7 +237,9 @@ then only post say 15 or so at a time and wait for review and integration.
 ---------------------------
 
 Check your patch for basic style violations, details of which can be
-found in Documentation/CodingStyle.  Failure to do so simply wastes
+found in
+:ref:`Documentation/development-process/CodingStyle.rst <codingstyle>`.
+Failure to do so simply wastes
 the reviewers time and will get your patch rejected, probably
 without even being read.
 
@@ -300,8 +304,9 @@ toward the stable maintainers by putting a line like this::
   Cc: stable@vger.kernel.org
 
 into the sign-off area of your patch (note, NOT an email recipient).  You
-should also read Documentation/stable_kernel_rules.txt in addition to this
-file.
+should also read
+:ref:`Documentation/development-process/stable_kernel_rules.rst <stable_kernel_rules>`
+in addition to this file.
 
 Note, however, that some subsystem maintainers want to come to their own
 conclusions on which patches should go to the stable trees.  The networking
@@ -358,8 +363,9 @@ decreasing the likelihood of your MIME-attached change being accepted.
 Exception:  If your mailer is mangling patches then someone may ask
 you to re-send them using MIME.
 
-See Documentation/development-process/email-clients.rst for hints about configuring
-your e-mail client so that it sends your patches untouched.
+See :ref:`Documentation/development-process/email-clients.rst <email_clients>`
+for hints about configuring your e-mail client so that it sends your patches
+untouched.
 
 7) E-mail size
 --------------
@@ -822,8 +828,8 @@ Greg Kroah-Hartman, "How to piss off a kernel subsystem maintainer".
 NO!!!! No more huge patch bombs to linux-kernel@vger.kernel.org people!
   <https://lkml.org/lkml/2005/7/11/336>
 
-Kernel Documentation/CodingStyle:
-  <Documentation/CodingStyle>
+Kernel Documentation/development-process/CodingStyle.rst:
+  :ref:`Documentation/development-process/CodingStyle.rst <codingstyle>`
 
 Linus Torvalds's mail on the canonical patch format:
   <http://lkml.org/lkml/2005/4/7/183>
diff --git a/Documentation/applying-patches.txt b/Documentation/development-process/applying-patches.rst
similarity index 100%
rename from Documentation/applying-patches.txt
rename to Documentation/development-process/applying-patches.rst
diff --git a/Documentation/development-process/development-process.rst b/Documentation/development-process/development-process.rst
index d431a1098875..bd1399f7202a 100644
--- a/Documentation/development-process/development-process.rst
+++ b/Documentation/development-process/development-process.rst
@@ -1,3 +1,5 @@
+.. _development_process_main:
+
 A guide to the Kernel Development Process
 =========================================
 
diff --git a/Documentation/email-clients.txt b/Documentation/development-process/email-clients.rst
similarity index 99%
rename from Documentation/email-clients.txt
rename to Documentation/development-process/email-clients.rst
index 0deb240bee56..d35f5fd05f29 100644
--- a/Documentation/email-clients.txt
+++ b/Documentation/development-process/email-clients.rst
@@ -1,3 +1,5 @@
+.. _email_clients:
+
 Email clients info for Linux
 ============================
 
diff --git a/Documentation/development-process/index.rst b/Documentation/development-process/index.rst
index c37475d91090..f54c15fe0ac1 100644
--- a/Documentation/development-process/index.rst
+++ b/Documentation/development-process/index.rst
@@ -1,3 +1,9 @@
+.. raw:: latex
+
+	\renewcommand\thesection*
+	\renewcommand\thesubsection*
+
+
 Linux Kernel Development Documentation
 ======================================
 
@@ -6,4 +12,18 @@ Contents:
 .. toctree::
    :maxdepth: 2
 
+   HOWTO
+   Changes
+   CodingStyle
+   SubmittingPatches
+   SubmittingDrivers
+   stable_api_nonsense
+   SecurityBugs
+   ManagementStyle
+   stable_kernel_rules
+   kernel-docs
+   applying-patches
+   email-clients
+   SubmitChecklist
+
    development-process
diff --git a/Documentation/kernel-docs.txt b/Documentation/development-process/kernel-docs.rst
similarity index 100%
rename from Documentation/kernel-docs.txt
rename to Documentation/development-process/kernel-docs.rst
diff --git a/Documentation/stable_api_nonsense.txt b/Documentation/development-process/stable_api_nonsense.rst
similarity index 100%
rename from Documentation/stable_api_nonsense.txt
rename to Documentation/development-process/stable_api_nonsense.rst
diff --git a/Documentation/stable_kernel_rules.txt b/Documentation/development-process/stable_kernel_rules.rst
similarity index 96%
rename from Documentation/stable_kernel_rules.txt
rename to Documentation/development-process/stable_kernel_rules.rst
index 1eba72708c7f..daa1073b65df 100644
--- a/Documentation/stable_kernel_rules.txt
+++ b/Documentation/development-process/stable_kernel_rules.rst
@@ -26,7 +26,9 @@ Rules on what kind of patches are accepted, and which ones are not, into the
    race can be exploited is also provided.
  - It cannot contain any "trivial" fixes in it (spelling changes,
    whitespace cleanups, etc).
- - It must follow the Documentation/SubmittingPatches rules.
+ - It must follow the
+   :ref:`Documentation/development-process/SubmittingPatches.rst <submittingpatches>`
+   rules.
  - It or an equivalent fix must already exist in Linus' tree (upstream).
 
 
@@ -37,7 +39,8 @@ Procedure for submitting patches to the -stable tree
    submission guidelines as described in
    Documentation/networking/netdev-FAQ.txt
  - Security patches should not be handled (solely) by the -stable review
-   process but should follow the procedures in Documentation/SecurityBugs.
+   process but should follow the procedures in
+   :ref:`Documentation/development-process/SecurityBugs.rst <securitybugs>`.
 
 For all other submissions, choose one of the following procedures
 -----------------------------------------------------------------
diff --git a/Documentation/devicetree/bindings/submitting-patches.txt b/Documentation/devicetree/bindings/submitting-patches.txt
index 7d44eae7ab0b..5fa11b9b8410 100644
--- a/Documentation/devicetree/bindings/submitting-patches.txt
+++ b/Documentation/devicetree/bindings/submitting-patches.txt
@@ -3,7 +3,7 @@
 
 I. For patch submitters
 
-  0) Normal patch submission rules from Documentation/SubmittingPatches
+  0) Normal patch submission rules from Documentation/development-process/SubmittingPatches.rst
      applies.
 
   1) The Documentation/ portion of the patch should be a separate patch.
diff --git a/Documentation/filesystems/locks.txt b/Documentation/filesystems/locks.txt
index 2cf81082581d..8af1ee4a6399 100644
--- a/Documentation/filesystems/locks.txt
+++ b/Documentation/filesystems/locks.txt
@@ -19,7 +19,7 @@ forever.
 
 This should not cause problems for anybody, since everybody using a
 2.1.x kernel should have updated their C library to a suitable version
-anyway (see the file "Documentation/Changes".)
+anyway (see the file "Documentation/development-process/Changes.rst".)
 
 1.2 Allow Mixed Locks Again
 ---------------------------
diff --git a/Documentation/hwmon/submitting-patches b/Documentation/hwmon/submitting-patches
index 57f60307accc..04b1036f07c4 100644
--- a/Documentation/hwmon/submitting-patches
+++ b/Documentation/hwmon/submitting-patches
@@ -10,10 +10,10 @@ increase the chances of your change being accepted.
 ----------
 
 * It should be unnecessary to mention, but please read and follow
-    Documentation/SubmitChecklist
-    Documentation/SubmittingDrivers
-    Documentation/SubmittingPatches
-    Documentation/CodingStyle
+    Documentation/development-process/SubmitChecklist.rst
+    Documentation/development-process/SubmittingDrivers.rst
+    Documentation/development-process/SubmittingPatches.rst
+    Documentation/development-process/CodingStyle.rst
 
 * Please run your patch through 'checkpatch --strict'. There should be no
   errors, no warnings, and few if any check messages. If there are any
diff --git a/Documentation/isdn/README b/Documentation/isdn/README
index cfb1884342ee..508817c06a53 100644
--- a/Documentation/isdn/README
+++ b/Documentation/isdn/README
@@ -321,7 +321,7 @@ README for the ISDN-subsystem
   ATTENTION!
 
   Always use the latest module utilities. The current version is
-  named in Documentation/Changes. Some old versions of insmod
+  named in Documentation/development-process/Changes.rst. Some old versions of insmod
   are not capable of setting the driver-Ids correctly.
 
 3. Lowlevel-driver configuration.
diff --git a/Documentation/ja_JP/HOWTO b/Documentation/ja_JP/HOWTO
index 581c14bdd7be..465b238e7d1d 100644
--- a/Documentation/ja_JP/HOWTO
+++ b/Documentation/ja_JP/HOWTO
@@ -1,5 +1,5 @@
 NOTE:
-This is a version of Documentation/HOWTO translated into Japanese.
+This is a version of Documentation/development-process/HOWTO.rst translated into Japanese.
 This document is maintained by Tsugikazu Shibata <tshibata@ab.jp.nec.com>
 and the JF Project team <www.linux.or.jp/JF>.
 If you find any difference between this document and the original file
@@ -14,7 +14,7 @@ to update the original English file first.
 Last Updated: 2013/07/19
 ==================================
 これは、
-linux-3.10/Documentation/HOWTO
+linux-3.10/Documentation/development-process/HOWTO.rst
 の和訳です。
 
 翻訳団体： JF プロジェクト < http://linuxjf.sourceforge.jp/ >
@@ -122,20 +122,20 @@ linux-api@ver.kernel.org に送ることを勧めます。
     ています。カーネルに関して初めての人はここからスタートすると良いで
     しょう。
 
-  Documentation/Changes
+  Documentation/development-process/Changes.rst
      このファイルはカーネルをうまく生成(訳注 build )し、走らせるのに最
      小限のレベルで必要な数々のソフトウェアパッケージの一覧を示してい
      ます。
 
-  Documentation/CodingStyle
+  Documentation/development-process/CodingStyle.rst
     これは Linux カーネルのコーディングスタイルと背景にある理由を記述
     しています。全ての新しいコードはこのドキュメントにあるガイドライン
     に従っていることを期待されています。大部分のメンテナはこれらのルー
     ルに従っているものだけを受け付け、多くの人は正しいスタイルのコード
     だけをレビューします。
 
-  Documentation/SubmittingPatches
-  Documentation/SubmittingDrivers
+  Documentation/development-process/SubmittingPatches.rst
+  Documentation/development-process/SubmittingDrivers.rst
      これらのファイルには、どうやってうまくパッチを作って投稿するかに
      ついて非常に詳しく書かれており、以下を含みます(これだけに限らない
      けれども)
@@ -153,7 +153,7 @@ linux-api@ver.kernel.org に送ることを勧めます。
 	"Linux kernel patch submission format"
 		http://linux.yyz.us/patch-format.html
 
-  Documentation/stable_api_nonsense.txt
+  Documentation/development-process/stable_api_nonsense.rst
      このファイルはカーネルの中に不変のAPIを持たないことにした意識的な
      決断の背景にある理由について書かれています。以下のようなことを含
      んでいます-
@@ -164,29 +164,29 @@ linux-api@ver.kernel.org に送ることを勧めます。
      このドキュメントは Linux 開発の思想を理解するのに非常に重要です。
      そして、他のOSでの開発者が Linux に移る時にとても重要です。
 
-  Documentation/SecurityBugs
+  Documentation/development-process/SecurityBugs.rst
     もし Linux カーネルでセキュリティ問題を発見したように思ったら、こ
     のドキュメントのステップに従ってカーネル開発者に連絡し、問題解決を
     支援してください。
 
-  Documentation/ManagementStyle
+  Documentation/development-process/ManagementStyle.rst
     このドキュメントは Linux カーネルのメンテナ達がどう行動するか、
     彼らの手法の背景にある共有されている精神について記述しています。こ
     れはカーネル開発の初心者なら（もしくは、単に興味があるだけの人でも）
     重要です。なぜならこのドキュメントは、カーネルメンテナ達の独特な
     行動についての多くの誤解や混乱を解消するからです。
 
-  Documentation/stable_kernel_rules.txt
+  Documentation/development-process/stable_kernel_rules.rst
     このファイルはどのように stable カーネルのリリースが行われるかのルー
     ルが記述されています。そしてこれらのリリースの中のどこかで変更を取
     り入れてもらいたい場合に何をすれば良いかが示されています。
 
-  Documentation/kernel-docs.txt
+  Documentation/development-process/kernel-docs.rst
 　　カーネル開発に付随する外部ドキュメントのリストです。もしあなたが
     探しているものがカーネル内のドキュメントでみつからなかった場合、
     このリストをあたってみてください。
 
-  Documentation/applying-patches.txt
+  Documentation/development-process/applying-patches.rst
     パッチとはなにか、パッチをどうやって様々なカーネルの開発ブランチに
     適用するのかについて正確に記述した良い入門書です。
 
@@ -314,7 +314,7 @@ Andrew Morton が Linux-kernel メーリングリストにカーネルリリー
 た問題がなければもう少し長くなることもあります。セキュリティ関連の問題
 の場合はこれに対してだいたいの場合、すぐにリリースがされます。
 
-カーネルツリーに入っている、Documentation/stable_kernel_rules.txt ファ
+カーネルツリーに入っている、Documentation/development-process/stable_kernel_rules.rst ファ
 イルにはどのような種類の変更が -stable ツリーに受け入れ可能か、またリ
 リースプロセスがどう動くかが記述されています。
 
@@ -438,7 +438,7 @@ MAINTAINERS ファイルにリストがありますので参照してくださ
 メールの先頭でなく、各引用行の間にあなたの言いたいことを追加するべきで
 す。
 
-もしパッチをメールに付ける場合は、Documentation/SubmittingPatches に提
+もしパッチをメールに付ける場合は、Documentation/development-process/SubmittingPatches.rst に提
 示されているように、それは プレーンな可読テキストにすることを忘れない
 ようにしましょう。カーネル開発者は 添付や圧縮したパッチを扱いたがりま
 せん-
diff --git a/Documentation/ja_JP/SubmitChecklist b/Documentation/ja_JP/SubmitChecklist
index cb5507b1ac81..a8e88eebc346 100644
--- a/Documentation/ja_JP/SubmitChecklist
+++ b/Documentation/ja_JP/SubmitChecklist
@@ -1,5 +1,5 @@
 NOTE:
-This is a version of Documentation/SubmitChecklist into Japanese.
+This is a version of Documentation/development-process/SubmitChecklist.rst into Japanese.
 This document is maintained by Takenori Nagano <t-nagano@ah.jp.nec.com>
 and the JF Project team <http://www.linux.or.jp/JF/>.
 If you find any difference between this document and the original file
@@ -14,7 +14,7 @@ to update the original English file first.
 Last Updated: 2008/07/14
 ==================================
 これは、
-linux-2.6.26/Documentation/SubmitChecklist の和訳です。
+linux-2.6.26/Documentation/development-process/SubmitChecklist.rst の和訳です。
 
 翻訳団体： JF プロジェクト < http://www.linux.or.jp/JF/ >
 翻訳日： 2008/07/14
@@ -27,7 +27,7 @@ Linux カーネルパッチ投稿者向けチェックリスト
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 本書では、パッチをより素早く取り込んでもらいたい開発者が実践すべき基本的な事柄
-をいくつか紹介します。ここにある全ての事柄は、Documentation/SubmittingPatches
+をいくつか紹介します。ここにある全ての事柄は、Documentation/development-process/SubmittingPatches.rst
 などのLinuxカーネルパッチ投稿に際しての心得を補足するものです。
 
  1: 妥当なCONFIGオプションや変更されたCONFIGオプション、つまり =y, =m, =n
diff --git a/Documentation/ja_JP/SubmittingPatches b/Documentation/ja_JP/SubmittingPatches
index fffa3106edd2..9384a78f0e22 100644
--- a/Documentation/ja_JP/SubmittingPatches
+++ b/Documentation/ja_JP/SubmittingPatches
@@ -1,5 +1,5 @@
 NOTE:
-This is a version of Documentation/SubmittingPatches into Japanese.
+This is a version of Documentation/development-process/SubmittingPatches.rst into Japanese.
 This document is maintained by Keiichi KII <k-keiichi@bx.jp.nec.com>
 and the JF Project team <http://www.linux.or.jp/JF/>.
 If you find any difference between this document and the original file
@@ -15,7 +15,7 @@ Last Updated: 2011/06/09
 
 ==================================
 これは、
-linux-2.6.39/Documentation/SubmittingPatches の和訳
+linux-2.6.39/Documentation/development-process/SubmittingPatches.rst の和訳
 です。
 翻訳団体： JF プロジェクト < http://www.linux.or.jp/JF/ >
 翻訳日： 2011/06/09
@@ -34,9 +34,9 @@ Linux カーネルに変更を加えたいと思っている個人又は会社
 おじけづかせることもあります。この文章はあなたの変更を大いに受け入れ
 てもらえやすくする提案を集めたものです。
 
-コードを投稿する前に、Documentation/SubmitChecklist の項目リストに目
+コードを投稿する前に、Documentation/development-process/SubmitChecklist.rst の項目リストに目
 を通してチェックしてください。もしあなたがドライバーを投稿しようとし
-ているなら、Documentation/SubmittingDrivers にも目を通してください。
+ているなら、Documentation/development-process/SubmittingDrivers.rst にも目を通してください。
 
 --------------------------------------------
 セクション1 パッチの作り方と送り方
@@ -148,7 +148,7 @@ http://savannah.nongnu.org/projects/quilt
 4) パッチのスタイルチェック
 
 あなたのパッチが基本的な( Linux カーネルの)コーディングスタイルに違反し
-ていないかをチェックして下さい。その詳細を Documentation/CodingStyle で
+ていないかをチェックして下さい。その詳細を Documentation/development-process/CodingStyle.rst で
 見つけることができます。コーディングスタイルの違反はレビューする人の
 時間を無駄にするだけなので、恐らくあなたのパッチは読まれることすらなく
 拒否されるでしょう。
@@ -609,7 +609,7 @@ diffstat の結果を生成するために「 git diff -M --stat --summary 」
 し例外を適用するには、本当に妥当な理由が不可欠です。あなたは恐らくこの
 セクションを Linus のコンピュータ・サイエンス101と呼ぶでしょう。
 
-1) Documentation/CodingStyleを参照
+1) Documentation/development-process/CodingStyle.rstを参照
 
 言うまでもなく、あなたのコードがこのコーディングスタイルからあまりに
 も逸脱していると、レビューやコメントなしに受け取ってもらえないかもし
@@ -704,8 +704,8 @@ Greg Kroah-Hartman, "How to piss off a kernel subsystem maintainer".
 NO!!!! No more huge patch bombs to linux-kernel@vger.kernel.org people!
   <https://lkml.org/lkml/2005/7/11/336>
 
-Kernel Documentation/CodingStyle:
-  <http://users.sosdg.org/~qiyong/lxr/source/Documentation/CodingStyle>
+Kernel Documentation/development-process/CodingStyle.rst:
+  <http://users.sosdg.org/~qiyong/lxr/source/Documentation/development-process/CodingStyle.rst>
 
 Linus Torvalds's mail on the canonical patch format:
   <http://lkml.org/lkml/2005/4/7/183>
diff --git a/Documentation/ja_JP/stable_api_nonsense.txt b/Documentation/ja_JP/stable_api_nonsense.txt
index 7653b5cbfed2..fa54dc9ee9f0 100644
--- a/Documentation/ja_JP/stable_api_nonsense.txt
+++ b/Documentation/ja_JP/stable_api_nonsense.txt
@@ -1,5 +1,5 @@
 NOTE:
-This is a version of Documentation/stable_api_nonsense.txt into Japanese.
+This is a version of Documentation/development-process/stable_api_nonsense.rst into Japanese.
 This document is maintained by IKEDA, Munehiro <m-ikeda@ds.jp.nec.com>
 and the JF Project team <http://www.linux.or.jp/JF/>.
 If you find any difference between this document and the original file
@@ -14,7 +14,7 @@ to update the original English file first.
 Last Updated: 2007/07/18
 ==================================
 これは、
-linux-2.6.22-rc4/Documentation/stable_api_nonsense.txt の和訳
+linux-2.6.22-rc4/Documentation/development-process/stable_api_nonsense.rst の和訳
 です。
 翻訳団体： JF プロジェクト < http://www.linux.or.jp/JF/ >
 翻訳日 ： 2007/06/11
diff --git a/Documentation/ja_JP/stable_kernel_rules.txt b/Documentation/ja_JP/stable_kernel_rules.txt
index 9dbda9b5d21e..b7a201258c76 100644
--- a/Documentation/ja_JP/stable_kernel_rules.txt
+++ b/Documentation/ja_JP/stable_kernel_rules.txt
@@ -1,5 +1,5 @@
 NOTE:
-This is Japanese translated version of "Documentation/stable_kernel_rules.txt".
+This is Japanese translated version of "Documentation/development-process/stable_kernel_rules.rst".
 This one is maintained by Tsugikazu Shibata <tshibata@ab.jp.nec.com>
 and JF Project team <www.linux.or.jp/JF>.
 If you find difference with original file or problem in translation,
@@ -12,7 +12,7 @@ file at first.
 
 ==================================
 これは、
-linux-2.6.29/Documentation/stable_kernel_rules.txt
+linux-2.6.29/Documentation/development-process/stable_kernel_rules.rst
 の和訳です。
 
 翻訳団体： JF プロジェクト < http://www.linux.or.jp/JF/ >
@@ -43,7 +43,7 @@ linux-2.6.29/Documentation/stable_kernel_rules.txt
    "理論的には競合状態になる"ようなものは不可。
  - いかなる些細な修正も含めることはできない。(スペルの修正、空白のクリー
    ンアップなど)
- - Documentation/SubmittingPatches の規則に従ったものでなければならない。
+ - Documentation/development-process/SubmittingPatches.rst の規則に従ったものでなければならない。
  - パッチ自体か同等の修正が Linus のツリーに既に存在しなければならない。
 　 Linus のツリーでのコミットID を -stable へのパッチ投稿の際に引用す
    ること。
diff --git a/Documentation/ko_KR/HOWTO b/Documentation/ko_KR/HOWTO
index 9a3e65924d54..a3f13e62da9e 100644
--- a/Documentation/ko_KR/HOWTO
+++ b/Documentation/ko_KR/HOWTO
@@ -1,5 +1,5 @@
 NOTE:
-This is a version of Documentation/HOWTO translated into korean
+This is a version of Documentation/development-process/HOWTO.rst translated into korean
 This document is maintained by Minchan Kim <minchan@kernel.org>
 If you find any difference between this document and the original file or
 a problem with the translation, please contact the maintainer of this file.
@@ -11,7 +11,7 @@ try to update the original English file first.
 
 ==================================
 이 문서는
-Documentation/HOWTO
+Documentation/development-process/HOWTO.rst
 의 한글 번역입니다.
 
 역자： 김민찬 <minchan@kernel.org>
@@ -98,18 +98,18 @@ mtk.manpages@gmail.com의 메인테이너에게 보낼 것을 권장한다.
     빌드하기 위해 필요한 것을 설명한다. 커널에 입문하는 사람들은 여기서
     시작해야 한다.
 
-  Documentation/Changes
+  Documentation/development-process/Changes.rst
     이 파일은 커널을 성공적으로 빌드하고 실행시키기 위해 필요한 다양한
     소프트웨어 패키지들의 최소 버젼을 나열한다.
 
-  Documentation/CodingStyle
+  Documentation/development-process/CodingStyle.rst
     이 문서는 리눅스 커널 코딩 스타일과 그렇게 한 몇몇 이유를 설명한다.
     모든 새로운 코드는 이 문서에 가이드라인들을 따라야 한다. 대부분의
     메인테이너들은 이 규칙을 따르는 패치들만을 받아들일 것이고 많은 사람들이
     그 패치가 올바른 스타일일 경우만 코드를 검토할 것이다.
 
-  Documentation/SubmittingPatches
-  Documentation/SubmittingDrivers
+  Documentation/development-process/SubmittingPatches.rst
+  Documentation/development-process/SubmittingDrivers.rst
     이 파일들은 성공적으로 패치를 만들고 보내는 법을 다음의 내용들로
     굉장히 상세히 설명하고 있다(그러나 다음으로 한정되진 않는다).
        - Email 내용들
@@ -126,7 +126,7 @@ mtk.manpages@gmail.com의 메인테이너에게 보낼 것을 권장한다.
     "Linux kernel patch submission format"
         http://linux.yyz.us/patch-format.html
 
-   Documentation/stable_api_nonsense.txt
+   Documentation/development-process/stable_api_nonsense.rst
     이 문서는 의도적으로 커널이 불변하는 API를 갖지 않도록 결정한
     이유를 설명하며 다음과 같은 것들을 포함한다.
        - 서브시스템 shim-layer(호환성을 위해?)
@@ -136,12 +136,12 @@ mtk.manpages@gmail.com의 메인테이너에게 보낼 것을 권장한다.
     리눅스로 전향하는 사람들에게는 매우 중요하다.
 
 
-  Documentation/SecurityBugs
+  Documentation/development-process/SecurityBugs.rst
     여러분들이 리눅스 커널의 보안 문제를 발견했다고 생각한다면 이 문서에
     나온 단계에 따라서 커널 개발자들에게 알리고 그 문제를 해결할 수 있도록
     도와 달라.
 
-  Documentation/ManagementStyle
+  Documentation/development-process/ManagementStyle.rst
     이 문서는 리눅스 커널 메인테이너들이 그들의 방법론에 녹아 있는
     정신을 어떻게 공유하고 운영하는지를 설명한다. 이것은 커널 개발에 입문하는
     모든 사람들(또는 커널 개발에 작은 호기심이라도 있는 사람들)이
@@ -149,17 +149,17 @@ mtk.manpages@gmail.com의 메인테이너에게 보낼 것을 권장한다.
     독특한 행동에 관하여 흔히 있는 오해들과 혼란들을 해소하고 있기
     때문이다.
 
-  Documentation/stable_kernel_rules.txt
+  Documentation/development-process/stable_kernel_rules.rst
     이 문서는 안정적인 커널 배포가 이루어지는 규칙을 설명하고 있으며
     여러분들이 이러한 배포들 중 하나에 변경을 하길 원한다면
     무엇을 해야 하는지를 설명한다.
 
-  Documentation/kernel-docs.txt
+  Documentation/development-process/kernel-docs.rst
     커널 개발에 관계된 외부 문서의 리스트이다. 커널 내의 포함된 문서들
     중에 여러분이 찾고 싶은 문서를 발견하지 못할 경우 이 리스트를
     살펴보라.
 
-  Documentation/applying-patches.txt
+  Documentation/development-process/applying-patches.rst
     패치가 무엇이며 그것을 커널의 다른 개발 브랜치들에 어떻게
     적용하는지에 관하여 자세히 설명하고 있는 좋은 입문서이다.
 
@@ -276,7 +276,7 @@ Andrew Morton의 글이 있다.
 4.x.y는 "stable" 팀<stable@vger.kernel.org>에 의해 관리되며 거의 매번 격주로
 배포된다.
 
-커널 트리 문서들 내에 Documentation/stable_kernel_rules.txt 파일은 어떤
+커널 트리 문서들 내에 Documentation/development-process/stable_kernel_rules.rst 파일은 어떤
 종류의 변경들이 -stable 트리로 들어왔는지와 배포 프로세스가 어떻게
 진행되는지를 설명한다.
 
@@ -391,7 +391,7 @@ bugme-janitor 메일링 리스트(bugzilla에 모든 변화들이 여기서 메
 "John 커널해커는 작성했다...."를 유지하며 여러분들의 의견을 그 메일의 윗부분에
 작성하지 말고 각 인용한 단락들 사이에 넣어라.
 
-여러분들이 패치들을 메일에 넣는다면 그것들은 Documentation/SubmittingPatches에
+여러분들이 패치들을 메일에 넣는다면 그것들은 Documentation/development-process/SubmittingPatches.rst에
 나와있는데로 명백히(plain) 읽을 수 있는 텍스트여야 한다. 커널 개발자들은
 첨부파일이나 압축된 패치들을 원하지 않는다. 그들은 여러분들의 패치의
 각 라인 단위로 코멘트를 하길 원하며 압축하거나 첨부하지 않고 보내는 것이
diff --git a/Documentation/ko_KR/stable_api_nonsense.txt b/Documentation/ko_KR/stable_api_nonsense.txt
index 3ba10b11d556..aaf163197ac0 100644
--- a/Documentation/ko_KR/stable_api_nonsense.txt
+++ b/Documentation/ko_KR/stable_api_nonsense.txt
@@ -1,5 +1,5 @@
 NOTE:
-This is a version of Documentation/stable_api_nonsense.txt translated
+This is a version of Documentation/development-process/stable_api_nonsense.rst translated
 into korean
 This document is maintained by Minchan Kim <minchan@kernel.org>
 If you find any difference between this document and the original file or
@@ -12,7 +12,7 @@ try to update the original English file first.
 
 ==================================
 이 문서는
-Documentation/stable_api_nonsense.txt
+Documentation/development-process/stable_api_nonsense.rst
 의 한글 번역입니다.
 
 역자： 김민찬 <minchan@kernel.org>
diff --git a/Documentation/networking/PLIP.txt b/Documentation/networking/PLIP.txt
index ad7e3f7c3bbf..0a1e70c39bf2 100644
--- a/Documentation/networking/PLIP.txt
+++ b/Documentation/networking/PLIP.txt
@@ -102,7 +102,7 @@ reason, bits are dropped.
 
 A utility that can perform this change in Linux is plipconfig, which is part
 of the net-tools package (its location can be found in the
-Documentation/Changes file). An example command would be
+Documentation/development-process/Changes.rst file). An example command would be
 'plipconfig plipX trigger 10000', where plipX is the appropriate
 PLIP device.
 
diff --git a/Documentation/networking/netdev-FAQ.txt b/Documentation/networking/netdev-FAQ.txt
index 0fe1c6e0dbcd..ec20b077f8d1 100644
--- a/Documentation/networking/netdev-FAQ.txt
+++ b/Documentation/networking/netdev-FAQ.txt
@@ -136,14 +136,14 @@ A: Normally Greg Kroah-Hartman collects stable commits himself, but
 
 Q: I see a network patch and I think it should be backported to stable.
    Should I request it via "stable@vger.kernel.org" like the references in
-   the kernel's Documentation/stable_kernel_rules.txt file say?
+   the kernel's Documentation/development-process/stable_kernel_rules.rst file say?
 
 A: No, not for networking.  Check the stable queues as per above 1st to see
    if it is already queued.  If not, then send a mail to netdev, listing
    the upstream commit ID and why you think it should be a stable candidate.
 
    Before you jump to go do the above, do note that the normal stable rules
-   in Documentation/stable_kernel_rules.txt still apply.  So you need to
+   in Documentation/development-process/stable_kernel_rules.rst still apply.  So you need to
    explicitly indicate why it is a critical fix and exactly what users are
    impacted.  In addition, you need to convince yourself that you _really_
    think it has been overlooked, vs. having been considered and rejected.
@@ -165,7 +165,7 @@ A: No.  See above answer.  In short, if you think it really belongs in
 
    If you think there is some valid information relating to it being in
    stable that does _not_ belong in the commit log, then use the three
-   dash marker line as described in Documentation/SubmittingPatches to
+   dash marker line as described in Documentation/development-process/SubmittingPatches.rst to
    temporarily embed that information into the patch that you send.
 
 Q: Someone said that the comment style and coding convention is different
@@ -220,5 +220,5 @@ A: Attention to detail.  Re-read your own work as if you were the
    If it is your first patch, mail it to yourself so you can test apply
    it to an unpatched tree to confirm infrastructure didn't mangle it.
 
-   Finally, go back and read Documentation/SubmittingPatches to be
+   Finally, go back and read Documentation/development-process/SubmittingPatches.rst to be
    sure you are not repeating some common mistake documented there.
diff --git a/Documentation/scsi/scsi_mid_low_api.txt b/Documentation/scsi/scsi_mid_low_api.txt
index 255075157511..1117d4e39d1e 100644
--- a/Documentation/scsi/scsi_mid_low_api.txt
+++ b/Documentation/scsi/scsi_mid_low_api.txt
@@ -336,7 +336,7 @@ in parallel by these functions.
 Conventions
 ===========
 First, Linus Torvalds's thoughts on C coding style can be found in the
-Documentation/CodingStyle file. 
+Documentation/development-process/CodingStyle.rst file. 
 
 Next, there is a movement to "outlaw" typedefs introducing synonyms for 
 struct tags. Both can be still found in the SCSI subsystem, but
diff --git a/Documentation/virtual/kvm/review-checklist.txt b/Documentation/virtual/kvm/review-checklist.txt
index a850986ed684..2446242f366d 100644
--- a/Documentation/virtual/kvm/review-checklist.txt
+++ b/Documentation/virtual/kvm/review-checklist.txt
@@ -1,8 +1,8 @@
 Review checklist for kvm patches
 ================================
 
-1.  The patch must follow Documentation/CodingStyle and
-    Documentation/SubmittingPatches.
+1.  The patch must follow Documentation/development-process/CodingStyle.rst and
+    Documentation/development-process/SubmittingPatches.rst.
 
 2.  Patches should be against kvm.git master branch.
 
diff --git a/Documentation/watchdog/convert_drivers_to_kernel_api.txt b/Documentation/watchdog/convert_drivers_to_kernel_api.txt
index 271b8850dde7..cad8baa0ce1f 100644
--- a/Documentation/watchdog/convert_drivers_to_kernel_api.txt
+++ b/Documentation/watchdog/convert_drivers_to_kernel_api.txt
@@ -213,6 +213,6 @@ The entry for the driver now needs to select WATCHDOG_CORE:
 Create a patch and send it to upstream
 --------------------------------------
 
-Make sure you understood Documentation/SubmittingPatches and send your patch to
+Make sure you understood Documentation/development-process/SubmittingPatches.rst and send your patch to
 linux-watchdog@vger.kernel.org. We are looking forward to it :)
 
diff --git a/Documentation/zh_CN/CodingStyle b/Documentation/zh_CN/CodingStyle
index 12717791baac..cc9645d19ba3 100644
--- a/Documentation/zh_CN/CodingStyle
+++ b/Documentation/zh_CN/CodingStyle
@@ -1,4 +1,4 @@
-Chinese translated version of Documentation/CodingStyle
+Chinese translated version of Documentation/development-process/CodingStyle.rst
 
 If you have any comment or update to the content, please post to LKML directly.
 However, if you have problem communicating in English you can also ask the
@@ -7,7 +7,7 @@ translation is outdated or there is problem with translation.
 
 Chinese maintainer: Zhang Le <r0bertz@gentoo.org>
 ---------------------------------------------------------------------
-Documentation/CodingStyle的中文翻译
+Documentation/development-process/CodingStyle.rst的中文翻译
 
 如果想评论或更新本文的内容，请直接发信到LKML。如果你使用英文交流有困难的话，也可
 以向中文版维护者求助。如果本翻译更新不及时或者翻译存在问题，请联系中文版维护者。
diff --git a/Documentation/zh_CN/HOWTO b/Documentation/zh_CN/HOWTO
index f0613b92e0be..6d6fe1209b71 100644
--- a/Documentation/zh_CN/HOWTO
+++ b/Documentation/zh_CN/HOWTO
@@ -1,4 +1,4 @@
-﻿Chinese translated version of Documentation/HOWTO
+﻿Chinese translated version of Documentation/development-process/HOWTO.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
@@ -9,7 +9,7 @@ or if there is a problem with the translation.
 Maintainer: Greg Kroah-Hartman <greg@kroah.com>
 Chinese maintainer: Li Yang <leoli@freescale.com>
 ---------------------------------------------------------------------
-Documentation/HOWTO 的中文翻译
+Documentation/development-process/HOWTO.rst 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
@@ -93,16 +93,16 @@ Linux内核代码中包含有大量的文档。这些文档对于学习如何与
     文件简要介绍了Linux内核的背景，并且描述了如何配置和编译内核。内核的
     新用户应该从这里开始。
 
-  Documentation/Changes
+  Documentation/development-process/Changes.rst
     文件给出了用来编译和使用内核所需要的最小软件包列表。
 
-  Documentation/CodingStyle
+  Documentation/development-process/CodingStyle.rst
     描述Linux内核的代码风格和理由。所有新代码需要遵守这篇文档中定义的规
     范。大多数维护者只会接收符合规定的补丁，很多人也只会帮忙检查符合风格
     的代码。
 
-  Documentation/SubmittingPatches
-  Documentation/SubmittingDrivers
+  Documentation/development-process/SubmittingPatches.rst
+  Documentation/development-process/SubmittingDrivers.rst
     这两份文档明确描述如何创建和发送补丁，其中包括（但不仅限于)：
        - 邮件内容
        - 邮件格式
@@ -116,7 +116,7 @@ Linux内核代码中包含有大量的文档。这些文档对于学习如何与
     "Linux kernel patch submission format"
         http://linux.yyz.us/patch-format.html
 
-  Documentation/stable_api_nonsense.txt
+  Documentation/development-process/stable_api_nonsense.rst
     论证内核为什么特意不包括稳定的内核内部API，也就是说不包括像这样的特
     性：
        - 子系统中间层（为了兼容性？）
@@ -125,23 +125,23 @@ Linux内核代码中包含有大量的文档。这些文档对于学习如何与
     这篇文档对于理解Linux的开发哲学至关重要。对于将开发平台从其他操作系
     统转移到Linux的人来说也很重要。
 
-  Documentation/SecurityBugs
+  Documentation/development-process/SecurityBugs.rst
     如果你认为自己发现了Linux内核的安全性问题，请根据这篇文档中的步骤来
     提醒其他内核开发者并帮助解决这个问题。
 
-  Documentation/ManagementStyle
+  Documentation/development-process/ManagementStyle.rst
     描述内核维护者的工作方法及其共有特点。这对于刚刚接触内核开发（或者对
     它感到好奇）的人来说很重要，因为它解释了很多对于内核维护者独特行为的
     普遍误解与迷惑。
 
-  Documentation/stable_kernel_rules.txt
+  Documentation/development-process/stable_kernel_rules.rst
     解释了稳定版内核发布的规则，以及如何将改动放入这些版本的步骤。
 
-  Documentation/kernel-docs.txt
+  Documentation/development-process/kernel-docs.rst
     有助于内核开发的外部文档列表。如果你在内核自带的文档中没有找到你想找
     的内容，可以查看这些文档。
 
-  Documentation/applying-patches.txt
+  Documentation/development-process/applying-patches.rst
     关于补丁是什么以及如何将它打在不同内核开发分支上的好介绍
 
 内核还拥有大量从代码自动生成的文档。它包含内核内部API的全面介绍以及如何
@@ -238,7 +238,7 @@ kernel.org网站的pub/linux/kernel/v2.6/目录下找到它。它的开发遵循
 2.6.x.y版本由“稳定版”小组（邮件地址<stable@vger.kernel.org>）维护，一般隔周发
 布新版本。
 
-内核源码中的Documentation/stable_kernel_rules.txt文件具体描述了可被稳定
+内核源码中的Documentation/development-process/stable_kernel_rules.rst文件具体描述了可被稳定
 版内核接受的修改类型以及发布的流程。
 
 
@@ -380,7 +380,7 @@ MAINTAINERS文件中可以找到不同话题对应的邮件列表。
 这几行。将你的评论加在被引用的段落之间而不要放在邮件的顶部。
 
 如果你在邮件中附带补丁，请确认它们是可以直接阅读的纯文本（如
-Documentation/SubmittingPatches文档中所述）。内核开发者们不希望遇到附件
+Documentation/development-process/SubmittingPatches.rst文档中所述）。内核开发者们不希望遇到附件
 或者被压缩了的补丁。只有这样才能保证他们可以直接评论你的每行代码。请确保
 你使用的邮件发送程序不会修改空格和制表符。一个防范性的测试方法是先将邮件
 发送给自己，然后自己尝试是否可以顺利地打上收到的补丁。如果测试不成功，请
diff --git a/Documentation/zh_CN/SecurityBugs b/Documentation/zh_CN/SecurityBugs
index d21eb07fe943..8b1a0af493e1 100644
--- a/Documentation/zh_CN/SecurityBugs
+++ b/Documentation/zh_CN/SecurityBugs
@@ -1,4 +1,4 @@
-Chinese translated version of Documentation/SecurityBugs
+Chinese translated version of Documentation/development-process/SecurityBugs.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
@@ -8,7 +8,7 @@ or if there is a problem with the translation.
 
 Chinese maintainer: Harry Wei <harryxiyou@gmail.com>
 ---------------------------------------------------------------------
-Documentation/SecurityBugs 的中文翻译
+Documentation/development-process/SecurityBugs.rst 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
diff --git a/Documentation/zh_CN/SubmittingDrivers b/Documentation/zh_CN/SubmittingDrivers
index d313f5d8448d..b59caa9e8ac8 100644
--- a/Documentation/zh_CN/SubmittingDrivers
+++ b/Documentation/zh_CN/SubmittingDrivers
@@ -1,4 +1,4 @@
-﻿Chinese translated version of Documentation/SubmittingDrivers
+﻿Chinese translated version of Documentation/development-process/SubmittingDrivers.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
@@ -8,7 +8,7 @@ or if there is a problem with the translation.
 
 Chinese maintainer: Li Yang <leo@zh-kernel.org>
 ---------------------------------------------------------------------
-Documentation/SubmittingDrivers 的中文翻译
+Documentation/development-process/SubmittingDrivers.rst 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
@@ -30,7 +30,7 @@ Documentation/SubmittingDrivers 的中文翻译
 兴趣的是显卡驱动程序，你也许应该访问 XFree86 项目(http://www.xfree86.org/)
 和／或 X.org 项目 (http://x.org)。
 
-另请参阅 Documentation/SubmittingPatches 文档。
+另请参阅 Documentation/development-process/SubmittingPatches.rst 文档。
 
 
 分配设备号
@@ -81,7 +81,7 @@ Linux 2.6:
 		如果你需要一个 Linux 和 NT 的通用驱动接口，那么请在用
 		户空间实现它。
 
-代码：		请使用 Documentation/CodingStyle 中所描述的 Linux 代码风
+代码：		请使用 Documentation/development-process/CodingStyle.rst 中所描述的 Linux 代码风
 		格。如果你的某些代码段（例如那些与 Windows 驱动程序包共
 		享的代码段）需要使用其他格式，而你却只希望维护一份代码，
 		那么请将它们很好地区分出来，并且注明原因。
diff --git a/Documentation/zh_CN/SubmittingPatches b/Documentation/zh_CN/SubmittingPatches
index 1d3a10f8746b..97bc8639cbfc 100644
--- a/Documentation/zh_CN/SubmittingPatches
+++ b/Documentation/zh_CN/SubmittingPatches
@@ -1,4 +1,4 @@
-Chinese translated version of Documentation/SubmittingPatches
+Chinese translated version of Documentation/development-process/SubmittingPatches.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
@@ -8,7 +8,7 @@ or if there is a problem with the translation.
 
 Chinese maintainer: TripleX Chung <triplex@zh-kernel.org>
 ---------------------------------------------------------------------
-Documentation/SubmittingPatches 的中文翻译
+Documentation/development-process/SubmittingPatches.rst 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
@@ -30,9 +30,9 @@ Documentation/SubmittingPatches 的中文翻译
 对于想要将改动提交到 Linux 内核的个人或者公司来说，如果不熟悉“规矩”，
 提交的流程会让人畏惧。本文档收集了一系列建议，这些建议可以大大的提高你
 的改动被接受的机会。
-阅读 Documentation/SubmitChecklist 来获得在提交代码前需要检查的项目的列
+阅读 Documentation/development-process/SubmitChecklist.rst 来获得在提交代码前需要检查的项目的列
 表。如果你在提交一个驱动程序，那么同时阅读一下
-Documentation/SubmittingDrivers 。
+Documentation/development-process/SubmittingDrivers.rst 。
 
 
 --------------------------
@@ -404,8 +404,8 @@ Greg Kroah-Hartman, "How to piss off a kernel subsystem maintainer".
 NO!!!! No more huge patch bombs to linux-kernel@vger.kernel.org people!
   <https://lkml.org/lkml/2005/7/11/336>
 
-Kernel Documentation/CodingStyle:
-  <http://sosdg.org/~coywolf/lxr/source/Documentation/CodingStyle>
+Kernel Documentation/development-process/CodingStyle.rst:
+  <http://sosdg.org/~coywolf/lxr/source/Documentation/development-process/CodingStyle.rst>
 
 Linus Torvalds's mail on the canonical patch format:
   <http://lkml.org/lkml/2005/4/7/183>
diff --git a/Documentation/zh_CN/stable_api_nonsense.txt b/Documentation/zh_CN/stable_api_nonsense.txt
index c26a27d1ee7d..5f37f56ab7ec 100644
--- a/Documentation/zh_CN/stable_api_nonsense.txt
+++ b/Documentation/zh_CN/stable_api_nonsense.txt
@@ -1,4 +1,4 @@
-Chinese translated version of Documentation/stable_api_nonsense.txt
+Chinese translated version of Documentation/development-process/stable_api_nonsense.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have problem
@@ -9,7 +9,7 @@ is problem with translation.
 Maintainer: Greg Kroah-Hartman <greg@kroah.com>
 Chinese maintainer: TripleX Chung <zhongyu@18mail.cn>
 ---------------------------------------------------------------------
-Documentation/stable_api_nonsense.txt 的中文翻译
+Documentation/development-process/stable_api_nonsense.rst 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
diff --git a/Documentation/zh_CN/stable_kernel_rules.txt b/Documentation/zh_CN/stable_kernel_rules.txt
index 26ea5ed7cd9c..e8e09a9a1891 100644
--- a/Documentation/zh_CN/stable_kernel_rules.txt
+++ b/Documentation/zh_CN/stable_kernel_rules.txt
@@ -1,4 +1,4 @@
-Chinese translated version of Documentation/stable_kernel_rules.txt
+Chinese translated version of Documentation/development-process/stable_kernel_rules.rst
 
 If you have any comment or update to the content, please contact the
 original document maintainer directly.  However, if you have a problem
@@ -8,7 +8,7 @@ or if there is a problem with the translation.
 
 Chinese maintainer: TripleX Chung <triplex@zh-kernel.org>
 ---------------------------------------------------------------------
-Documentation/stable_kernel_rules.txt 的中文翻译
+Documentation/development-process/stable_kernel_rules.rst 的中文翻译
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
@@ -38,7 +38,7 @@ Documentation/stable_kernel_rules.txt 的中文翻译
   - 没有“理论上的竞争条件”，除非能给出竞争条件如何被利用的解释。
   - 不能存在任何的“琐碎的”修正（拼写修正，去掉多余空格之类的）。
   - 必须被相关子系统的维护者接受。
-  - 必须遵循Documentation/SubmittingPatches里的规则。
+  - 必须遵循Documentation/development-process/SubmittingPatches.rst里的规则。
 
 向稳定版代码树提交补丁的过程：
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 9c4469949f28..5c64195f00ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -35,7 +35,7 @@ trivial patch so apply some common sense.
 
 	PLEASE check your patch with the automated style checker
 	(scripts/checkpatch.pl) to catch trivial style violations.
-	See Documentation/CodingStyle for guidance here.
+	See Documentation/development-process/CodingStyle.rst for guidance here.
 
 	PLEASE CC: the maintainers and mailing lists that are generated
 	by scripts/get_maintainer.pl.  The results returned by the
diff --git a/README b/README
index 09f34f78f2bb..0a5a8d862021 100644
--- a/README
+++ b/README
@@ -114,7 +114,7 @@ SOFTWARE REQUIREMENTS
 
    Compiling and running the 4.x kernels requires up-to-date
    versions of various software packages.  Consult
-   Documentation/Changes for the minimum version numbers required
+   Documentation/development-process/Changes.rst for the minimum version numbers required
    and how to get updates for these packages.  Beware that using
    excessively old versions of these packages can cause indirect
    errors that are very difficult to track down, so don't assume that
@@ -245,7 +245,7 @@ CONFIGURING the kernel:
 COMPILING the kernel:
 
  - Make sure you have at least gcc 3.2 available.
-   For more information, refer to Documentation/Changes.
+   For more information, refer to Documentation/development-process/Changes.rst.
 
    Please note that you can still run a.out user programs with this kernel.
 
diff --git a/REPORTING-BUGS b/REPORTING-BUGS
index 914baf9cf5fa..853c264bd092 100644
--- a/REPORTING-BUGS
+++ b/REPORTING-BUGS
@@ -55,7 +55,7 @@ files to the get_maintainer.pl script:
 
 If it is a security bug, please copy the Security Contact listed in the
 MAINTAINERS file.  They can help coordinate bugfix and disclosure.  See
-Documentation/SecurityBugs for more information.
+Documentation/development-process/SecurityBugs.rst for more information.
 
 If you can't figure out which subsystem caused the issue, you should file
 a bug in kernel.org bugzilla and send email to
diff --git a/drivers/net/ppp/Kconfig b/drivers/net/ppp/Kconfig
index 1373c6d7278d..49c93a693b67 100644
--- a/drivers/net/ppp/Kconfig
+++ b/drivers/net/ppp/Kconfig
@@ -15,7 +15,7 @@ config PPP
 	  To use PPP, you need an additional program called pppd as described
 	  in the PPP-HOWTO, available at
 	  <http://www.tldp.org/docs.html#howto>.  Make sure that you have
-	  the version of pppd recommended in <file:Documentation/Changes>.
+	  the version of pppd recommended in <file:Documentation/development-process/Changes.rst>.
 	  The PPP option enlarges your kernel by about 16 KB.
 
 	  There are actually two versions of PPP: the traditional PPP for
diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index d3c378b4db6c..b8ef9e674a49 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -26,7 +26,7 @@ config PCMCIA
 	   only using 32-bit CardBus cards, say Y or M here.
 
 	   To use 16-bit PCMCIA cards, you will need supporting software in
-	   most cases. (see the file <file:Documentation/Changes> for
+	   most cases. (see the file <file:Documentation/development-process/Changes.rst> for
 	   location and details).
 
 	   To compile this driver as modules, choose M here: the
diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index c7efddf6e038..aba0e09a0053 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -21,7 +21,7 @@ config BINFMT_ELF
 	  If you find that after upgrading from Linux kernel 1.2 and saying Y
 	  here, you still can't run any ELF binaries (they just crash), then
 	  you'll have to install the newest ELF runtime libraries, including
-	  ld.so (check the file <file:Documentation/Changes> for location and
+	  ld.so (check the file <file:Documentation/development-process/Changes.rst> for location and
 	  latest version).
 
 config COMPAT_BINFMT_ELF
diff --git a/fs/fuse/Kconfig b/fs/fuse/Kconfig
index 1b2f6c2c3aaf..f55c3596c21e 100644
--- a/fs/fuse/Kconfig
+++ b/fs/fuse/Kconfig
@@ -11,7 +11,7 @@ config FUSE_FS
 	  installed if you've installed the "fuse" package itself.
 
 	  See <file:Documentation/filesystems/fuse.txt> for more information.
-	  See <file:Documentation/Changes> for needed library/utility version.
+	  See <file:Documentation/development-process/Changes.rst> for needed library/utility version.
 
 	  If you want to develop a userspace FS, or if you want to use
 	  a filesystem based on FUSE, answer Y or M.
diff --git a/net/Kconfig b/net/Kconfig
index c2cdbce629bd..71edecbb7ee9 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -17,7 +17,7 @@ menuconfig NET
 	  should consider updating your networking tools too because changes
 	  in the kernel and the tools often go hand in hand. The tools are
 	  contained in the package net-tools, the location and version number
-	  of which are given in <file:Documentation/Changes>.
+	  of which are given in <file:Documentation/development-process/Changes.rst>.
 
 	  For a general introduction to Linux networking, it is highly
 	  recommended to read the NET-HOWTO, available from
@@ -159,7 +159,7 @@ menuconfig NETFILTER
 	  Various modules exist for netfilter which replace the previous
 	  masquerading (ipmasqadm), packet filtering (ipchains), transparent
 	  proxying, and portforwarding mechanisms. Please see
-	  <file:Documentation/Changes> under "iptables" for the location of
+	  <file:Documentation/development-process/Changes.rst> under "iptables" for the location of
 	  these packages.
 
 if NETFILTER
diff --git a/scripts/ver_linux b/scripts/ver_linux
index 0d8bd29b1bd6..931e933c4bcf 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -5,7 +5,7 @@
 # differ on your system.
 #
 echo 'If some fields are empty or look unusual you may have an old version.'
-echo 'Compare to the current minimal requirements in Documentation/Changes.'
+echo 'Compare to the current minimal requirements in Documentation/development-process/Changes.rst.'
 echo ' '
 
 uname -a
diff --git a/tools/testing/selftests/futex/README b/tools/testing/selftests/futex/README
index 0558bb9ce0a6..5253e7efd120 100644
--- a/tools/testing/selftests/futex/README
+++ b/tools/testing/selftests/futex/README
@@ -59,4 +59,4 @@ o FIXME: decide on a sane test naming scheme.  Currently the tests are named
 Coding Style
 ------------
 o The Futex Test project adheres to the coding standards set forth by Linux
-  kernel as defined in the Linux source Documentation/CodingStyle.
+  kernel as defined in the Linux source Documentation/development-process/CodingStyle.rst.
-- 
2.7.4
