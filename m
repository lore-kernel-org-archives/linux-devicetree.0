From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] ARM: dts: uniphier: add ProXstream2 Vodka board
 support
Date: Fri, 23 Oct 2015 22:10:01 +0200
Message-ID: <4176900.TvBCpZCKl2@wuerfel>
References: <1444899934-4754-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNARJhpz0AmLDL9j5c20cnv=+7CGiJMgGHhreJEd0rG3zSw@mail.gmail.com>
 <CAK7LNAQG-aqu0khSMZYLqd0P_Oz4MPuQccTMb0nYeR5JthnKhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK7LNAQG-aqu0khSMZYLqd0P_Oz4MPuQccTMb0nYeR5JthnKhA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 21 October 2015 17:49:12 Masahiro Yamada wrote:
> > Right.  In-kernel drivers can handle it nicely.
> >
> > Also, we can write a device tree that specifies device connection
> > hierarchy like follows.
> > The device names will appear under /sys/ directory and user-land
> > applications can check them.
> >
> > &i2c4 {
> >         demodulator {
> >                  compatible = "...";
> >
> >         };
> > };
> >
> > &i2c6 {
> >          hdmi_tx {
> >
> >                    compatible = "...";
> >          };
> > }
> >
> >
> > I understand that I2C bus number assumption is avoidable,
> > but I am still not fully convinced.
> >
> > Matching /dev/i2c* and the real hardware block ID (this is written in
> > the SoC spec book)
> > makes things clearer, I think.
> >
> 
> 
> Anyway, this version is unacceptable, right?

Sorry for the late reply.

I would not call it unacceptable, just a bit unpleasant. We can merge it
if you cannot come up with a nicer way to do this. It was a good idea
to split to resend the series without this patch, but the replacement
to delete the aliases also doesn't look nice. If we can't come up with
a better way to do this, I'd suggest you re-send this patch and add a
bit more explanation into the changelog as to why you want this to
be done in an unusual way.

	Arnd
