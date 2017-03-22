From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 4/5] ARM: dts: stm32ap: Add watchdog support for
 STM32F429 eval board
Date: Wed, 22 Mar 2017 14:51:12 +0100
Message-ID: <877e3dbb-780c-1ece-04e1-594e8f783a5e@st.com>
References: <1490189786-19232-1-git-send-email-yannick.fertre@st.com>
 <1490189786-19232-5-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490189786-19232-5-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yannick Fertre <yannick.fertre@st.com>, Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, linux-kernel@vger.kernel.org, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi

On 03/22/2017 02:36 PM, Yannick Fertre wrote:
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---

Please add a commit message and change commit header as following:

ARM: dts: stm32: .....


>  arch/arm/boot/dts/stm32429i-eval.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
> index 3c99466..aab81ed 100644
> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> @@ -181,3 +181,7 @@
>  	pinctrl-names = "default";
>  	status = "okay";
>  };
> +
> +&iwdg {
> +	status = "okay";
> +};
>
