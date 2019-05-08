From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] of: Add dummy for of_node_is_root if not CONFIG_OF
Date: Wed, 8 May 2019 08:51:08 -0700
Message-ID: <CAD=FV=WFNjvm9Swe_jRO1X3yn-OV596_4yhA9m_yD4Coq1qTWw@mail.gmail.com>
References: <20190507044801.250396-1-dianders@chromium.org>
 <a3573253-e3de-0a82-8af3-6bacea20bd97@gmail.com> <CAD=FV=UAFUH12DbA++HML75E55BCttpNBxe9t-VEQvGjGx0=Wg@mail.gmail.com>
 <18324244-cca8-a836-5c2e-c626ca8771aa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <18324244-cca8-a836-5c2e-c626ca8771aa@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Kees Cook <keescook@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Julius Werner <jwerner@chromium.org>, Guenter Roeck <groeck@chromium.org>, Brian Norris <briannorris@chromium.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, May 7, 2019 at 3:17 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 5/7/19 10:59 AM, Doug Anderson wrote:
> > Hi,
> >
> >
> > On Tue, May 7, 2019 at 10:52 AM Frank Rowand <frowand.list@gmail.com> wrote:
> >>
> >> On 5/6/19 9:48 PM, Douglas Anderson wrote:
> >>> We'll add a dummy to just return false.
> >>
> >> A more complete explanation of why this is needed please.
> >>
> >> My one guess would be compile testing of arch/sparc/kernel/prom_64.c
> >> fails???
> >
> > Ah, sorry.  Needed for:
> >
> > https://lkml.kernel.org/r/CAD=FV=Vxp-U7mZUNmAAOja5pt-8rZqPryEvwTg_Dv3ChuH_TrA@mail.gmail.com
>
> Got it.  I went and looked at that.  I think a better approach would be to
> check parent node not "/reserved-memory".  I am making this suggestion in
> that email thread.

OK.  Assuming that people are happy with that approach [1], we should
consider this patch abandoned.  Thanks for your reviews!

[1] https://lkml.kernel.org/r/20190508154832.241525-1-dianders@chromium.org

-Doug
