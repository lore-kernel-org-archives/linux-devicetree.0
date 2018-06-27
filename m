From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH V5 0/5] add iwdg2 support for stm32mp157c
Date: Wed, 27 Jun 2018 09:03:31 +0200
Message-ID: <c6996e7f-2b30-6eaf-afa3-5a98b6dcaa78@st.com>
References: <1529941383-8653-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1529941383-8653-1-git-send-email-ludovic.Barre@st.com>
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
To: Ludovic Barre <ludovic.Barre@st.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Guenter

On 06/25/2018 05:42 PM, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch series updates stm32_iwdg driver to manage pclk
> clock by compatible. stm32mp1 requires a pclk clock.
> 
> v5:
> -update stm32f429.dtsi
> 
> v4:
> -dt-bindings: split and review
> 
> v3:
> -remove stm32_iwdg_config structure, just assign the
>   boolean directly to .dat
> 
> Ludovic Barre (5):
>    dt-bindings: watchdog: add stm32mp1 support
>    watchdog: stm32: add pclk feature for stm32mp1
>    ARM: dts: stm32: add iwdg2 support for stm32mp157c
>    ARM: dts: stm32: add iwdg2 support for stm32mp157c-ed1
>    ARM: dts: stm32: update iwdg with lsi clock name for stm32f429

I will take DT patches in my tree.

Thanks
alex

> 
>   .../devicetree/bindings/watchdog/st,stm32-iwdg.txt |  13 ++-
>   arch/arm/boot/dts/stm32f429.dtsi                   |   1 +
>   arch/arm/boot/dts/stm32mp157c-ed1.dts              |   5 +
>   arch/arm/boot/dts/stm32mp157c.dtsi                 |   8 ++
>   drivers/watchdog/stm32_iwdg.c                      | 116 +++++++++++++--------
>   5 files changed, 98 insertions(+), 45 deletions(-)
> 
