From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v3 0/2] amba bus device tree probing
Date: Wed, 25 May 2011 16:31:11 -0500
Message-ID: <1306359073-16274-1-git-send-email-robherring2@gmail.com>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

This is updated amba bus DT probe support. It has changed significantly since
v2 based on the discussion and the conclusions from that discussion:

- The Linux amba_bus is really for ARM Primecell peripherals, not a type of bus.
- The amba_bus is not going to be replaced by platform_bus.

The bus scanning is done entirely by of_platform_bus_populate/probe and only
the device creation is handled by the amba bus code. This patch set can support
Grant's options 2 or 3 depending on the match table used.

Applies to devicetree/next on git://git.secretlab.ca/git/linux-2.6

Rob

Rob Herring (2):
  drivers/amba: create devices from device tree
  dt: add custom device creation to platform bus scan

 drivers/amba/bus.c          |   51 +++++++++++++++++++++++++++++++++++++++++++
 drivers/of/platform.c       |   27 ++++++++++++++++------
 include/linux/amba/bus.h    |    5 ++++
 include/linux/of_platform.h |   11 ++++++--
 4 files changed, 83 insertions(+), 11 deletions(-)

-- 
1.7.4.1
