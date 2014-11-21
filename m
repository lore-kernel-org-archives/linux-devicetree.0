From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/9] clk: Add clock driver for mb86s7x
Date: Fri, 21 Nov 2014 21:12:29 +0100
Message-ID: <4948551.vhPsR9enmp@wuerfel>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
 <5451217.D7Cssxh5Uh@wuerfel>
 <CAJe_Zhc2UePxy-Y2LsU1Pn18OOknDKZw-8rjJ06DEWOhvs6CMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJe_Zhc2UePxy-Y2LsU1Pn18OOknDKZw-8rjJ06DEWOhvs6CMw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Andy Green <andy.green@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Vincent Yang <vincent.yang.fujitsu@gmail.com>, Patch Tracking <patches@linaro.org>, Vincent Yang <Vincent.Yang@tw.fujitsu.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Mike Turquette <mturquette@linaro.org>, Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Friday 21 November 2014 23:28:38 Jassi Brar wrote:
> On 21 November 2014 22:45, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Friday 21 November 2014 22:06:51 Jassi Brar wrote:
> 
> >> >> Only MB86S70_CRG11_UNGPRT is marked to mean one special (non-maskable)
> >> >> port on the controller, which the clock driver does make use of.
> >> >
> >> > Is this the actual port number that is known to be non-maskable?
> >> >
> >> Yes the clock comes out of the controller and is also the parent of
> >> other 8 independently maskable clock ports of the domain.
> >
> > I'm getting confused by the terminology here. Is MB86S70_CRG11_ALW
> > a port or a controller?
> >
> Sorry, bad symbols. ALW..DPHY are controllers. UNGPRT is the ninth
> parent clock (port) of a domain that can't be masked.
> FYKI, there are 6 instances, of some CRG11 clock controller, under
> control of the remote f/w. The Mailbox protocol between remote f/w and
> Linux assigned indices [0-5] to these controllers.

Ok, not it makes sense, thanks for clearing that up!

> >>  The firmware on remote master, lets say, don't wanna be bothered by
> >> the clock topology. Even for set-rate the onus is on Linux to request
> >> only appropriate rates at appropriate times so that other devices are
> >> not messed up.
> >
> > Is there any code to validate that, or does Linux just treat all
> > clocks transparently?
> >
> The remote does not expose the clock topology and only accepts
> requests on port-basis. The remote f/w is supposed to keep track of
> which ports are used by Linux and then work out inter-dependencies
> upon receiving a request from Linux. So for Linux there are N
> independent 'root' clocks, ops on which may or may not succeed at any
> given time.

Ok.

	Arnd
