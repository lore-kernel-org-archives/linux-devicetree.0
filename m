From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCHv3 RESEND 1/8] ARM: dts: stm32: set HSE_RTC clock frequency
 to 1 MHz on stm32f429
Date: Mon, 16 Jan 2017 15:39:22 +0100
Message-ID: <52199299-524a-631a-d076-080c03433674@st.com>
References: <1484573388-590-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484573388-590-1-git-send-email-amelie.delaunay@st.com>
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

Hi Am=E9lie,

On 01/16/2017 02:29 PM, Amelie Delaunay wrote:
> This patch set HSE_RTC clock frequency to 1 MHz, as the clock supplied to
> the RTC must be 1 MHz.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  arch/arm/boot/dts/stm32f429.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f4=
29.dtsi
> index e9324a3..557c1f4 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -433,6 +433,8 @@
>  			reg =3D <0x40023800 0x400>;
>  			clocks =3D <&clk_hse>, <&clk_i2s_ckin>;
>  			st,syscfg =3D <&pwrcfg>;
> +			assigned-clocks =3D <&rcc 1 CLK_HSE_RTC>;
> +			assigned-clock-rates =3D <1000000>;
>  		};
>
>  		dma1: dma-controller@40026000 {
>

Applied on stm32-dt-for-v4.11

Thanks
Alex
