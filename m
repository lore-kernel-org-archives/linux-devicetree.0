From: Anton Vorontsov <anton@enomsg.org>
Subject: Re: [PATCH 2/2] power: arm64: Add DTS entry for APM X-Gene reboot
 driver.
Date: Fri, 9 Aug 2013 14:31:17 -0700
Message-ID: <20130809213116.GE12638@lizard.sbx05730.santaca.wayport.net>
References: <1372797539-13111-1-git-send-email-lho@apm.com>
 <1372797539-13111-2-git-send-email-lho@apm.com>
 <1372797539-13111-3-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1372797539-13111-3-git-send-email-lho@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Loc Ho <lho@apm.com>
Cc: fkan@apm.com, Catalin.Marinas@arm.com, devicetree-discuss@lists.ozlabs.org, ksankaran@apm.com, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 02, 2013 at 02:38:59PM -0600, Loc Ho wrote:
> power: arm64: Add DTS entry for APM X-Gene reboot driver.
> 
> Signed-off-by: Loc Ho <lho@apm.com>
> Signed-off-by: Feng Kan <fkan@apm.com>
> Signed-off-by: Kumar Sankaran <ksankaran@apm.com>
> ---

I've applied patch 1/2 to battery-2.6.git tree. I need an ack from ARM
maintainers to grab this together with the first one.

>  arch/arm64/boot/dts/apm-storm.dtsi |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
> index d37d736..e686919 100644
> --- a/arch/arm64/boot/dts/apm-storm.dtsi
> +++ b/arch/arm64/boot/dts/apm-storm.dtsi
> @@ -178,6 +178,12 @@
>  			};
>  		};
>  
> +                reboot@0x17000014 {
> +                        compatible = "apm,xgene-reboot";
> +                        reg = <0x0 0x17000014 0x0 0x100>;
> +                        mask = <0x1>;
> +                };

There should be tabs instead of whitespaces.

> +
>  		serial0: serial@1c020000 {
>  			device_type = "serial";
>  			compatible = "ns16550";
> -- 
> 1.5.5
