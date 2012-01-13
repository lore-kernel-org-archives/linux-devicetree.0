From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCH 0/2] Full DT IRQ support for versatile
Date: Fri, 13 Jan 2012 00:43:59 +0000
Message-ID: <1326415441-17695-1-git-send-email-jamie@jamieiles.com>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

These patches move versatile over to instantiating both interrupt
controllers from the device tree.  I've tested this in qemu for both DT
and non-DT platforms but only with an initramfs.  I've seen interrupts
generated on both controllers for both boot methods.

Grant, Rob, this makes use of irqdomain again as I'm not sure what the
replacement is going to look like yet.  versatile works with DT in
mainline, but that's kind of lucky...  I know there's been patches to
make irq_domain_add_simple() return the irq_domain and can rebase if
needed.

Jamie Iles (2):
  versatile: sic: add device tree bindings
  versatile: dt: register interrupt controllers from dt

 .../devicetree/bindings/arm/versatile-sic.txt      |   27 ++++++++++
 arch/arm/mach-versatile/core.c                     |   27 +++-------
 arch/arm/mach-versatile/core.h                     |    1 +
 arch/arm/mach-versatile/versatile_dt.c             |   15 +++++-
 arch/arm/plat-versatile/Kconfig                    |    1 +
 arch/arm/plat-versatile/fpga-irq.c                 |   51 +++++++++++++++++++-
 arch/arm/plat-versatile/include/plat/fpga-irq.h    |    6 ++
 7 files changed, 106 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/versatile-sic.txt

-- 
1.7.5.4
