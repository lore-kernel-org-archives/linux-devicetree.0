From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 7/7] ARM: configs: Add STM32 LTDC support in STM32
 defconfig
Date: Mon, 16 Jan 2017 17:03:24 +0100
Message-ID: <d822b50d-acfb-bde4-4df7-9f4ff7579e3f@st.com>
References: <1484573344-11609-1-git-send-email-yannick.fertre@st.com>
 <1484573344-11609-8-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484573344-11609-8-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yannick Fertre <yannick.fertre@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi

On 01/16/2017 02:29 PM, Yannick Fertre wrote:
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---

commit header "ARM: configs: stm32: ADD LDTC support"

>  arch/arm/configs/stm32_defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
> index 29068f5..e3974d9 100644
> --- a/arch/arm/configs/stm32_defconfig
> +++ b/arch/arm/configs/stm32_defconfig
> @@ -71,3 +71,8 @@ CONFIG_MAGIC_SYSRQ=y
>  # CONFIG_FTRACE is not set
>  CONFIG_CRC_ITU_T=y
>  CONFIG_CRC7=y
> +CONFIG_DRM=y
> +CONFIG_DRM_ST=y
> +CONFIG_DRM_PANEL=y
> +CONFIG_DRM_PANEL_SIMPLE=y
> +CONFIG_BACKLIGHT_LCD_SUPPORT=y
>
