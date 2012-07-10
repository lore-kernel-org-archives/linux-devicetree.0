From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/5] fdtput: Fix nit in help message
Date: Tue, 10 Jul 2012 05:56:44 -0700
Message-ID: <1341925008-10627-1-git-send-email-sjg@chromium.org>
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
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There was an extra < in the help message, so fix it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 fdtput.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index f6ebd24..244d1f1 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -162,7 +162,7 @@ static const char *usage_msg =
 	"The command line arguments are joined together into a single value.\n"
 	"\n"
 	"Usage:\n"
-	"	fdtput <options> <dt file> <<node> <property> [<value>...]\n"
+	"	fdtput <options> <dt file> <node> <property> [<value>...]\n"
 	"Options:\n"
 	"\t-t <type>\tType of data\n"
 	"\t-v\t\tVerbose: display each value decoded from command line\n"
-- 
1.7.7.3
