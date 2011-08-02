From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v4 0/2] Add device tree support for i.mx51/53 boards
Date: Tue, 2 Aug 2011 15:06:10 +0100
Message-ID: <20110802140610.GC20071@ponder.secretlab.ca>
References: <1312267943-25551-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1312267943-25551-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 02, 2011 at 02:52:21PM +0800, Shawn Guo wrote:
> Changes since v3:
>  * Fix machine_desc table for ARD matching
>  * Turn the board setup that dt needs into callback
> 
> Changes since v2:
>  * Drop iomuxc device tree support patch
> 
> Changes since v1:
>  * Address comments on v1 given by Grant and Sascha
>  * Add i.mx51 Babbage support
> 
> Shawn Guo (2):
>       arm/mx5: add device tree support for imx53 boards
>       arm/mx5: add device tree support for imx51 babbage

Looks good.

Sascha, assuming you're okay with it, I'd *really* like to ask Arnd to
send this out to Linus immediately.  It may not be perfect, and we may
change the device disable/enable policy, but it is useful enough that
having it in mainline will help developers who want to start hacking
on DT support.

g.

> 
>  .../devicetree/bindings/arm/fsl/boards.txt         |   19 ++
>  arch/arm/boot/dts/imx51-babbage.dts                |  141 +++++++++++
>  arch/arm/boot/dts/imx51.dtsi                       |  203 ++++++++++++++++
>  arch/arm/boot/dts/imx53-ard.dts                    |  158 +++++++++++++
>  arch/arm/boot/dts/imx53-evk.dts                    |  144 ++++++++++++
>  arch/arm/boot/dts/imx53-qsb.dts                    |  148 ++++++++++++
>  arch/arm/boot/dts/imx53-smd.dts                    |  169 ++++++++++++++
>  arch/arm/boot/dts/imx53.dtsi                       |  244 ++++++++++++++++++++
>  arch/arm/mach-mx5/Kconfig                          |   21 ++
>  arch/arm/mach-mx5/Makefile                         |    3 +
>  arch/arm/mach-mx5/board-mx51_babbage.c             |    9 +-
>  arch/arm/mach-mx5/board-mx53_ard.c                 |   12 +-
>  arch/arm/mach-mx5/board-mx53_evk.c                 |    9 +-
>  arch/arm/mach-mx5/board-mx53_loco.c                |    9 +-
>  arch/arm/mach-mx5/board-mx53_smd.c                 |    9 +-
>  arch/arm/mach-mx5/imx51-dt.c                       |  111 +++++++++
>  arch/arm/mach-mx5/imx53-dt.c                       |  127 ++++++++++
>  arch/arm/plat-mxc/include/mach/common.h            |    6 +
>  18 files changed, 1530 insertions(+), 12 deletions(-)
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
