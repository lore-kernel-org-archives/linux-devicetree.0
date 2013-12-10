From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH 2/2] arm: keystone: enable watchdog support
Date: Tue, 10 Dec 2013 16:53:53 +0200
Message-ID: <52A72B01.9090305@ti.com>
References: <1386686869-729-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1386686869-729-2-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386686869-729-2-git-send-email-ivan.khoronzhuk@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

+ CC
devicetree@vger.kernel.org
linux-arm-kernel@lists.infradead.org
linux-kernel@vger.kernel.org

On 12/10/2013 04:47 PM, Ivan Khoronzhuk wrote:
> After Keystone watchdog driver updates are already merged we can
> enable WDT in config.
>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
> Based on
> git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
> keystone/master
>
>   arch/arm/configs/keystone_defconfig |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
> index 9943e5d..8bd940c 100644
> --- a/arch/arm/configs/keystone_defconfig
> +++ b/arch/arm/configs/keystone_defconfig
> @@ -129,6 +129,8 @@ CONFIG_SPI_DAVINCI=y
>   CONFIG_SPI_SPIDEV=y
>   # CONFIG_HWMON is not set
>   CONFIG_WATCHDOG=y
> +CONFIG_WATCHDOG_CORE=y
> +CONFIG_DAVINCI_WATCHDOG=y
>   # CONFIG_USB_SUPPORT is not set
>   CONFIG_DMADEVICES=y
>   CONFIG_COMMON_CLK_DEBUG=y
>


-- 
Regards,
Ivan Khoronzhuk
