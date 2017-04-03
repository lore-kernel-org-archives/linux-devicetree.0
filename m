From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v5 0/5] usb: dwc2: Add support for USB OTG on STM32F4x9
Date: Mon, 3 Apr 2017 16:55:43 +0200
Message-ID: <8bdaca46-c9d0-c9b8-be38-e0d89ea8dc35@st.com>
References: <20170201012547.76158-1-bruherrera@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170201012547.76158-1-bruherrera@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bruno Herrera <bruherrera@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, johnyoun@synopsys.com, felipe.balbi@linux.intel.com
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi

On 02/01/2017 02:25 AM, Bruno Herrera wrote:
> The STM32F4x9 MCU family has two DWC2 USB OTG cores on it. One core is
> USB OTG FS and other core is USB OTG HS. The USB FS core only works with
> its internal phy whilst the USF HS core can work in HS with external ulpi
> phy or in FS/LS speed with the embedded FS PHY.
>
...
>
>  Documentation/devicetree/bindings/usb/dwc2.txt |  4 ++++
>  arch/arm/boot/dts/stm32f429-disco.dts          | 16 +++++++++++++
>  arch/arm/boot/dts/stm32f429.dtsi               | 31 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/stm32f469-disco.dts          | 16 +++++++++++++
>  drivers/usb/dwc2/core.h                        |  5 +++++
>  drivers/usb/dwc2/hcd.c                         | 15 ++++++++++++-
>  drivers/usb/dwc2/hw.h                          |  2 ++
>  drivers/usb/dwc2/params.c                      | 19 ++++++++++++++++
>  8 files changed, 107 insertions(+), 1 deletion(-)
>

Patches 2, 3, 4 & 5 (DT + bindings) applied on stm32-dt-for-v4.12

regards
Alex
