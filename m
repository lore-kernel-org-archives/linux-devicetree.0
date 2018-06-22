From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v4] MAINTAINERS: Add file patterns for auxdisplay device
 tree bindings
Date: Fri, 22 Jun 2018 12:50:22 +0200
Message-ID: <CANiq72mjuCKj+6Rw-2Rsrk1bwcpNfKZ7LwdeRnkk198LsjHz1Q@mail.gmail.com>
References: <20180622100733.29051-1-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180622100733.29051-1-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 22, 2018 at 12:07 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Thanks,
Miguel

> ---
> v3:
>   - Update for next-20180622,
>
> v2:
>   - New.
>
> Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/auxdisplay/":
>
> -Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:1/1=100%)
> +Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com> (maintainer:AUXILIARY DISPLAY DRIVERS)
> +Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>  Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> -Andy Shevchenko <andriy.shevchenko@linux.intel.com> (commit_signer:1/1=100%,authored:1/1=100%)
>  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>  linux-kernel@vger.kernel.org (open list)
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3d393dc22eaa3ece..e5db502df5afdd8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2544,6 +2544,7 @@ F:        kernel/audit*
>  AUXILIARY DISPLAY DRIVERS
>  M:     Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
>  S:     Maintained
> +F:     Documentation/devicetree/bindings/auxdisplay/
>  F:     drivers/auxdisplay/
>  F:     include/linux/cfag12864b.h
>
> --
> 2.17.1
>
