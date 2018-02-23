From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/7] R-Car M3-N DTS fixes
Date: Fri, 23 Feb 2018 15:51:56 +0100
Message-ID: <20180223145155.skbg6g3c5ic6yfg6@verge.net.au>
References: <1519393259-26108-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1519393259-26108-1-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de, magnus.damm@gmail.com, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 23, 2018 at 02:40:52PM +0100, Jacopo Mondi wrote:
> Hello,
>    in this second iteration I have fixed two remarks from Geert received on
> v1:
> - Extend "du" address length to include third channel
> - Move usb2_phy1 device node next to usb2_phy0
> 
> Two minor nits were not addressed:
> - "placeholder" comment position not changed to maintain consistency with
>   placeholders in M3-W. When they'll get changed, let's change all of them at
>   the same time.
> - The addresses block sizes (and multiple address range blocks) are still there
>   (next time we can consider dropping the unit address from place-holder nodes
>   and do not add any "reg" property at all, until DTC won't start complaining
>   about this as well)
> 
> All patches but the newly introduced 7/7 now have Geert's Reviewed-by tag.
> 
> Simon: as per v1, this series is based on my M3-N enablement series, last
> patch on Ether-AVB excluded.
> 
> Thanks
>    j
> 
> v1 -> v2:
> - Extend "du" address length to include third channel
> - Move usb2_phy1 node next to usb2_phy0
> 
> Jacopo Mondi (7):
>   arm64: dts: renesas: r8a77965: Add "reg" properties
>   arm64: dts: renesas: r8a77965: Add #address-cells and #size-cells
>   arm64: dts: renesas: r8a77965: Remove stale reg property
>   arm64: dts: renesas: r8a77965: Add #phy-cells property
>   arm64: dts: renesas: r8a77965: Add #pwm-cells property
>   arm64: dts: renesas: r8a77965: Add #interrupt-cells property
>   arm64: dts: renesas: r8a77965: Move usb2_phy1 up
> 
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 89 +++++++++++++++++++++++++++++--

Thanks, applied.
