From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v4] ARM: SPEAr600: Add device-tree support to SPEAr600
 boards
Date: Fri, 16 Mar 2012 15:21:53 +0530
Message-ID: <4F630D39.2090905@st.com>
References: <1331890216-8361-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1331890216-8361-1-git-send-email-sr-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3/16/2012 3:00 PM, Stefan Roese wrote:
> This patch adds a generic target for SPEAr600 board that can be
> configured via the device-tree. Currently the following devices
> are supported via the devicetree:
> 
> - VIC interrupts
> - PL011 UART
> - PL061 GPIO
> - Synopsys DW I2C
> - Synopsys DW ethernet
> 
> Signed-off-by: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
> Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>

Acked-by: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>

I have one query (as part of my learning of DT) to all DT experts:

> 
> +                       /* local/cpu GPIO */
> +                       gpio0: gpio@f0100000 {
> +                               #gpio-cells = <2>;
> +                               compatible = "arm,pl061", "arm,primecell";
> +                               gpio-controller;
> +                               reg = <0xf0100000 0x1000>;
> +                               interrupt-parent = <&vic0>;
> +                               interrupts = <18>;
> +                       };
> +
> 

Can we add name property here:
				name = "gpio0"

So that we don't need to do below stuff.

> diff --git a/arch/arm/mach-spear6xx/clock.c b/arch/arm/mach-spear6xx/clock.c
> @@ -641,8 +641,8 @@ static struct clk_lookup spear_clk_lookups[] = {
> -       { .dev_id = "gpio0",            .clk = &gpio0_clk},
> -       { .dev_id = "gpio1",            .clk = &gpio1_clk},
> -       { .dev_id = "gpio2",            .clk = &gpio2_clk},
> +       { .dev_id = "f0100000.gpio",    .clk = &gpio0_clk},
> +       { .dev_id = "fc980000.gpio",    .clk = &gpio1_clk},

I can't find much dts files using this approach. Even i don't know
if setting name will be sufficient?

-- 
viresh
