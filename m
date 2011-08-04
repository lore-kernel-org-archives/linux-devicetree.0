From: "Koul, Vinod" <vinod.koul@intel.com>
Subject: Re: [PATCH v2 0/3] Add device tree probe for imx-sdma driver
Date: Thu, 04 Aug 2011 09:29:32 +0530
Message-ID: <1312430372.1536.554.camel@vkoul-udesk3>
References: <1310723066-567-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1310723066-567-1-git-send-email-shawn.guo@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, 2011-07-15 at 17:44 +0800, Shawn Guo wrote:
> The first patch remove the use of software defined sdma version, and
> instead uses platform_device_id to handle the sdma differences from
> one soc to another.  The second one makes a small cleanup on function
> sdma_get_firmware(), and the third patch adds the actual device tree
> probe support.
> 
> Changes since v1:
>  * Do not encode ROM script address in device tree
>  * Add one more small cleanup on function sdma_get_firmware()
> 
> ShawnsGuo (3):
>       dmaengine: imx-sdma: use platform_device_id to identify sdma version
>       dmaengine: imx-sdma: sdma_get_firmware does not need to copy fw_name
>       dmaengine: imx-sdma: add device tree probe support
> 
Sacha are you okay if this go via my tree, would need your ack before I
take this one

>  .../devicetree/bindings/dma/fsl-imx-sdma.txt       |   17 ++++
>  arch/arm/mach-imx/clock-imx25.c                    |    3 +-
>  arch/arm/mach-imx/clock-imx31.c                    |    2 +-
>  arch/arm/mach-imx/clock-imx35.c                    |    2 +-
>  arch/arm/mach-imx/mm-imx25.c                       |    4 +-
>  arch/arm/mach-imx/mm-imx31.c                       |    3 +-
>  arch/arm/mach-imx/mm-imx35.c                       |    3 +-
>  arch/arm/mach-mx5/clock-mx51-mx53.c                |    6 +-
>  arch/arm/mach-mx5/mm.c                             |    8 +-
>  arch/arm/plat-mxc/devices/platform-imx-dma.c       |    4 +-
>  arch/arm/plat-mxc/include/mach/devices-common.h    |    2 +-
>  arch/arm/plat-mxc/include/mach/dma.h               |    3 +-
>  arch/arm/plat-mxc/include/mach/sdma.h              |    2 -
>  drivers/dma/imx-sdma.c                             |   92 +++++++++++++++-----
>  14 files changed, 107 insertions(+), 44 deletions(-)


-- 
~Vinod
