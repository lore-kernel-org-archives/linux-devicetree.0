From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: implement machine restart hook
Date: Fri, 28 Sep 2012 12:31:40 +0200
Message-ID: <20120928103140.GZ17667@game.jcrosoft.org>
References: <1348805280-7647-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1348805280-7647-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22:08 Thu 27 Sep     , Stephen Warren wrote:
> Implement the machine restart hook using the SoC's watchdog timer module.
> To support this, define a DT binding for the watchdog module, and add it
> to the device tree.
> 
> The downstream rpi-split branch contains a full watchdog timer driver
> implementation, which also implements the restart hook. However, the
> restart function is largely separate from the watchdog driver, so for
> simplicity, the restart hook is implemented here directly in the main
> machine source file.
> 
> Overall structure (separate setup/restart) functions derived from the
> picoxcell ARM support.
> 
> Watchdog register IO sequence taken from code by Simon Arlott. Note that
> the watchdog module is not documented in BCM2835-ARM-Peripherals.pdf.
> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
>  .../bindings/watchdog/brcm,bcm2835-pm-wdog.txt     |   13 ++++++
>  arch/arm/boot/dts/bcm2835.dtsi                     |    5 +++
>  arch/arm/mach-bcm2835/bcm2835.c                    |   46 ++++++++++++++++++++
>  3 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm2835-pm-wdog.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm2835-pm-wdog.txt b/Documentation/devicetree/bindings/watchdog/brcm,bcm2835-pm-wdog.txt
> new file mode 100644
> index 0000000..03138e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm2835-pm-wdog.txt
> @@ -0,0 +1,13 @@
> +BCM2835 Watchdog timer
> +
> +Required properties:
> +
> +- compatible : should be "brcm,bcm2835-pm-wdog"
> +- reg : Specifies base physical address and size of the registers.
> +
> +Example:
> +
> +intc: interrupt-controller {
> +	compatible = "brcm,bcm2835-pm-wdog";
it's seems everyone use -wdt

Best Regards,
J.
