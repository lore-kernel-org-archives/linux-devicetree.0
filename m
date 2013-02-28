From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: davinci: da850 evm: update clock rate for UART 1/2
	DT nodes
Date: Thu, 28 Feb 2013 16:09:47 +0530
Message-ID: <512F33F3.9070203@ti.com>
References: <1361262734-8540-1-git-send-email-prakash.pm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1361262734-8540-1-git-send-email-prakash.pm-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: "Manjunathappa, Prakash" <prakash.pm-l0cyMroinI0@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Prakash,

On 2/19/2013 2:02 PM, Manjunathappa, Prakash wrote:
> DT kernel with latest of denx SPL U-boot boots with garbled UART
> logs. This is because in U-boot UART2 gets sourced by PLL0_SYSCLK2
> configured for 150MHz. But later in kernel UART2 gets mapped to
> PLL1_SYSCLK2 and is configured for 132MHz not for 150MHz.
> 
> PLL1 is configured for 264MHz to support mDDR on the EVM. That is
> memory controller driving mDDR can be configured for 150MHz and
> mDDR it self can operate at 132MHz.
> 
> So override UART1 and UART2 DT node clock-frequency property with
> rate available on da850 EVM.
> 
> Signed-off-by: Manjunathappa, Prakash <prakash.pm-l0cyMroinI0@public.gmane.org>

How about dropping the clock-frequency attribute altogether? of_serial.c
seems to be falling back on clk apis if frequency is not passed and that
should make the kernel work with all versions of U-Boot.

Thanks,
Sekhar

> ---
>  arch/arm/boot/dts/da850-evm.dts |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
> index f712fb6..c359872 100644
> --- a/arch/arm/boot/dts/da850-evm.dts
> +++ b/arch/arm/boot/dts/da850-evm.dts
> @@ -22,9 +22,11 @@
>  			status = "okay";
>  		};
>  		serial1: serial@1d0c000 {
> +			clock-frequency = <132000000>;
>  			status = "okay";
>  		};
>  		serial2: serial@1d0d000 {
> +			clock-frequency = <132000000>;
>  			status = "okay";
>  		};
>  		rtc0: rtc@1c23000 {
> 
