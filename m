From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCHv3 RESEND 6/8] ARM: dts: stm32: enable RTC on
 stm32f469-disco
Date: Mon, 16 Jan 2017 15:39:54 +0100
Message-ID: <1371d57f-86e6-a6af-d936-1b3b1be8770f@st.com>
References: <1484573388-590-1-git-send-email-amelie.delaunay@st.com>
 <1484573388-590-4-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484573388-590-4-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 01/16/2017 02:29 PM, Amelie Delaunay wrote:
> This patch enables RTC on stm32f469-disco with default LSE clock source.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
> index fda12a4..f52b9f6 100644
> --- a/arch/arm/boot/dts/stm32f469-disco.dts
> +++ b/arch/arm/boot/dts/stm32f469-disco.dts
> @@ -78,6 +78,10 @@
>  	clock-frequency = <8000000>;
>  };
>
> +&rtc {
> +	status = "okay";
> +};
> +
>  &usart3 {
>  	pinctrl-0 = <&usart3_pins_a>;
>  	pinctrl-names = "default";
>
Applied on stm32-dt-for-v4.11

Thanks
Alex
