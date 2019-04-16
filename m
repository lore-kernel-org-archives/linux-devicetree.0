From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/7] arm64: meson: g12a: add audio devices
Date: Tue, 16 Apr 2019 12:22:46 -0700
Message-ID: <CAOi56cU0dHoyRzTXeKGoiFwTms4WuJ7LV2EXTJLoEmOsC8OyrA@mail.gmail.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com> <7h5zrdpytg.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7h5zrdpytg.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 16, 2019 at 11:52 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Jerome Brunet <jbrunet@baylibre.com> writes:
>
> > This patchset adds most the audio devices of the g12a SoCs.
> >
> > Kevin, couple of things worth noting:
> >  * This patch depends of the new audio clocks binding recently applied
> >    by Neil [0].
>
> Was this supposed to be part of the clk-headers dependency PR I
> received?  /me looks... It looks like it's applied right after the tag I
> pulled, so I doesn't look like it.
>
> If I should queue $SUBJECT series up for 5.2, I'll need another stable
> tag.

Also, this doesn't apply cleanly anymore to my v5.2/dt64 branch.  When
the stable tag is ready, do you mind doing a rebase? (or telling me
what it currently applies to, and I will do the rebase.)

Thanks,

Kevin
