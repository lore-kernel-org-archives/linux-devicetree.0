From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH] Allow simple cross-compilation of library
Date: Wed, 27 Jun 2012 08:22:57 -0500
Message-ID: <E1SjsCv-0006dk-SV@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Christoffer Dall <c.dall-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>
List-Id: devicetree@vger.kernel.org


[ Forwarded to devicetree dev list for comment. --jdl ]


------- Forwarded Message

Subject: [PATCH] Allow simple cross-compilation of library
To: jdl-CYoMK+44s/E@public.gmane.org
From: Christoffer Dall <c.dall-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>
Date: Tue, 05 Jun 2012 13:09:59 -0400
Message-ID: <20120605170959.12774.39782.stgit@ubuntu>


This is extremely useful when cross-compiling the library to be
linked with cross-compiled QEMU.

Signed-off-by: Christoffer Dall <c.dall-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>
- ---
 Makefile |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 1169e6c..efa79c1 100644
- --- a/Makefile
+++ b/Makefile
@@ -15,6 +15,10 @@ EXTRAVERSION =
 LOCAL_VERSION =
 CONFIG_LOCALVERSION =
 
+CC=${CROSS_COMPILE}gcc
+LD=${CROSS_COMPILE}ld
+AS=${CROSS_COMPILE}as
+
 CPPFLAGS = -I libfdt -I .
 WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls


------- End of Forwarded Message
