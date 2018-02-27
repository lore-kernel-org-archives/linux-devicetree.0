From: Jon Mason <jon.mason@broadcom.com>
Subject: Re: [PATCH] ARM: dts: NSP: Fix amount of RAM on BCM958625HR
Date: Tue, 27 Feb 2018 10:02:56 -0500
Message-ID: <CAC3K-4rqYMUBtbwaojWBF-0biEV-WSPpe=0bDocL4TUrrL4gGQ@mail.gmail.com>
References: <20180227010312.7495-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180227010312.7495-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 8:03 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> Jon attempted to fix the amount of RAM on the BCM958625HR in commit
> c53beb47f621 ("ARM: dts: NSP: Correct RAM amount for BCM958625HR board")
> but it seems like we tripped over some poorly documented schematics.
>
> The top-level page of the schematics says the board has 2GB, but when
> you end-up scrolling to page 6, you see two chips of 4GiB (512MB) but
> what the bootloader really initializes only 512MB, any attempt to use
> more than that results in data aborts. Fix this again back to 512MB.
>
> Fixes: c53beb47f621 ("ARM: dts: NSP: Correct RAM amount for BCM958625HR board")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Jon Mason <jon.mason@broadcom.com>

> ---
>  arch/arm/boot/dts/bcm958625hr.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/bcm958625hr.dts b/arch/arm/boot/dts/bcm958625hr.dts
> index 6a44b8021702..f0e2008f7490 100644
> --- a/arch/arm/boot/dts/bcm958625hr.dts
> +++ b/arch/arm/boot/dts/bcm958625hr.dts
> @@ -49,7 +49,7 @@
>
>         memory {
>                 device_type = "memory";
> -               reg = <0x60000000 0x80000000>;
> +               reg = <0x60000000 0x20000000>;
>         };
>
>         gpio-restart {
> --
> 2.14.1
>
