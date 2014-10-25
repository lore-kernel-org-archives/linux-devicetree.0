From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCHv0] arm: mvebu: enable rear eSATA ports of NETGEAR
 ReadyNAS 2120
Date: Sat, 25 Oct 2014 20:02:14 +0200
Message-ID: <20141025180214.GB13191@lunn.ch>
References: <f3876c7a9ef11eb758b9df18c671ee740b8be614.1414250947.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <f3876c7a9ef11eb758b9df18c671ee740b8be614.1414250947.git.arno@natisbad.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 25, 2014 at 05:32:42PM +0200, Arnaud Ebalard wrote:
> 
> NETGEAR ReadyNAS 2120 supports its four main SATA disks via 2
> Marvell 88SE9170 SATA controllers connected on the PCIe bus
> of the the SoC. The two eSATA ports available at the rear of
> the device are handled by the native SATA controller of the
> Armada XP SoC powering the NAS. This patch enables the SoC
> SATA controller in the .dts file to make those two rear ports
> available.
> 
> Signed-off-by: Arnaud Ebalard <arno@natisbad.org>

Acked-by: Andrew Lunn <andrew@lunn.ch>

> ---
>  arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
> index 7d8f32873e82..e3a8c456bb84 100644
> --- a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
> +++ b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
> @@ -137,6 +137,12 @@
>  				};
>  			};
>  
> +			/* Two rear eSATA ports */
> +			sata@a0000 {
> +				nr-ports = <2>;
> +				status = "okay";
> +			};
> +
>  			serial@12000 {
>  				status = "okay";
>  			};
> -- 
> 2.1.1
> 
