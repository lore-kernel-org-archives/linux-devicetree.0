From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: ti,
 sci-clk: Add support for parsing clock info from DT
Date: Wed, 06 Feb 2019 09:47:18 -0800
Message-ID: <154947523891.74891.8214442349263473281@swboyd.mtv.corp.google.com>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
 <1546954223-9738-2-git-send-email-t-kristo@ti.com>
 <20190121210449.GB7851@bogus> <7ce7bd25-b5c4-f99d-fda6-0f21376f2204@ti.com>
 <ab8707fb-e632-5be9-9fdb-4b1fb3cb26ba@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ab8707fb-e632-5be9-9fdb-4b1fb3cb26ba@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, Tero Kristo <t-kristo@ti.com>
Cc: devicetree@vger.kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ssantosh@kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Tero Kristo (2019-02-05 00:25:40)
> On 22/01/2019 09:33, Tero Kristo wrote:
> > On 21/01/2019 23:04, Rob Herring wrote:
> >> At first, I thought this was an either/or thing. Use firmware or use DT,
> >> but it is really only get the clocks used in the DT from firmware.
> >>
> >> Why wouldn't you just always do that? I can think of 3 cases:
> >> reparenting, debug and overlays. This breaks reparenting and overlays,
> >> right? Debug could be handled with some userspace trigger to get all the
> >> clocks.
> > 
> > Re-parenting this does not break, as the scan still checks every 
> > possible parent of a clock scanned. Overlays are broken for sure, as we 
> > don't know which overlays we would be applying, and what clocks would be 
> > in them. Debug is kind of broken as we only scan a small portion of the 
> > clocks.
> > 
> >>
> >> Why scan any of the clocks up front? Why not just create the clocks on
> >> demand? If an unknown clock id is requested, then create the clock and
> >> query the firmware at that point. That would avoid the DT scan too.
> >> Maybe there's some issues in the clk framework preventing that, but
> >> that's not really a DT problem.
> > 
> > The very initial version I did a couple of years back, did scan the 
> > clocks based on need, and registered them dynamically. Stephen shot down 
> > this based on the assessment that there might be locking issues with the 
> > common clock framework with this approach leading into potential 
> > deadlock situations.

It's an interesting idea to limit the scope of clks that are registered
to only the leaf and whatever up to the root of the tree is involved in
the working set of the kernel.

> 
> So Rob, what is the final call on this binding? Ack/NAK? If NAK, shall I 
> implement a kernel cmdline param to select the parsing method or what is 
> preferred? Doing it build time with a simple Kconfig seems too limiting.
> 

Is the problem a performance problem where probing the firmware for all
the clks is costly and time intensive? So instead of doing that we're
describing some of the details in DT? Why can't we describe the clk tree
in C code with some data structure that indicates parent child linkages?
This is how every other SoC is doing this so far.
