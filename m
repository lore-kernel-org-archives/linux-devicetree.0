From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 0/3] Finish Armada DRM DT support
Date: Tue, 18 Dec 2018 16:21:20 +0100
Message-ID: <1174d7f6742f1c4555f39fbbf2069d7b14193f6c.camel@v3.sk>
References: <20180710102344.GH17271@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180710102344.GH17271@n2100.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-07-10 at 11:23 +0100, Russell King - ARM Linux wrote:
> Finish Armada DRM support for DT, finally allowing mainline kernels to
> use this driver unimpeded.
> 
>  arch/arm/boot/dts/dove-cubox.dts     | 43 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/armada/Makefile      |  3 +++
>  drivers/gpu/drm/armada/armada_drv.c  | 29 ++++++++++++++++++---
>  drivers/gpu/drm/armada/armada_rmem.c | 49 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 121 insertions(+), 3 deletions(-)

Hi,

thank you for these patches. I've found them while figuring out how to
make the Armada DRM driver work on an OLPC XO-1.75. Seems like they
slipped through the cracks and were never applied.

With a little more work they indeed seem to work well on my laptop.
Feel free to slap in my Tested-by tag (and Reviewed-by, if one from me
is any worth in the DRM land):

Tested-by: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Lubomir Rintel <lkundrak@v3.sk>

The testing essentially consisted of checking that framebuffer
emulation, console and "weston --use-pixman" work.

I'll post the XO-1.75 patches that build on top of this soonish. I'm
fairly new to DRM and they would certainly require significant changes
before they could be integrated though.

Thanks,
Lubo
