From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC v3 08/14] MIPS: dts: qca: introduce AR9331 devicetree
Date: Mon, 25 Jan 2016 23:46:30 +0100
Message-ID: <20160125234630.16098b7f@tock>
References: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
	<1453580251-2341-9-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453580251-2341-9-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Aban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 23 Jan 2016 23:17:25 +0300
Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> This patch introduces devicetree for Atheros AR9331 SoC (AKA Hornet).
> The AR9331 chip is a Wi-Fi System-On-Chip (WiSOC),
> typically used in very cheap Access Points and Routers.
> 
> Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/mips/boot/dts/qca/ar9331.dtsi | 123 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dts/qca/ar9331.dtsi
> new file mode 100644
> index 0000000..bf128a2
> --- /dev/null
> +++ b/arch/mips/boot/dts/qca/ar9331.dtsi
> @@ -0,0 +1,123 @@
> +#include <dt-bindings/clock/ath79-clk.h>
> +
> +/ {
> +	compatible = "qca,ar9331";
> +

[...]

> +
> +	extosc: oscillator {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +	};

This oscillator is on the board and not in the SoC, so it should
be in the board DTS.

Alban
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
