From: Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 1/2] add cscope Makefile target
Date: Mon, 29 Jul 2013 21:24:00 +0000
Message-ID: <dcc21753a1bf975fc97c5f4c8d089e1fb4b00dd2.1375131816.git.jason@lakedaemon.net>
References: <cover.1375131816.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1375131816.git.jason@lakedaemon.net>
In-Reply-To: <cover.1375131816.git.jason@lakedaemon.net>
References: <51F2A014.7000209@gmail.com>
 <cover.1375131816.git.jason@lakedaemon.net>
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

Signed-off-by: Jason Cooper <jason@lakedaemon.net>
---
 .gitignore | 1 +
 Makefile   | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/.gitignore b/.gitignore
index c3b59bf..ac4198c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,6 +1,7 @@
 *.sh
 *.o
 *.bin
+cscope.*
 matcher
 uImage
 input/zImage
diff --git a/Makefile b/Makefile
index 5ad5fc0..daeafa4 100644
--- a/Makefile
+++ b/Makefile
@@ -43,3 +43,9 @@ uImage: matcher.bin
 clean:
 	rm -fr matcher.bin matcher *.o uImage
 
+distclean:
+	rm -fr cscope.*
+
+cscope:
+	-find . -name "*.[chS]" >cscope.files
+	-cscope -b -R
-- 
1.8.3.2
