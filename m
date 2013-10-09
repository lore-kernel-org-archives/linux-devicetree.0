From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 2/3] ARM: shmobile: emev2: Add clock tree description
 in DT
Date: Wed, 9 Oct 2013 12:40:12 +0900
Message-ID: <20131009034011.GN15065@verge.net.au>
References: <20131008143040.52f36df8edb7ab63224d8433@ops.dti.ne.jp>
 <20131008143307.9270bd3307a0524d89088c2a@ops.dti.ne.jp>
 <CANqRtoT0EYcn6U_-Zin7eryiYGwb0C16AyLXtnsQ0Srt1PTG=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANqRtoT0EYcn6U_-Zin7eryiYGwb0C16AyLXtnsQ0Srt1PTG=w@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: takasi-y@ops.dti.ne.jp, SH-Linux <linux-sh@vger.kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>, Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>, Mike Turquette <mturquette@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 08, 2013 at 02:54:26PM +0900, Magnus Damm wrote:
> On Tue, Oct 8, 2013 at 2:33 PM,  <takasi-y@ops.dti.ne.jp> wrote:
> > Add minimum clock tree description to .dts file.
> > This provides same set of clocks as current sh-clkfwk version .c
> > code does.
> >
> > Signed-off-by: Takashi Yoshii <takasi-y@ops.dti.ne.jp>

Thanks.

I plan to add this patch to a new topic branch,
topic/emev2-common-clock, in the renesas tree and
queue it up from there for inclusion in mainline
if/when the first patch of this series is accepted
by Mike Turquette.
