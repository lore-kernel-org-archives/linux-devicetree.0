From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 2/6] clk: sunxi: Add H3 clocks support
Date: Fri, 30 Oct 2015 09:28:55 +0100
Message-ID: <3751073.AWmm18dvKK@wuerfel>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com> <1445964626-6484-3-git-send-email-jenskuske@gmail.com>
Reply-To: arnd-r2nGTMty4D4@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBUOUZSYQKGQEW4XOHAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1445964626-6484-3-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 27 October 2015 17:50:22 Jens Kuske wrote:
> +               of_property_read_string_index(node, "clock-output-names",
> +                                             i, &clk_name);
> +
> +               if (index == 17 || (index >= 29 && index <= 31))
> +                       clk_parent = AHB2;
> +               else if (index <= 63 || index >= 128)
> +                       clk_parent = AHB1;
> +               else if (index >= 64 && index <= 95)
> +                       clk_parent = APB1;
> +               else if (index >= 96 && index <= 127)
> +                       clk_parent = APB2;
> +
> +               clk_reg = reg + 4 * (index / 32);
> 

Same as for the reset driver, this probably means you should have one
cell to indicate which bus it is for, and another cell for the
index.

	Arnd
