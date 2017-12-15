From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 0/2] Use SPDX-License-Identifier for rockchip devicetree
 files
Date: Fri, 15 Dec 2017 16:20:41 +0100
Message-ID: <63058496.Aj9cacRib9@diego>
References: <20171215114427.32059-1-klaus.goger@theobroma-systems.com>
 <21020918.S4038j3A1a@diego>
 <CAOFm3uHuwmU1nCcU1MQ9qgGZ0A70ycuoo8XpWcDzgPQFzFRnRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAOFm3uHuwmU1nCcU1MQ9qgGZ0A70ycuoo8XpWcDzgPQFzFRnRA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Emil Renner Berthing <kernel-sKpHZLTYfq0@public.gmane.org>, Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>, Joseph Chen <chenjh-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sugar Zhang <sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Simon Xue <xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin@rock>
List-Id: devicetree@vger.kernel.org

Am Freitag, 15. Dezember 2017, 15:42:48 CET schrieb Philippe Ombredanne:
> On Fri, Dec 15, 2017 at 3:28 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> > Am Freitag, 15. Dezember 2017, 14:45:34 CET schrieb Philippe Ombredanne:
> >> Klaus,
> >> =

> >> On Fri, Dec 15, 2017 at 12:44 PM, Klaus Goger
> >> =

> >> <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org> wrote:
> >> > This patch series replaces all the license text in rockchip devicetr=
ee
> >> > files text with a proper SPDX-License-Identifier.
> >> > It follows the guidelines submitted[1] by Thomas Gleixner that are n=
ot
> >> > yet merged.
> >> > =

> >> > These series also fixes the issue with contradicting statements in m=
ost
> >> > licenses. The introduction text claims to be GPL or X11[2] but the
> >> > following verbatim copy of the license is actually a MIT[3] license.
> >> > The X11 license includes a advertise clause and trademark information
> >> > related to the X Consortium. As these X Consortium specfic points are
> >> > irrelevant for us we stick with the actuall license text.
> >> > =

> >> > [1] https://patchwork.kernel.org/patch/10091607/
> >> > [2] https://spdx.org/licenses/X11.html
> >> > [3] https://spdx.org/licenses/MIT.html
> >> =

> >> FWIW, the X11 license name was not always something clearly defined.
> >> SPDX calls it clearly MIT which is the most widely accepted name for
> >> the corresponding text. And this is also what we have in Thomas doc
> >> patches that should be the kernel reference.
> >> =

> >> Also, as a general note, you want to make sure that such as patch set
> >> is not merged by mistake until you have collected an explicit review
> >> or ack from all the copyright holders involved.
> > =

> > Just for my understanding, is it really necessary to get Acks from _all_
> > previous contributors?
> > =

> > I see that Thomas patches moving license texts into the kernel itself do
> > not seem to have landed yet, but when the actual license text does _not_
> > change and only its location to a common place inside the kernel source=
s,
> > it feels a bit overkill trying to get Acks from _everybody_ that
> > contributed to Rockchip devicetrees for the last 4 years.
> > =

> > If we would actually want to change the license I would definitly feel
> > differently, but the license text does not change.
> =

> Well you are technically right. But there is a social and politeness
> angle to this too. So may be getting the ack of all contributors is
> not always needed, but getting it is best and the right to do and at
> least getting for the named copyright holders should be there.
> =

> That's only only my take: leaving aside any technical legal issue, say
> I would be on the receiving end as one of the holder or contributors:
> I would find it really great and nice to have my ack requested. And I
> would be a dork not to give it. So I like to do to others the same I
> would appreciate done to me (within reason, as I sometimes shoot
> myself in the foot ;) )

Hehe ... I didn't plan on merging this without ample time for people
to either ACK or NAK the change, so was planning on keeping to social
protocol ;-) . Just the "all" threw me for a loop.

And having that as PATCH without RFC also communicates that people
should take a look, as RFC patches are often overlooked.

As Klaus seems to have included most people that have contributed in the
past, I would guess we should receive any existing complaints about that
change :-) .

So I'll definitly let this simmer for quite a bit and do a best-effort Ack =

collection.


Thanks
Heiko
