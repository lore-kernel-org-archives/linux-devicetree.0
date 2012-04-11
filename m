From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2] dtc: Remove spurious output on stderr
Date: Wed, 11 Apr 2012 16:32:26 -0700
Message-ID: <1334187146-8384-1-git-send-email-sjg@chromium.org>
References: <1334170516-23473-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334170516-23473-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Outputing to stderr is best avoided unless there is an error or warning to
display. At present dtc always displays the name of the file it is compiling
and the input/output formats. For example:

DTC: dts->dts  on file "-"

This can cause problems in some build systems. For example, U-Boot shows
build errors for any boards which use dtc at present. It is typically the
only message output during such a build. The C compiler does not output
anything in general. The current dtc behaviour makes it difficult to
provide a silent build in the normal case where nothing went wrong.

Remove the message entirely.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Drop the announce option; just remove the stderr output completely

 dtc.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/dtc.c b/dtc.c
index 83aef32..bee5085 100644
--- a/dtc.c
+++ b/dtc.c
@@ -193,9 +193,6 @@ int main(int argc, char *argv[])
 	if (minsize)
 		fprintf(stderr, "DTC: Use of \"-S\" is deprecated; it will be removed soon, use \"-p\" instead\n");
 
-	fprintf(stderr, "DTC: %s->%s  on file \"%s\"\n",
-		inform, outform, arg);
-
 	if (depname) {
 		depfile = fopen(depname, "w");
 		if (!depfile)
-- 
1.7.7.3
