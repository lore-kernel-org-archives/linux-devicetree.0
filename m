From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v7 0/9] STM32 LCD-TFT display controller
Date: Mon, 12 Jun 2017 14:00:27 +0200
Message-ID: <2abef21d-5ce8-3bd2-7918-4fefcf2a5858@st.com>
References: <1492164819-10513-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1492164819-10513-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yannick Fertre <yannick.fertre@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Yannick

On 04/14/2017 12:13 PM, Yannick Fertre wrote:
...
> 
> The purpose of this set of patches is to add a new driver for stm32f429.
> This driver was developed and tested on evaluation board stm32429i.
> 
> Stm32f4 is a MCU platform which don't have MMU so the last patches developed
> by Benjamin Gaignard regarding "DRM: allow to use mmuless devices"
> are necessary.
> 
> The board stm429i embeds a Ampire AM-480272H3TMQW-T01H screen.
> A new simple panel am-480272h3tmqw-t01h have been added to support it.
> 
> 
> Yannick Fertre (9):
>    drm/cma: Update DEFINE_DRM_GEM_CMA_FOPS to add get_unmapped_area
>    drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()
>    dt-bindings: display: Add STM32 LTDC driver
>    drm/stm: Add STM32 LTDC driver
>    MAINTAINERS: add maintainers for DRM STM driver
>    ARM: dts: stm32: Add ltdc support on stm32f429 MCU
>    ARM: dts: stm32: Enable ltdc & simple panel on stm32f429-Eval board
>    ARM: configs: stm32: Add DRM support in STM32 defconfig
>    ARM: configs: stm32: Add simple panel support in STM32 defconfig
> 
For STM32 machine part:

Patches 6 & 7 applied on stm32-dt-for-v4.13

Patches 8 & 9 will not be applied:
As SDRAM used on STM32 MCUs is small, I don't want to penalize other users:
  - by increasing static kernel size
  - by enabling devices which consume dynamically lot of memory

User will be free to enable it through menuconfig.

Regards
Alex
