From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v4 11/17] pinctrl: sunxi: add support
 for suniv F1C100s (newer F-series SoCs)
Date: Sun, 25 Nov 2018 13:49:53 +0100
Message-ID: <CACRpkdb6dbGMdLznm8F_jV2zj9dJfiwTK5w-8YShxwiPALE3+g@mail.gmail.com>
References: <cover.1543131714.git.mesihkilinc@gmail.com> <233099b6384217ddaf5147e54859359acd56be0e.1543131714.git.mesihkilinc@gmail.com>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDE6RCFOWIARB7VU5LPQKGQEEHCSB7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <233099b6384217ddaf5147e54859359acd56be0e.1543131714.git.mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 25, 2018 at 8:44 AM Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> The suniv F1C100s chip (several new F-series SoCs) of Allwinner has a
> pin
> controller like other SoCs from Allwinner.
>
> Add support for it.
>
> Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

Patch applied to the pin control tree for v4.21.

Yours,
Linus Walleij
