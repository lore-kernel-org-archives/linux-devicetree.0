From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/2] Use SPDX-License-Identifier for rockchip devicetree
 files
Date: Fri, 15 Dec 2017 15:28:34 +0100
Message-ID: <21020918.S4038j3A1a@diego>
References: <20171215114427.32059-1-klaus.goger@theobroma-systems.com>
 <CAOFm3uHba4kBD81thpxSpDBsDS4Y5m7cN2jfYt_uT5atdSDmqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOFm3uHba4kBD81thpxSpDBsDS4Y5m7cN2jfYt_uT5atdSDmqg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Emil Renner Berthing <kernel@esmil.dk>, Huibin Hong <huibin.hong@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, Kever Yang <kever.yang@rock-chips.com>, LKML <linux-kernel@vger.kernel.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, Joseph Chen <chenjh@rock-chips.com>, Romain Perier <romain.perier@collabora.com>, Matthias Kaehlcke <mka@chromium.org>, Sugar Zhang <sugar.zhang@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, Brian Norris <briannorris@chromium.org>, Russell King <linux@armlinux.org.uk>, Jaehoon Chung <jh80.chung@samsung.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Jacob Chen <jacob-chen@iotwrt.com>, Jianqun Xu <jay.xu@rock-chips.com>, Shawn Lin <shawn.lin@rock>
List-Id: devicetree@vger.kernel.org

Am Freitag, 15. Dezember 2017, 14:45:34 CET schrieb Philippe Ombredanne:
> Klaus,
> 
> On Fri, Dec 15, 2017 at 12:44 PM, Klaus Goger
> 
> <klaus.goger@theobroma-systems.com> wrote:
> > This patch series replaces all the license text in rockchip devicetree
> > files text with a proper SPDX-License-Identifier.
> > It follows the guidelines submitted[1] by Thomas Gleixner that are not
> > yet merged.
> > 
> > These series also fixes the issue with contradicting statements in most
> > licenses. The introduction text claims to be GPL or X11[2] but the
> > following verbatim copy of the license is actually a MIT[3] license.
> > The X11 license includes a advertise clause and trademark information
> > related to the X Consortium. As these X Consortium specfic points are
> > irrelevant for us we stick with the actuall license text.
> > 
> > [1] https://patchwork.kernel.org/patch/10091607/
> > [2] https://spdx.org/licenses/X11.html
> > [3] https://spdx.org/licenses/MIT.html
> 
> FWIW, the X11 license name was not always something clearly defined.
> SPDX calls it clearly MIT which is the most widely accepted name for
> the corresponding text. And this is also what we have in Thomas doc
> patches that should be the kernel reference.
> 
> Also, as a general note, you want to make sure that such as patch set
> is not merged by mistake until you have collected an explicit review
> or ack from all the copyright holders involved.

Just for my understanding, is it really necessary to get Acks from _all_
previous contributors?

I see that Thomas patches moving license texts into the kernel itself do not 
seem to have landed yet, but when the actual license text does _not_ change
and only its location to a common place inside the kernel sources, it feels
a bit overkill trying to get Acks from _everybody_ that contributed to
Rockchip devicetrees for the last 4 years.

If we would actually want to change the license I would definitly feel 
differently, but the license text does not change.


Thanks
Heiko
