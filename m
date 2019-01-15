From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 2/5] gnss: sirf: power on logic for devices without
 wakeup signal
Date: Tue, 15 Jan 2019 10:08:25 +0100
Message-ID: <20190115090825.GM3691@localhost>
References: <20181209195150.5192-1-andreas@kemnade.info>
 <20181209195150.5192-3-andreas@kemnade.info>
 <20190110121038.GA9725@localhost>
 <20190110230223.18ecbd87@kemnade.info>
 <20190114105129.GE3691@localhost>
 <20190114225802.4dcd8cd2@aktux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190114225802.4dcd8cd2@aktux>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Johan Hovold <johan@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2019 at 10:58:02PM +0100, Andreas Kemnade wrote:
> On Mon, 14 Jan 2019 11:51:29 +0100
> Johan Hovold <johan@kernel.org> wrote:
> 
> here is a second part of a reply.

I'm not sure I received the first part if you're saying you replied to
my mail in two parts?

> [...]
> > > > In pseudo code we have:
> > > > 
> > > >   activate:
> > > >    - toggle on-off
> > > >    - wait(data-received, ACTIVATE_TIMEOUT + REPORT_CYCLE)
> > > >      - reception: success   
> > > 
> > > Note: we can also get the goodbye/shutdown message from the chip here
> > > so there are chances of a false success, but since we initially power down,
> > > we will rule out wrong state here.  
> > 
> > Good point. Unless we know the current state, we'd need to sleep for
> > HIBERNATE_TIMEOUT before waiting for data reception.
> 
> And probably this also magically (together with my
> runtime_get/put()-pair) in _probe()) worked around the
> problems fixed by the.
> gnss: sirf: fix activation retry handling

The retry-handling fix would only avoid a successful last retry attempt
incorrectly being reported as a failure, so I don't think that would
change much here.

> Well, with the last patchset and short report cycle we can detect state
> changes to off state reliably but state changes to on state
> only unreliably (which was, as said, not the intention). If the GPS chip
> behaves well enough, we will not see trouble.
> 
> Now with long report cycles: Off state detection will always return
> success. On state detection (in its current wonky form) will see the
> state change messages and will also always return success. If initial
> state is correct, this works at least in a wonky way.
> 
> I do not like these wonky things too much. So I would rather see
> well-defined behavior with well-known limitations.
> 
> State change failures are probably not only a theoretical thing,
> so it is a good idea to track that.

Good, sounds like we're on the same page then.

Thanks,
Johan
