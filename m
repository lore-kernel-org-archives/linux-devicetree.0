From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/1] Memory leak in scripts/dtc/util.c
Date: Thu, 27 Feb 2014 19:32:43 -0600
Message-ID: <CAL_JsqK9Wquv6kgefyPvy0JqXNO7Cx2+iN_ss=CtgXnKEjrF-Q@mail.gmail.com>
References: <1393525473-12238-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393525473-12238-1-git-send-email-xypron.glpk@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: xypron.glpk@gmx.de, Jon Loeliger <jdl@jdl.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 27, 2014 at 12:24 PM,  <xypron.glpk@gmx.de> wrote:
> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
>
> buf was leaked if out of memory
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  scripts/dtc/util.c |    2 ++
>  1 file changed, 2 insertions(+)

This needs to be made against upstream dtc repo (on kernel.org now).
Also, there is a newly created list for dtc specific topics:

http://vger.kernel.org/vger-lists.html#devicetree-compiler

Rob

>
> diff --git a/scripts/dtc/util.c b/scripts/dtc/util.c
> index 2422c34..a1e2e59 100644
> --- a/scripts/dtc/util.c
> +++ b/scripts/dtc/util.c
> @@ -210,9 +210,11 @@ int utilfdt_read_err(const char *filename, char **buffp)
>         do {
>                 /* Expand the buffer to hold the next chunk */
>                 if (offset == bufsize) {
> +                       char *buf_old = buf;
>                         bufsize *= 2;
>                         buf = realloc(buf, bufsize);
>                         if (!buf) {
> +                               buf = buf_old;
>                                 ret = ENOMEM;
>                                 break;
>                         }
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
