From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH v2 0/3] arm64: ti: k3-am654: USB support
Date: Fri, 15 Feb 2019 10:48:08 +0200
Message-ID: <d67c23b7-bd1c-c7ae-e878-9437d41e26ff@ti.com>
References: <1549370722-414-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1549370722-414-1-git-send-email-rogerq@ti.com>
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
To: Roger Quadros <rogerq@ti.com>
Cc: nm@ti.com, devicetree@vger.kernel.org, vigneshr@ti.com, nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/02/2019 14:45, Roger Quadros wrote:
> Hi,
> 
> The AM654 SoC supports 2 DWC3 USB controller instances. The
> AM654 base board supports the 2nd (USB1) instance in high-speed.
> 
> This series enables support for USB1 instance on the AM654-base-board.
> 
> The series depends on [1] and [2]. Both are in the -next branch of their
> respective maintainer trees.
> 
> To test you can apply on top of linux-next. As usb/next was just pushed
> today, it might have not reached linux-next yet. If so please pull that from [3].
> 
> If using arm64 defconfig, you need to enable
> 	CONFIG_USB_DWC3_KEYSTONE=y
> 	CONFIG_OMAP_USB2=y
> and the necessary USB drivers that you want to test. e.g. USB network adapter.
> 
> [1] AM654 USB2 PHY support https://lkml.org/lkml/2018/12/5/908
> [2] AM654 DWC3 support https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1896101.html
> [3] usb-next https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/log/?h=next
> 
> Changelog:
> v2
> - usb & phy nodes are not kept disabled in k3-am65-main.dtsi.
>    Unused ones are disabled in board dts instead.

Series queued for 5.1, thanks.

-Tero

> 
> cheers,
> -roger
> 
> 
> Jyri Sarha (1):
>    arm64: dts: ti: am654: Add Main System Control Module node
> 
> Roger Quadros (2):
>    arm64: dts: ti: k3-am6: add USB support
>    arm64: dts: ti: k3-am654-base-board: enable USB1
> 
>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi       | 84 ++++++++++++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 28 +++++++++
>   2 files changed, 112 insertions(+)
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
