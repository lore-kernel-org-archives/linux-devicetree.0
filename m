From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] drivers: of: removing assignment of 0 to static variable
Date: Fri, 30 Oct 2015 13:30:34 -0500
Message-ID: <CAL_JsqLGCJkw-YmxQ5TUpy880CYnZbZRqxpme3vuHNdXvqC1hA@mail.gmail.com>
References: <saurabh.truth@gmail.com> <1445917321-5225-1-git-send-email-saurabh.truth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445917321-5225-1-git-send-email-saurabh.truth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saurabh Sengar <saurabh.truth@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 26, 2015 at 10:42 PM, Saurabh Sengar
<saurabh.truth@gmail.com> wrote:
> no need to initialise static variable with 0, hence correcting it.
>
> Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>

Applied. Thanks.

Rob

> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 6e82bc42..63699dd 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -184,7 +184,7 @@ static void * unflatten_dt_node(const void *blob,
>         struct property *pp, **prev_pp = NULL;
>         const char *pathp;
>         unsigned int l, allocl;
> -       static int depth = 0;
> +       static int depth;
>         int old_depth;
>         int offset;
>         int has_name = 0;
> --
> 1.9.1
>
