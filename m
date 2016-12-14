From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH linux v1 4/4] arm: dts: Add dt-binding to support seven
 segment display on zaius
Date: Wed, 14 Dec 2016 09:55:47 +0100
Message-ID: <3917905.e4iOqADnVQ@wuerfel>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
 <1481702104-8617-5-git-send-email-jaghu@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1481702104-8617-5-git-send-email-jaghu@google.com>
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
Cc: mark.rutland@arm.com, Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au
List-Id: devicetree@vger.kernel.org

On Tuesday, December 13, 2016 11:55:04 PM CET Jaghathiswari Rankappagounder Natarajan wrote:
> Add clock, data and clear signal GPIO lines to control seven segment display on
> zaius platform.
> 
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 8ef4ece..ccb8147 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -43,6 +43,14 @@
>  			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
>  		};
>  	};
> +
> +	seven-seg-disp {
> +		compatible = "seven-seg-gpio-dev";
> +		refresh-interval-ms = "1000";
> +		clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
> +		data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> +		clear-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
> +	};
>  };


According to your introductory mail, the interface is assumed to be
a 74HC164. Should we use that ID in the compatible string?

We can always add other strings later if we want to support multiple
wire formats.

	Arnd
