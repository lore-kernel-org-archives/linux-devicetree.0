From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v3 5/5] ARM: configs: Add watchdog support in STM32
 defconfig
Date: Thu, 23 Mar 2017 18:28:27 +0100
Message-ID: <59b86243-9454-1570-9d3d-28c258b7da01@st.com>
References: <1490195083-25117-1-git-send-email-yannick.fertre@st.com>
 <1490195083-25117-6-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490195083-25117-6-git-send-email-yannick.fertre@st.com>
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

Hi,

On 03/22/2017 04:04 PM, Yannick Fertre wrote:
> This patch adds STM32 watchdog support in stm32_defconfig file
>
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---

Update commit header please (ARM: configs: stm32: Add watchdog support)

>  arch/arm/configs/stm32_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
> index a9d8e3c..83afa73 100644
> --- a/arch/arm/configs/stm32_defconfig
> +++ b/arch/arm/configs/stm32_defconfig
> @@ -48,6 +48,7 @@ CONFIG_SERIAL_STM32=y
>  CONFIG_SERIAL_STM32_CONSOLE=y
>  # CONFIG_HW_RANDOM is not set
>  # CONFIG_HWMON is not set
> +CONFIG_WATCHDOG=y
>  CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  # CONFIG_USB_SUPPORT is not set
>
