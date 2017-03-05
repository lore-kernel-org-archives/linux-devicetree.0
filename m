From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] ARM: at91/dt: Disable SPI on at91sam9x5ek to allow MCI1
 to work.
Date: Sun, 5 Mar 2017 23:55:42 +0100
Message-ID: <20170305225542.dptirws7djsrrlas@piout.net>
References: <1487265388-29390-1-git-send-email-cristian.birsan@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1487265388-29390-1-git-send-email-cristian.birsan@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: cristian.birsan@microchip.com
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com, devicetree@vger.kernel.org, nicolas.ferre@atmel.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, cyrille.pitchen@atmel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The proper commit prefix was "ARM: dts: at91:"

On 16/02/2017 at 19:16:28 +0200, cristian.birsan@microchip.com wrote:
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> The A13 hardware line is shared by SPI and MCI1 controller.This patch
> disables the SPI controller so that the MCI1 (the big MMC card slot) can
> be used.
> 
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
> ---
>  arch/arm/boot/dts/at91sam9x5ek.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
