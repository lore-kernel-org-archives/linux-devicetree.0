From: Ian Campbell <ijc@hellion.org.uk>
Subject: Re: [PATCH 0/2 v5] arm: kirkwood: add dreamplug/devicetree support
Date: Sun, 26 Feb 2012 11:00:38 +0000
Message-ID: <1330254038.10008.24.camel@dagon.hellion.org.uk>
References: <cover.1312906908.git.jason@lakedaemon.net>
 <cover.1330025976.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1330025976.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On Thu, 2012-02-23 at 19:52 +0000, Jason Cooper wrote:
> This patch series provides initial support for devicetree on kirkwood for the
> dreamplug platform.  After discussing the approach with Arnd Bergman last week
> at ELC, we decided to take an incremental approach to the conversion.  First, I
> would detect that we were on the dreamplug via the devicetree blob.  Then,
> configure uart0 via devicetree.  We chose the uart since it is already well
> supported under devicetree.
> 
> This patch series has been boot-tested on the dreamplug.

Tested-by: Ian Campbell <ijc@hellion.org.uk>

I needed the following (obvious) patch against u-boot:

diff --git a/include/configs/dreamplug.h b/include/configs/dreamplug.h
index 0f2f9a2..76f9eea 100644
--- a/include/configs/dreamplug.h
+++ b/include/configs/dreamplug.h
@@ -148,4 +148,6 @@
  */
 #define CONFIG_DISPLAY_CPUINFO
 
+#define CONFIG_OF_LIBFDT
+
 #endif /* _CONFIG_DREAMPLUG_H */


Ian.
