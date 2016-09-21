Return-Path: <mchehab@s-opensource.com>
Date: Wed, 21 Sep 2016 08:56:07 -0300
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: Re: [PATCH v4 29/29] docs-rst: move HOWTO and mentioned documents
 to development-process/
Message-ID: <20160921085607.764f22b6@vento.lan>
In-Reply-To: <e05d7a0ad23f6ec723b572f217e2ecc1f6123d1d.1474280152.git.mchehab@s-opensource.com>
References: <cover.1474280152.git.mchehab@s-opensource.com>
	<e05d7a0ad23f6ec723b572f217e2ecc1f6123d1d.1474280152.git.mchehab@s-opensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Markus Heiser <markus.heiser@darmarit.de>, Jani Nikula <jani.nikula@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Karsten Keil <isdn@linux-pingi.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Wim Van Sebroeck <wim@iguana.be>, Harry Wei <harryxiyou@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>, "David S. Miller" <davem@davemloft.net>, Shuah Khan <shuah@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Loctaux <phil@philippeloctaux.com>, Peter Loeffler <peter.loeffler@guruz.at>, Doug Smythies <doug.smythies@gmail.com>, Alex Henrie <alexhenrie24@gmail.com>, Chris Metcalf <cmetcalf@ezchip.com>, Jakub Wilk <jwilk@jwilk.net>, Darren Hart <dvhart@infradead.org>, Eddie Kovsky <ewk@edkovsky.org>, Luis de Bethencourt <luisbg@osg.samsung.com>, Richard Weinberger <richard@nod.at>, SeongJae Park <sj38.park@gmail.com>, Masanari Iida <standby24x7@gmail.com>, Minchan Kim <minchan@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Kalle Valo <kvalo@codeaurora.org>, Diego Viola <diego.viola@gmail.com>, "=?UTF-8?B?w5h5dmluZA==?= A. Holm" <sunny@sunbase.org>, Manuel =?UTF-8?B?UMOpZ291cmnDqS1Hb25uYXJk?= <mpg@elzevir.fr>, Jiri Kosina <jikos@kernel.org>, Alexander Kapshuk <alexander.kapshuk@gmail.com>, Wei Jiangang <weijg.fnst@cn.fujitsu.com>, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, netdev@vger.kernel.org, stable@vger.kernel.org, kvm@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@zh-kernel.org, linux-pcmcia@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Em Mon, 19 Sep 2016 08:08:03 -0300
Mauro Carvalho Chehab <mchehab@s-opensource.com> escreveu:

> In preparation to add those files to the Sphinx build logic,
> move them to development-process/ dir and rename their extension
> to RST.
> 
> Please notice that the main README file was not moved. It
> probably makes sense to move it too as well, in order to be
> able to parse it via Sphinx, but this could be counter-intuitive.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

Jon,

Just tested some alternative approaches for this patch:

1) I tried to use:
	../HOWTO

at the development-process/index.rst.

This didn't work, because of the file extension, as one might
expect. 

2) Use soft symlinks.

This approach worked.

See the enclosed patch.

If you prefer such approach, please apply this patch as well:
	[PATCH] docs-rst: add inter-document cross references

In order to do the cross-references between those documents.

PS.: It is still including SecurityBugs on the development
process book (and the directory was not renamed to a shorter
name).

I intend to work on a patchset adding an "user" book, where
SecurityBugs would fit better.

---

docs-rst: add documents to development-process
    
Add several documents to the development-process ReST book.
    
As we don't want renames, use symlinks instead, keeping those
documents on their original place.
    
Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

