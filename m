From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Add support for Atmel's AT91SAM9N12-EK (With DT)
Date: Mon, 16 Apr 2012 18:09:46 +0200
Message-ID: <4F8C444A.8030705@atmel.com>
References: <1334569167-7064-1-git-send-email-hong.xu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334569167-7064-1-git-send-email-hong.xu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Hong Xu <hong.xu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/16/2012 11:39 AM, Hong Xu :
> This series adds support for Atmel's AT91SAM9N12-EK.
> 
> Patches are on top of v3.4-rc2 and target for v3.5

Comments on the v2 following ;-)

> 
> Hong Xu (3):
>   AT91: Add DT description files for AT91SAM9N12-EK
>   AT91: Add machine header file for AT91SAM9N12 SoC
>   AT91: Add machine files for AT91SAM9N12 SoC
> 
>  arch/arm/boot/dts/at91sam9n12.dtsi                 |  223 ++++++++++++++++
>  arch/arm/boot/dts/at91sam9n12ek.dts                |   99 +++++++
>  arch/arm/mach-at91/Kconfig                         |    9 +
>  arch/arm/mach-at91/Makefile                        |    1 +
>  arch/arm/mach-at91/Makefile.boot                   |    2 +
>  arch/arm/mach-at91/at91sam9n12.c                   |  275 ++++++++++++++++++++
>  arch/arm/mach-at91/clock.c                         |   15 +-
>  arch/arm/mach-at91/include/mach/at91sam9n12.h      |   60 +++++
>  .../mach-at91/include/mach/at91sam9n12_matrix.h    |   53 ++++
>  arch/arm/mach-at91/include/mach/cpu.h              |   10 +
>  arch/arm/mach-at91/include/mach/hardware.h         |    2 +
>  arch/arm/mach-at91/setup.c                         |    6 +
>  arch/arm/mach-at91/soc.h                           |    5 +
>  13 files changed, 755 insertions(+), 5 deletions(-)
>  create mode 100644 arch/arm/boot/dts/at91sam9n12.dtsi
>  create mode 100644 arch/arm/boot/dts/at91sam9n12ek.dts
>  create mode 100644 arch/arm/mach-at91/at91sam9n12.c
>  create mode 100644 arch/arm/mach-at91/include/mach/at91sam9n12.h
>  create mode 100644 arch/arm/mach-at91/include/mach/at91sam9n12_matrix.h
> 


-- 
Nicolas Ferre
