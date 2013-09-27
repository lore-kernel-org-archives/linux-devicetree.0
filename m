From: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Subject: Re: [PATCH v4 1/2] video: ARM CLCD: Add DT support
Date: Fri, 27 Sep 2013 11:43:02 +0100
Message-ID: <1380278582.3433.10.camel@linaro1.home>
References: <1379686800-27269-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1379686800-27269-1-git-send-email-pawel.moll@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 2013-09-20 at 15:19 +0100, Pawel Moll wrote:
> This patch adds basic DT bindings for the PL11x CLCD cells
> and make their fbdev driver use them.
> 
> Signed-off-by: Pawel Moll <pawel.moll@arm.com>
> ---

[...]

> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 84b685f..b7d8c23 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -316,6 +316,7 @@ config FB_ARMCLCD
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT

To avoid undefined reference to of_get_fb_videomode I needed to also
add:

	select FB_MODE_HELPERS

> +	select VIDEOMODE_HELPERS if OF
>  	help
>  	  This framebuffer device driver is for the ARM PrimeCell PL110
>  	  Colour LCD controller.  ARM PrimeCells provide the building

[...]

With the config change, for both this patch and patch 2/2 

Tested-by: Jon Medhurst <tixy@linaro.org>

(I tested both DT and ATAGs booting on Versatile Express with CA9x4
CoreTile, and DT boot with CA15_A7 a.k.a TC2 :-)

-- 
Tixy