diff --git a/Documentation/development-process/Changes.rst b/Documentation/development-process/Changes.rst
new file mode 120000
index 000000000000..91698e7753f1
--- /dev/null
+++ b/Documentation/development-process/Changes.rst
@@ -0,0 +1 @@
+../Changes
\ No newline at end of file
diff --git a/Documentation/development-process/CodingStyle.rst b/Documentation/development-process/CodingStyle.rst
new file mode 120000
index 000000000000..0377b2fe8778
--- /dev/null
+++ b/Documentation/development-process/CodingStyle.rst
@@ -0,0 +1 @@
+../CodingStyle
\ No newline at end of file
diff --git a/Documentation/development-process/HOWTO.rst b/Documentation/development-process/HOWTO.rst
new file mode 120000
index 000000000000..10734efe8eab
--- /dev/null
+++ b/Documentation/development-process/HOWTO.rst
@@ -0,0 +1 @@
+../HOWTO
\ No newline at end of file
diff --git a/Documentation/development-process/ManagementStyle.rst b/Documentation/development-process/ManagementStyle.rst
new file mode 120000
index 000000000000..a7d15159c108
--- /dev/null
+++ b/Documentation/development-process/ManagementStyle.rst
@@ -0,0 +1 @@
+../ManagementStyle
\ No newline at end of file
diff --git a/Documentation/development-process/SecurityBugs.rst b/Documentation/development-process/SecurityBugs.rst
new file mode 120000
index 000000000000..fa5504256c04
--- /dev/null
+++ b/Documentation/development-process/SecurityBugs.rst
@@ -0,0 +1 @@
+../SecurityBugs
\ No newline at end of file
diff --git a/Documentation/development-process/SubmitChecklist.rst b/Documentation/development-process/SubmitChecklist.rst
new file mode 120000
index 000000000000..7b75ef138e89
--- /dev/null
+++ b/Documentation/development-process/SubmitChecklist.rst
@@ -0,0 +1 @@
+../SubmitChecklist
\ No newline at end of file
diff --git a/Documentation/development-process/SubmittingDrivers.rst b/Documentation/development-process/SubmittingDrivers.rst
new file mode 120000
index 000000000000..955fc75e6759
--- /dev/null
+++ b/Documentation/development-process/SubmittingDrivers.rst
@@ -0,0 +1 @@
+../SubmittingDrivers
\ No newline at end of file
diff --git a/Documentation/development-process/SubmittingPatches.rst b/Documentation/development-process/SubmittingPatches.rst
new file mode 120000
index 000000000000..bd9bb84255d4
--- /dev/null
+++ b/Documentation/development-process/SubmittingPatches.rst
@@ -0,0 +1 @@
+../SubmittingPatches
\ No newline at end of file
diff --git a/Documentation/development-process/applying-patches.rst b/Documentation/development-process/applying-patches.rst
new file mode 120000
index 000000000000..c124a067a16b
--- /dev/null
+++ b/Documentation/development-process/applying-patches.rst
@@ -0,0 +1 @@
+../applying-patches.txt
\ No newline at end of file
diff --git a/Documentation/development-process/email-clients.rst b/Documentation/development-process/email-clients.rst
new file mode 120000
index 000000000000..b4bbad729cca
--- /dev/null
+++ b/Documentation/development-process/email-clients.rst
@@ -0,0 +1 @@
+../email-clients.txt
\ No newline at end of file
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
diff --git a/Documentation/development-process/kernel-docs.rst b/Documentation/development-process/kernel-docs.rst
new file mode 120000
index 000000000000..1075b84514ff
--- /dev/null
+++ b/Documentation/development-process/kernel-docs.rst
@@ -0,0 +1 @@
+../kernel-docs.txt
\ No newline at end of file
diff --git a/Documentation/development-process/stable_api_nonsense.rst b/Documentation/development-process/stable_api_nonsense.rst
new file mode 120000
index 000000000000..2c44a79fdeef
--- /dev/null
+++ b/Documentation/development-process/stable_api_nonsense.rst
@@ -0,0 +1 @@
+../stable_api_nonsense.txt
\ No newline at end of file
diff --git a/Documentation/development-process/stable_kernel_rules.rst b/Documentation/development-process/stable_kernel_rules.rst
new file mode 120000
index 000000000000..320a01411304
--- /dev/null
+++ b/Documentation/development-process/stable_kernel_rules.rst
@@ -0,0 +1 @@
+../stable_kernel_rules.txt
\ No newline at end of file
