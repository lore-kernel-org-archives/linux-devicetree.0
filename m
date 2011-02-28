From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 3/4] ARM:boot:device tree: Add puthex routine for use in the
	boot wrapper
Date: Mon, 28 Feb 2011 15:33:47 -0800
Message-ID: <20110228233346.24836.48614.stgit@riker>
References: <20110228233153.24836.24176.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110228233153.24836.24176.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a routine named 'puthex'. This allows the boot wraper code to
display hex numbers.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/arm/boot/compressed/misc.c |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/compressed/misc.c b/arch/arm/boot/compressed/misc.c
index 2d4da4c..9af05ed 100644
--- a/arch/arm/boot/compressed/misc.c
+++ b/arch/arm/boot/compressed/misc.c
@@ -113,6 +113,31 @@ void putstr(const char *ptr)
 	flush();
 }
 
+void puthex(unsigned i)
+{
+	unsigned rem;
+	char str[32];
+	int str_idx = sizeof(str) - 1;;
+
+	str[str_idx--] = '\0';
+	putstr("0x");
+	if (!i) {
+		putstr("0");
+	} else {
+		while (i) {
+			rem = i % 16;
+
+			if (rem < 10) {
+				str[str_idx--] = rem + '0';
+			} else {
+				str[str_idx--] = (rem - 10) + 'a';
+			}
+			i = i / 16;
+		}
+
+		putstr(&str[str_idx + 1]);
+	}
+}
 
 #ifdef CONFIG_ARM_APPENDED_DTB
 /**
