From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/6] ARM: dts: sunxi: h3/h5: Drop A31 fallback compatible
 for CSI controller
Date: Thu, 24 Jan 2019 18:15:43 +0800
Message-ID: <CAGb2v67oLffVXYAHHcHEo6_rNddqpFwCGq2DzgFW_zkfbpf12g@mail.gmail.com>
References: <20181130075849.16941-1-wens@csie.org> <20181130075849.16941-4-wens@csie.org>
 <CAMty3ZBFVStHNbYaBxT+Rmy6+g4jtm0cFKk8BL5BDid3c5VW-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMty3ZBFVStHNbYaBxT+Rmy6+g4jtm0cFKk8BL5BDid3c5VW-Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-media <linux-media@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 3, 2018 at 5:44 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Fri, Nov 30, 2018 at 1:29 PM Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > The CSI controller found on the H3 (and H5) is a reduced version of the
> > one found on the A31. It only has 1 channel, instead of 4 channels for
> > time-multiplexed BT.656. Since the H3 is a reduced version, it cannot
> > "fallback" to a compatible that implements more features than it
> > supports.
> >
> > Drop the A31 fallback compatible.
> >
> > Fixes: f89120b6f554 ("ARM: dts: sun8i: Add the H3/H5 CSI controller")
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>

Merged for 5.1, as the accompanying driver changes were also merged for 5.1

ChenYu
