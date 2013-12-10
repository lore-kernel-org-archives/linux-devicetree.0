From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH 1/2] arm: dts: keystone: add watchdog entry
Date: Tue, 10 Dec 2013 16:52:35 +0200
Message-ID: <52A72AB3.5000900@ti.com>
References: <1386686869-729-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386686869-729-1-git-send-email-ivan.khoronzhuk@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

+ CC
devicetree@vger.kernel.org
linux-arm-kernel@lists.infradead.org
linux-kernel@vger.kernel.org

On 12/10/2013 04:47 PM, Ivan Khoronzhuk wrote:
> Add watchdog entry to keystone device tree.
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
> Based on
> git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
> keystone/master
>
>   arch/arm/boot/dts/keystone.dtsi |    6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
> index f6d6d9e..54a8ff7 100644
> --- a/arch/arm/boot/dts/keystone.dtsi
> +++ b/arch/arm/boot/dts/keystone.dtsi
> @@ -181,5 +181,11 @@
>   			interrupts = <GIC_SPI 300 IRQ_TYPE_EDGE_RISING>;
>   			clocks = <&clkspi>;
>   		};
> +
> +		wdt: wdt@022f0080 {
> +			compatible = "ti,keystone-wdt","ti,davinci-wdt";
> +			reg = <0x022f0080 0x80>;
> +			clocks = <&clkwdtimer0>;
> +		};
>   	};
>   };
>


-- 
Regards,
Ivan Khoronzhuk
