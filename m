From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 02/19] OpenRISC: Device tree
Date: Sun, 19 Jun 2011 19:19:27 +0200
Message-ID: <201106191919.27737.arnd@arndb.de>
References: <1308483825-6023-1-git-send-email-jonas@southpole.se>
	<1308483825-6023-3-git-send-email-jonas@southpole.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1308483825-6023-3-git-send-email-jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 19 June 2011 13:43:28 Jonas Bonn wrote:
> 
> The OpenRISC architecture uses the device tree infrastructure for the
> platform description.  This is currently limited to having a device tree
> built into the kernel, but work is underway within the OpenRISC project
> to define how this device tree blob should be passed into the kernel from
> an external resource.
> 
> Signed-off-by: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>

Best take devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org when posting this again.

> ---
>  arch/openrisc/boot/dts/aac.dts    |  290 +++++++++++++++++++++++++++++++++++++
>  arch/openrisc/boot/dts/atlys.dts  |   94 ++++++++++++
>  arch/openrisc/boot/dts/system.dts |   88 +++++++++++
>  arch/openrisc/include/asm/prom.h  |   92 ++++++++++++
>  arch/openrisc/kernel/prom.c       |  109 ++++++++++++++
>  5 files changed, 673 insertions(+), 0 deletions(-)
>  create mode 100644 arch/openrisc/boot/dts/aac.dts
>  create mode 100644 arch/openrisc/boot/dts/atlys.dts
>  create mode 100644 arch/openrisc/boot/dts/system.dts
>  create mode 100644 arch/openrisc/include/asm/prom.h
>  create mode 100644 arch/openrisc/kernel/prom.c
> 
> diff --git a/arch/openrisc/boot/dts/aac.dts b/arch/openrisc/boot/dts/aac.dts
> new file mode 100644
> index 0000000..d9e724f
> --- /dev/null
> +++ b/arch/openrisc/boot/dts/aac.dts
> @@ -0,0 +1,290 @@
> +/dts-v1/;
> +/ {
> +	compatible = "orsoc,development-board";
> +	#size-cells = <1>;
> +	#address-cells = <1>;
> +
> +	chosen {
> +		bootargs = "console=uart,mmio,0x90000000,115200 lpj=200000 debug";
> +/*		bootargs = "console=uart,mmio,0x90000000,115200 lpj=200000 root=/dev/nfs rw nfsroot=172.30.0.1:/home/jonas/local/opencores/linux-2.6/arch/or32/support/rootfs,rw,nolock ip=172.30.0.2::::::"; */
> +	};

I think having a hardcoded command line here is not really helpful, this
should normally be filled by the bootloader. The console settings should
probably be probed from the device tree, we have good existing bindings
for serial ports.

For the lpj value, I would also recommend passing the clock frequency
in the device tree in a generic form, so you can compute the delay
loop settings from it.

	Arnd
