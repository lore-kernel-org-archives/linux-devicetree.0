From: Daniel Morsing <daniel.morsing-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH] Device tree enable the DM9000 driver
Date: Tue,  9 Aug 2011 21:57:28 +0200
Message-ID: <1312919849-4979-1-git-send-email-daniel.morsing@gmail.com>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Daniel Morsing <daniel.morsing-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a first draft for device tree enabling the DM9000 driver.
The dm9000 is used for a couple of development boards as a low cost ethernet
controller. Currently there are no users in the kernel, but once support for
device trees mature on OMAP3, I plan to migrate the Devkit8000 development
board to DT.

The patch was originally based on 3.0, so it may contain anachronisms.
First time playing with device trees, so if i've misunderstood
anything, Sorry :).

Daniel Morsing (1):
  net: dm9000: add support for device tree probing

 Documentation/devicetree/bindings/net/dm9000.txt |   46 ++++++++++++
 drivers/net/dm9000.c                             |   85 ++++++++++++++++++++++
 2 files changed, 131 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/dm9000.txt

-- 
1.7.6
