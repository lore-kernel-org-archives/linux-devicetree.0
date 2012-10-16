From: Michael Ellerman <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: [PATCH] dtc: srcpos_verror() should print to stderr
Date: Tue, 16 Oct 2012 17:58:56 +1100
Message-ID: <1350370736-22789-1-git-send-email-michael@ellerman.id.au>
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
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Errors should go to stderr.

Signed-off-by: Michael Ellerman <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
---
 srcpos.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/srcpos.c b/srcpos.c
index 246ab4b..c20bc53 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -297,9 +297,9 @@ srcpos_verror(struct srcpos *pos, char const *fmt, va_list va)
 
        srcstr = srcpos_string(pos);
 
-       fprintf(stdout, "Error: %s ", srcstr);
-       vfprintf(stdout, fmt, va);
-       fprintf(stdout, "\n");
+       fprintf(stderr, "Error: %s ", srcstr);
+       vfprintf(stderr, fmt, va);
+       fprintf(stderr, "\n");
 }
 
 void
-- 
1.7.9.5
