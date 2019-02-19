From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 13/15] ARM: dts: milbeaut: Add device tree set for the
 Milbeaut M10V board
Date: Tue, 19 Feb 2019 11:11:23 +0100
Message-ID: <CAK8P3a0H3wYKqiV6XZe9V_y8rjDTFHcU_jq7+HkwX+6dnXvU9Q@mail.gmail.com>
References: <1549628920-32623-1-git-send-email-sugaya.taichi@socionext.com>
 <CAK8P3a15mLEgVAh1+jQ+GqOcQa0zhrePWofo8iGkTs5_bd=TmQ@mail.gmail.com> <ba5bb646-7fa6-e98f-4ac2-47c55c8f82ba@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ba5bb646-7fa6-e98f-4ac2-47c55c8f82ba@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Sugaya, Taichi" <sugaya.taichi@socionext.com>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 19, 2019 at 6:11 AM Sugaya, Taichi
<sugaya.taichi@socionext.com> wrote:
>
> Hi,
> Thank you for you comments.
>
> On 2019/02/18 21:09, Arnd Bergmann wrote:
> > On Fri, Feb 8, 2019 at 1:28 PM Sugaya Taichi
> > <sugaya.taichi@socionext.com> wrote:
> >> +
> >> +       aliases {
> >> +               serial1 = &uart1;
> >> +       };
> >
> > Maybe start with serial0 here? It seems unusual to start
> > counting at 1.
> >
>
> The M10V evaluation board(EVB) uses a console with uart ch1, so this
> alias number is derived from the used channel one.
> Therefore it is no problem to change the alias number to 0.

The alias should normally reflect whatever is printed on the board,
if there are no labels, the convention is to start with zero, regardless
of what internal uart is connected to it.

     Arnd
