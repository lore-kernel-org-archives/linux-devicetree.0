From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/3] mfd: syscon: Add optional clock support
Date: Mon, 18 Feb 2019 13:54:32 +0100
Message-ID: <CAK8P3a01rEa3bqHuhgFbNZJrb38f5XrGnDd=W3xKVorfJXHZkw@mail.gmail.com>
References: <1544604495-4082-1-git-send-email-fabrice.gasnier@st.com>
 <1544604495-4082-3-git-send-email-fabrice.gasnier@st.com> <CAK8P3a1MucNG86=bXwVVsasGBOLJ67kuRSpoeneF6M5aB6GmQA@mail.gmail.com>
 <9e0ee154-a399-9bff-3beb-adfd9d6c6fee@st.com> <CAK8P3a0kV4-OF7JPwM9cEqxaPvNM9dFZdyZetc47t+D5izkFwQ@mail.gmail.com>
 <47a3fe9f-8adb-8f47-e7c1-342f8fc318aa@st.com> <01d49f11-a68e-1674-e6b7-d1b87aa973c9@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <01d49f11-a68e-1674-e6b7-d1b87aa973c9@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 11, 2019 at 5:32 PM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
>
> On 1/28/19 2:20 PM, Fabrice Gasnier wrote:
> > On 1/16/19 4:11 PM, Arnd Bergmann wrote:
> >> On Wed, Jan 16, 2019 at 3:10 PM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
> >>
> >> What I mean is that nodes that listed as 'compatible="syscon"' get
> >> probed by the syscon driver even when no other driver references
> >> them, and that in turn would acquire the clock, right?
> >
> > When no other driver references them, nothing happens at probe time on
> > the clock: no calls to get/prepare... the clock.
> >
> > => The clock will remain unrequested & unused until another driver calls
> > one of "of_syscon_register()" variants:
> > - syscon_node_to_regmap
> > - syscon_regmap_lookup_by_compatible
> > - syscon_regmap_lookup_by_phandle
> >
> > When another driver references them (e.g. one of the above calls), then
> > it will acquire the optional clock and use it, e.g.:
> > - clk_prepare() upon of_syscon_register() variants
> > - clk_enable & clk_disable when accessing the registers
> >
> > I hope this clarifies.
>
> I would appreciate to have your feedback.

Yes, I think that's all we need here, thanks for the clarification,
and sorry for dropping the ball on this again.

Acked-by: Arnd Bergmann <arnd@arndb.de>


      Arnd
