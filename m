From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Fwd: [PATCH 6/8] watchdog: davinci: reuse driver for keystone arch
Date: Sat, 23 Nov 2013 19:02:02 +0100
Message-ID: <201311231902.02807.arnd@arndb.de>
References: <1383680783-12114-7-git-send-email-ivan.khoronzhuk@ti.com>
 <527A28DE.4030906@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <527A28DE.4030906@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, pawel.moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, nsekhar@ti.com, galak@kernel.crashing.org, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, wim@iguana.be, Santosh Shilimkar <santosh.shilimkar@ti.com>, grant.likely@linaro.org, "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 06 November 2013, ivan.khoronzhuk wrote:

> @@ -1,13 +1,20 @@
> -DaVinci Watchdog Timer (WDT) Controller
> +Texas Instruments DaVinci/Keystone Watchdog Timer (WDT) Controller
>  
>  Required properties:
> -- compatible : Should be "ti,davinci-wdt"
> +
> +- compatible:          "ti,davinci-wdt"
> +                       "ti,keystone-wdt"
> +
>  - reg : Should contain WDT registers location and length
>  

...

> @@ -229,6 +229,7 @@ static int davinci_wdt_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id davinci_wdt_of_match[] = {
>         { .compatible = "ti,davinci-wdt", },
> +       { .compatible = "ti,keystone-wdt", },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, davinci_wdt_of_match);

You should clarify the compatible list here: It seems that the devices are fully
compatible, so the driver should only need to check for "ti,davinci-wdt" as the
compatible string, while the dtb files should list both "ti,davinci-wdt" and
"ti,keystone-wdt" for keystone, but only the davinci string for davinci.

	Arnd
