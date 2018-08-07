From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v7 0/4] IR support for A83T
Date: Tue, 7 Aug 2018 14:25:44 +0800
Message-ID: <CAGb2v66oe71CEtqkB2S-AYRzGnTQiJjVPUoRPkefd=9aqK+XbA@mail.gmail.com>
References: <20180801094801.26627-1-embed3d@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB77WUTNQKGQENE6MAMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180801094801.26627-1-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, sean-hENCXIMQXOg@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 1, 2018 at 5:47 PM, Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch series adds support for the sunxi A83T ir module and enhances
> the sunxi-ir driver. Right now the base clock frequency for the ir driver
> is a hard coded define and is set to 8 MHz.
> This works for the most common ir receivers. On the Sinovoip Bananapi M3
> the ir receiver needs, a 3 MHz base clock frequency to work without
> problems with this driver.
>
> This patch series adds support for an optinal property that makes it able
> to override the default base clock frequency and enables the ir interface
> on the a83t and the Bananapi M3.

Queued up for 4.20.

Thanks!
