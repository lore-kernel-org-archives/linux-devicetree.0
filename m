From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/4] amba bus devicetree probing
Date: Fri, 10 Jun 2011 15:48:39 -0500
Message-ID: <1307738923-7564-1-git-send-email-robherring2@gmail.com>
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
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

This is updated amba bus DT probe support. Amba devices are now handled as a
special case in the device tree bus scanning code. Found devices with a
"arm,amba-device" compatible property will be created by of_amba_device_create.

The first 2 patches are fixes for of_platform_populate.

Applies to devicetree/next on git://git.secretlab.ca/git/linux-2.6

Compile tested with DT enabled and AMBA bus enabled or disabled. 

Rob

Rob Herring (4):
  dt: check root nodes for match on of_platform_populate
  dt: add EXPORT_SYMBOL to of_platform_populate
  drivers/amba: create devices from device tree
  dt: add amba device creation to platform bus scan

 Documentation/devicetree/bindings/arm/amba.txt |   21 ++++++++++
 drivers/amba/bus.c                             |   51 ++++++++++++++++++++++++
 drivers/of/platform.c                          |    9 ++++
 include/linux/amba/bus.h                       |   18 ++++++++
 4 files changed, 99 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/amba.txt

-- 
1.7.4.1
