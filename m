From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [RFC PATCH 0/2] WIP: generic OF pinmux binding
Date: Wed, 17 Aug 2011 12:47:26 +0100
Message-ID: <1313581648-22303-1-git-send-email-jamie@jamieiles.com>
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
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

To avoid going too far in the wrong direction I thought I'd post what I
have so far for a generic pinmux binding.  Essentially it's just
Stephen's nvidia binding but with the nvidia specifics abstracted out so
the common loop can be used for other platforms.  This approach works
nicely for picoxcell too.

For more esoteric bindings, such as pull strength, these could be
handled in the platform specific configuration function.

This doesn't address the runtime muxing that LinusW's set of patches do,
and I'm not sure how to handle that.

Jamie Iles (1):
  of: add a generic pinmux helper

Stephen Warren (1):
  arm/tegra: Add device tree support to pinmux driver

 arch/arm/mach-tegra/pinmux.c |  240 ++++++++++++++++++++++++++++++++++++++++++
 drivers/of/Kconfig           |    5 +
 drivers/of/Makefile          |    1 +
 drivers/of/of_pinmux.c       |   80 ++++++++++++++
 include/linux/of_pinmux.h    |   67 ++++++++++++
 5 files changed, 393 insertions(+), 0 deletions(-)
 create mode 100644 drivers/of/of_pinmux.c
 create mode 100644 include/linux/of_pinmux.h

-- 
1.7.4.1
