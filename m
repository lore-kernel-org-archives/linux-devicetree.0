From: Patrick Venture <venture@google.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: quanta-q7l1: Add four PSUs
Date: Fri, 31 Aug 2018 13:54:05 -0700
Message-ID: <CAO=notzJMPnN=uZLxrN4BPfCwUhQZoQk0msGS6qOApqjv=5kgQ@mail.gmail.com>
References: <20180822171238.227972-1-venture@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180822171238.227972-1-venture@google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 22, 2018 at 10:12 AM Patrick Venture <venture@google.com> wrote:
>
> Enable the four PSUs via generic PMBUS.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index 586050e1c0e6..c655564e6c6d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -318,24 +318,44 @@
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <0>;
> +
> +                       psu@59 {
> +                               compatible = "pmbus";
> +                               reg = <0x59>;
> +                       };
>                 };
>
>                 i2c_psu1: i2c@1 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <1>;
> +
> +                       psu@58 {
> +                               compatible = "pmbus";
> +                               reg = <0x58>;
> +                       };
>                 };
>
>                 i2c_psu3: i2c@2 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <2>;
> +
> +                       psu@58 {
> +                               compatible = "pmbus";
> +                               reg = <0x58>;
> +                       };
>                 };
>
>                 i2c_psu2: i2c@3 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <3>;
> +
> +                       psu@59 {
> +                               compatible = "pmbus";
> +                               reg = <0x59>;
> +                       };
>                 };
>         };
>
> --
> 2.18.0.1017.ga543ac7ca45-goog
>

Just noticed I typo'd q7l1 and q71l.  I'll send this patch as a new
version with the correction.
