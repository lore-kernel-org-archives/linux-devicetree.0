From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 03/10] ASoC: sun8i-codec: add support for
 speaker amp GPIO
Date: Sat, 13 Oct 2018 12:34:37 +0800
Message-ID: <CAGb2v64r8k6rPah7GQy_T1Yi7u=zugL=iQTzCYTAiPu7eOTpSw@mail.gmail.com>
References: <20181013033230.6506-1-anarsoul@gmail.com>
 <20181013033230.6506-4-anarsoul@gmail.com>
 <CAGb2v66sfw6AQFjCjDA5JwYsE4zOaKjxjSLX5J8vq=wZrdHDVw@mail.gmail.com>
 <CA+E=qVeS4hhwFiu-Q939R6DLcf0aZg2SnMB6KZ0kvsC8kRgMiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CA+E=qVeS4hhwFiu-Q939R6DLcf0aZg2SnMB6KZ0kvsC8kRgMiw@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Code Kipper <codekipper@gmail.com>, Mark Brown <broonie@kernel.org>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 13, 2018 at 12:21 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> On Fri, Oct 12, 2018 at 9:00 PM Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > On Sat, Oct 13, 2018 at 11:33 AM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> > >
> > > Some boards may have external amplifier for speaker that is controlled
> > > via GPIO, add support for it in similar way as it's done in sun4i-codec
> > >
> > > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> >
> > ASoC now has a generic amplifier driver. Please use that instead.
> >
> > See Documentation/devicetree/bindings/sound/simple-amplifier.txt
>
> Is there any example on how to use it? Documentation doesn't specify
> what DAPM routes I have to add to get it working.

(CC-ed author, Jerome)

The driver lists INL, INR, OUTL, OUTR as the in and out endpoints.
Not sure why they aren't in the bindings, but this driver is relatively
new.

ChenYu
