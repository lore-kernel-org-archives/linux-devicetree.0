From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: bcm283x: Correct mailbox register sizes
Date: Fri, 14 Sep 2018 10:01:12 -0700
Message-ID: <f1322c43-061d-ca04-a0e8-cd4fe02ea1ac@gmail.com>
References: <1536931375-48769-1-git-send-email-phil@raspberrypi.org>
 <1536931375-48769-5-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1536931375-48769-5-git-send-email-phil@raspberrypi.org>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Phil Elwell <phil@raspberrypi.org>, Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

On 09/14/2018 06:22 AM, Phil Elwell wrote:
> The size field in a Device Tree "reg" property is encoded in bytes, not
> words.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>

This should probably have a:

Fixes: 614fa22119d6 ("ARM: dts: bcm2835: Add VCHIQ node to the Raspberry
Pi boards. (v3)")

as well?

> ---
>  arch/arm/boot/dts/bcm2835-rpi.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> index 215d8cc..29f970f 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
> +++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> @@ -32,7 +32,7 @@
>  
>  		vchiq: mailbox@7e00b840 {
>  			compatible = "brcm,bcm2835-vchiq";
> -			reg = <0x7e00b840 0xf>;
> +			reg = <0x7e00b840 0x3c>;
>  			interrupts = <0 2>;
>  		};
>  	};
> 


-- 
Florian
