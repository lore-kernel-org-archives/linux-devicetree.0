From: Guenter Roeck <groeck@google.com>
Subject: Re: [PATCH] of: Add dummy for of_node_is_root if not CONFIG_OF
Date: Tue, 7 May 2019 07:52:47 -0700
Message-ID: <CABXOdTcsDU5dSAFWZBAvrOGRa+BokgKi9huGfs=fO4ObCOvnHQ@mail.gmail.com>
References: <20190507044801.250396-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507044801.250396-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Kees Cook <keescook@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Julius Werner <jwerner@chromium.org>, Guenter Roeck <groeck@chromium.org>, Brian Norris <briannorris@chromium.org>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 6, 2019 at 9:48 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> We'll add a dummy to just return false.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
>  include/linux/of.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 0cf857012f11..62ae5c1cafa5 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -653,6 +653,11 @@ static inline bool of_have_populated_dt(void)
>         return false;
>  }
>
> +static inline bool of_node_is_root(const struct device_node *node)
> +{
> +       return false;
> +}
> +
>  static inline struct device_node *of_get_compatible_child(const struct device_node *parent,
>                                         const char *compatible)
>  {
> --
> 2.21.0.1020.gf2820cf01a-goog
>
