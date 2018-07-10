From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v5 03/22] dt-bindings: sram: sunxi: Introduce new A10
 binding for system-control
Date: Tue, 10 Jul 2018 22:02:39 +0800
Message-ID: <CAGb2v661JHS7r=6LE1em18owSUwk8VXbAGCAVez7=2u5P2R4Jg@mail.gmail.com>
References: <20180710080114.31469-1-paul.kocialkowski@bootlin.com> <20180710080114.31469-4-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180710080114.31469-4-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Marco Franchi <marco.franchi@nxp.com>, Icenowy Zheng <icenowy@aosc.io>, Hans Verkuil <hverkuil@xs4all.nl>, Keiichi Watanabe <keiichiw@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Smitha T Murthy <smitha.t@samsung.com>, Tom Saeger <tom.saeger@oracle.com>, Andrzej Hajda <a.hajda@samsung.com>, "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2018 at 4:00 PM, Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
> Following-up on the introduction of a new binding for the A64, this
> introduces a system-control binding for the A10 as a replacement of
> the sram-controller binding.
>
> This change is motivated by consistency with the Allwinner literature,
> that mentions system control over SRAM controller. Moreover, the system
> control block is sometimes used for more than SRAM (e.g. for muxing
> related to the ethernet PHY).
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
