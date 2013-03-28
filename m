From: Christian Daudt <csd_b-jCriFORwCPHYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH V7 2/2] ARM: bcm281xx: Add timer driver (DT portion)
Date: Thu, 28 Mar 2013 09:07:41 -0700
Message-ID: <CAGFynZ_YEHbUQxGFgp_SA__4xRge64oQ-y5ypXhV5mhtM2k4+w@mail.gmail.com>
References: <1363210048-3334-1-git-send-email-csd@broadcom.com>
 <1363210048-3334-2-git-send-email-csd@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1363210048-3334-2-git-send-email-csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
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
To: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "grant.likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 13, 2013 at 2:27 PM, Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> This adds support for the Broadcom timer, used in the following SoCs:
> BCM11130, BCM11140, BCM11351, BCM28145, BCM28155
>
> Updates from V6:
> - Split DT portion into a separate patch
>
> Updates from V5:
> - Rebase to latest arm-soc/for-next
>
> Updates from V4:
> - Switch code to use CLOCKSOURCE_OF_DECLARE
>
> Updates from V3:
> - Migrate to 3.9 timer framework updates
>
> Updates from V2:
> - prepend static fns + fields with kona_
>
> Updates from V1:
> - Rename bcm_timer.c to bcm_kona_timer.c
> - Pull .h into bcm_kona_timer.c
> - Make timers static
> - Clean up comment block
> - Switched to using clockevents_config_and_register
> - Added an error to the get_timer loop if it repeats too much
> - Added to Documentation/devicetree/bindings/arm/bcm/bcm,kona-timer.txt
> - Added missing readl to timer_disable_and_clear
>
> Note: bcm,kona-timer was kept as the 'compatible' field to make it
> specific enough for when there are multiple bcm timers (bcm,timer is
> too generic).
>
> Signed-off-by: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Acked-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm,kona-timer.txt b/Documentation/devicetree/bindings/arm/bcm/bcm,kona-timer.txt
> new file mode 100644
> index 0000000..59fa6e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/bcm/bcm,kona-timer.txt
> @@ -0,0 +1,19 @@
> +Broadcom Kona Family timer
> +-----------------------------------------------------
> +This timer is used in the following Broadcom SoCs:
> + BCM11130, BCM11140, BCM11351, BCM28145, BCM28155
> +
> +Required properties:
> +- compatible : "bcm,kona-timer"
> +- reg : Register range for the timer
> +- interrupts : interrupt for the timer
> +- clock-frequency: frequency that the clock operates
> +
> +Example:
> +       timer@35006000 {
> +               compatible = "bcm,kona-timer";
> +               reg = <0x35006000 0x1000>;
> +               interrupts = <0x0 7 0x4>;
> +               clock-frequency = <32768>;
> +       };
> +
> diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
> index ad13588..8f71f40 100644
> --- a/arch/arm/boot/dts/bcm11351.dtsi
> +++ b/arch/arm/boot/dts/bcm11351.dtsi
> @@ -47,4 +47,12 @@
>                     cache-unified;
>                     cache-level = <2>;
>         };
> +
> +       timer@35006000 {
> +               compatible = "bcm,kona-timer";
> +               reg = <0x35006000 0x1000>;
> +               interrupts = <0x0 7 0x4>;
> +               clock-frequency = <32768>;
> +       };
> +
>  };
> --
> 1.7.10.4
>
>
Hi Grant,
 In discussion with Olof @ Connect, he suggested that it would be best
to send dt changes as a standalone patch to devicetree-discuss list to
get it applied on its own. Can you pls apply this patch ?

 Thanks,
   csd
