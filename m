From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] of/fdt: Remove dead code and mark functions with __init
Date: Tue, 14 May 2019 12:06:48 -0500
Message-ID: <CAL_JsqKS5KgNpVvunhax+M4+NceP9uy_V=2cYk54kg5eOfxXwA@mail.gmail.com>
References: <20190509215538.93346-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509215538.93346-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 9, 2019 at 4:55 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Some functions in here are never called, and others are only called
> during __init. Remove the dead code and some dead exports for functions
> that don't exist (I'm looking at you of_fdt_get_string!). Mark some
> functions with __init so we can throw them away after we boot up and
> poke at the FDT blob too.

Some of these aren't called, but there are cases where they could be
used instead of accessing initial_boot_params directly. The question
is what direction do we want to go. Make initial_boot_params private
or do away with the wrapper api and expect users to use libfdt api
only. I guess I lean toward the latter because that aligns with my
goal to move all the code in drivers/of/ somewhere else so I have
nothing to maintain. :)

>
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../devicetree/bindings/common-properties.txt |  4 +-
>  drivers/of/fdt.c                              | 37 +++----------------
>  include/linux/of_fdt.h                        | 11 ------
>  3 files changed, 7 insertions(+), 45 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/common-properties.txt b/Documentation/devicetree/bindings/common-properties.txt
> index a3448bfa1c82..1c50d8700ab5 100644
> --- a/Documentation/devicetree/bindings/common-properties.txt
> +++ b/Documentation/devicetree/bindings/common-properties.txt
> @@ -25,8 +25,8 @@ Optional properties:
>  If a binding supports these properties, then the binding should also
>  specify the default behavior if none of these properties are present.
>  In such cases, little-endian is the preferred default, but it is not
> -a requirement.  The of_device_is_big_endian() and of_fdt_is_big_endian()
> -helper functions do assume that little-endian is the default, because
> +a requirement.  The of_device_is_big_endian()

Hum, we shouldn't have kernel functions in binding docs. Can you
reword to remove both functions.

> +helper function assumes that little-endian is the default, because
>  most existing (PCI-based) drivers implicitly default to LE by using
>  readl/writel for MMIO accesses.
>
