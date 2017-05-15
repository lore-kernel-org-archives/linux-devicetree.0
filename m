From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] fdt: correctly handle uncompressed node names
Date: Mon, 15 May 2017 10:19:36 -0500
Message-ID: <CAL_JsqJLbwuzvDCSHr+Z92sseomnWhKXd03WomUgJdfXo_6=8Q@mail.gmail.com>
References: <20170513102229.22579-1-x-linux@infra-silbe.de> <20170513102229.22579-2-x-linux@infra-silbe.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170513102229.22579-2-x-linux@infra-silbe.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Silbe <x-linux@infra-silbe.de>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 13, 2017 at 5:22 AM, Sascha Silbe <x-linux@infra-silbe.de> wrote:
> When handling uncompressed node names, we need to compare the last
> component rather than the entire string.
>
> Signed-off-by: Sascha Silbe <x-linux@infra-silbe.de>
> ---
>  scripts/dtc/libfdt/fdt_ro.c | 3 +++
>  1 file changed, 3 insertions(+)

This needs to be a patch against dtc, sent to devicetree-compiler list
and accepted there, then I can pick it up.

>
> diff --git a/scripts/dtc/libfdt/fdt_ro.c b/scripts/dtc/libfdt/fdt_ro.c
> index 3d00d2eee0e3..ca03ff87429c 100644
> --- a/scripts/dtc/libfdt/fdt_ro.c
> +++ b/scripts/dtc/libfdt/fdt_ro.c
> @@ -64,6 +64,9 @@ static int _fdt_nodename_eq(const void *fdt, int offset,
>                 /* short match */
>                 return 0;
>
> +       if (*p == '/')
> +               /* Uncompressed node name. Only compare the last part. */
> +               p = strrchr(p, '/') + 1;

However, you are changing behavior here that I'd guess has existed for
some time. This makes me suspicious that this is correct especially
when it is non-FDT DT you are trying to fix.

Given that 0-day reports an error with EFI stub, you also have to
consider if u-boot, barebox, grub, and all the other libfdt users
provide strrchr.

Rob
