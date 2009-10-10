From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] Add Open Firmware / Flattened Device Tree entry to maintainers
Date: Sat, 10 Oct 2009 00:33:43 -0600
Message-ID: <20091010063334.6432.57743.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 MAINTAINERS |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 09a2028..7c801b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3869,6 +3869,15 @@ S:	Maintained
 F:	Documentation/i2c/busses/i2c-ocores
 F:	drivers/i2c/busses/i2c-ocores.c
 
+OPEN FIRMWARE AND FLATTENED DEVICE TREE
+M:	Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
+L:	devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
+W:	http://fdt.secretlab.ca
+S:	Maintained
+F:	drivers/of
+F:	include/linux/of*.h
+K:	of_get_property
+
 OPROFILE
 M:	Robert Richter <robert.richter-5C7GfCeVMHo@public.gmane.org>
 L:	oprofile-list-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org
