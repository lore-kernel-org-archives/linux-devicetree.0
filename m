From: Jerry Van Baren <gvb.uboot@gmail.com>
Subject: Re: [PATCH 0/14] fdt: Add various device tree utilities
 and features
Date: Sat, 17 Nov 2012 20:35:55 -0500
Message-ID: <50A83B7B.4080506@gmail.com>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1351218671-15228-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@ti.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Dear Simon,

Sorry for being so late on this (the patches were submitted before the
merge window closed).  I've applied the patches to the "next" branch in
the u-boot-fdt repo.
  <http://git.denx.de/?p=u-boot/u-boot-fdt.git;a=shortlog;h=refs/heads/next>

I'm assuming these are still valid (Simon) and eligible to be applied to
the v2013.01 u-boot release (Tom).  If so, I'll submit a pull request.

On 10/25/2012 10:30 PM, Simon Glass wrote:
> This series contains a number of features related to CONFIG_OF_CONTROL,
> such as:
> 
> - reading fdt values
> - reading configuration from the fdt
> - allowing the fdt to specify a boot command

[snip]

>  README             |   11 +++++
>  common/cmd_bootm.c |   11 +++++
>  common/image.c     |  127 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  common/main.c      |  102 +++++++++++++++++++++++++++++++++++++++++-
>  include/fdtdec.h   |  121 +++++++++++++++++++++++++++++++++++++++++++++++++
>  include/image.h    |    1 +
>  lib/fdtdec.c       |  107 +++++++++++++++++++++++++++++++++++++++++---
>  7 files changed, 472 insertions(+), 8 deletions(-)

Again, my apologies,
gvb
