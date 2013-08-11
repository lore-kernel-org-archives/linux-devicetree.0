From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 1/2] ARM: dts: Change dw-apb-timer-osc and
 dw-apb-timer-sp to just dw-apb-timer
Date: Sun, 11 Aug 2013 14:45:09 -0700
Message-ID: <20130811214509.GA26757@quad.lixom.net>
References: <1374723797-22169-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1374723797-22169-1-git-send-email-dinguyen@altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dinguyen@altera.com
Cc: dinh.linux@gmail.com, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@denx.de>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, John Stultz <john.stultz@linaro.org>, Grant Likely <grant.likely@linaro.org>, Jamie Iles <jamie@jamieiles.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2013 at 10:43:16PM -0500, dinguyen@altera.com wrote:
> From: Dinh Nguyen <dinguyen@altera.com>
> 
> "dw-apb-timer-osc" and "dw-apb-timer-sp" are the same implementation of the
> DW APB timer, just fed by different clocks.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
> CC: Rob Herring <rob.herring@calxeda.com>
> Cc: Grant Likely <grant.likely@linaro.org>
> CC: Arnd Bergmann <arnd@arndb.de>
> Cc: Olof Johansson <olof@lixom.net>
> CC: Jamie Iles <jamie@jamieiles.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Pavel Machek <pavel@denx.de>
> Cc: devicetree-discuss@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/rtc/dw-apb.txt |   21 +++----------------
>  arch/arm/boot/dts/rk3066a.dtsi                   |    6 +++---
>  arch/arm/boot/dts/socfpga.dtsi                   |   24 +++++++++++-----------
>  arch/arm/boot/dts/socfpga_cyclone5.dts           |    8 ++++----
>  arch/arm/boot/dts/socfpga_vt.dts                 |    8 ++++----
>  5 files changed, 26 insertions(+), 41 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/dw-apb.txt b/Documentation/devicetree/bindings/rtc/dw-apb.txt
> index eb2327b..0a1020e 100644
> --- a/Documentation/devicetree/bindings/rtc/dw-apb.txt
> +++ b/Documentation/devicetree/bindings/rtc/dw-apb.txt
> @@ -1,7 +1,7 @@
>  * Designware APB timer
>  
>  Required properties:
> -- compatible: "snps,dw-apb-timer-sp" or "snps,dw-apb-timer-osc"
> +- compatible: "snps,dw-apb-timer"
>  - reg: physical base address of the controller and length of memory mapped
>    region.
>  - interrupts: IRQ line for the timer.

Here's a classic example of where we will eventually need to keep the ABI. You
can add a comment that the preferred compatible value is the new one, but the
old ones still need to be handled by the drivers, and shouldn't be removed.

That is, of course, if people are happy with the current binding and want to
keep it instead of revising it before declaring it locked in.


-Olof
