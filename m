From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] dtc: give advance warning that "-S" is going away.
Date: Wed, 30 Jul 2008 09:59:16 -0400
Message-ID: <1217426356-1248-1-git-send-email-paul.gortmaker@windriver.com>
References: <E1KOBwm-0002vc-CT@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <E1KOBwm-0002vc-CT@jdl.com>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: devicetree-discuss@ozlabs.org
Cc: linuxppc-dev@ozlabs.org, jdl@jdl.com, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: devicetree@vger.kernel.org

The "-S" option allowed the specification of a minimum size for
the blob, however the main reason for caring about the size is
so there is enough padding to add a chosen node by u-boot or
whoever.  In which case, folks don't really care about the absolute
size, but rather the size of the padding added for this -- which
is what the "-p" option does.  Having the "-S" just confuses people.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 dtc.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/dtc.c b/dtc.c
index d8fd43b..84bee2d 100644
--- a/dtc.c
+++ b/dtc.c
@@ -182,6 +182,9 @@ int main(int argc, char *argv[])
 	if (minsize && padsize)
 		die("Can't set both -p and -S\n");
 
+	if (minsize)
+		fprintf(stderr, "DTC: Use of \"-S\" is deprecated; it will be removed soon, use \"-p\" instead\n");
+
 	fprintf(stderr, "DTC: %s->%s  on file \"%s\"\n",
 		inform, outform, arg);
 
-- 
1.5.6.2
