From: "Franklin Cooper Jr." <fcooper@ti.com>
Subject: Re: [PATCH 0/5] ARM:Keystone: Add pinmuxing support
Date: Fri, 3 Jun 2016 13:42:19 -0500
Message-ID: <5cc270d6-aec9-a1a8-597b-37c8413496a9@ti.com>
References: <1461766308-27669-1-git-send-email-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461766308-27669-1-git-send-email-fcooper@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, linux@arm.linux.org.uk, ssantosh@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Gentle ping on this series

On 04/27/2016 09:11 AM, Franklin S Cooper Jr wrote:
> Unlike most Keystone 2 devices, K2G supports pinmuxing of its pins. This
> patch series enables pinmuxing for Keystone 2 devices.
>
> Franklin S Cooper Jr (1):
>   ARM: keystone: defconfig: Enable PINCTRL SINGLE for Keystone 2
>
> Lokesh Vutla (3):
>   ARM: Keystone: Enable PINCTRL for Keystone ARCH
>   ARM: dts: keystone: Header file for pinctrl constants
>   ARM: dts: k2g-evm: Add pinmuxing for UART0
>
> Vitaly Andrianov (1):
>   ARM: dts: k2g: Add pinctrl support
>
>  arch/arm/boot/dts/keystone-k2g-evm.dts | 11 ++++++++++
>  arch/arm/boot/dts/keystone-k2g.dtsi    |  8 +++++++
>  arch/arm/configs/keystone_defconfig    |  1 +
>  arch/arm/mach-keystone/Kconfig         |  1 +
>  include/dt-bindings/pinctrl/keystone.h | 39 ++++++++++++++++++++++++++++++++++
>  5 files changed, 60 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/keystone.h
>
