From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 2/5] gnss: sirf: power on logic for devices without
 wakeup signal
Date: Tue, 22 Jan 2019 09:38:19 +0100
Message-ID: <20190122083819.GP3691@localhost>
References: <20181209195150.5192-1-andreas@kemnade.info>
 <20181209195150.5192-3-andreas@kemnade.info>
 <20190110121038.GA9725@localhost>
 <20190110230223.18ecbd87@kemnade.info>
 <20190114105129.GE3691@localhost>
 <20190114131346.4d476055@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190114131346.4d476055@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Johan Hovold <johan@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2019 at 01:13:46PM +0100, Andreas Kemnade wrote:
> On Mon, 14 Jan 2019 11:51:29 +0100
> Johan Hovold <johan@kernel.org> wrote:

> > Good point. Unless we know the current state, we'd need to sleep for
> > HIBERNATE_TIMEOUT before waiting for data reception.
> > 
> > > >      - timeout: failure
> > > > 
> > > >   hibernate:
> > > >    - toggle on-off
> > > >    - sleep(HIBERNATE_TIMEOUT)  
> > > we could also additionally check here for 
> > >    if (last_bytes_received == GOODBYE_MSG)  
> > 
> > Caching and parsing the stream for this could get messy. And is the
> > expected message clearly defined somewhere, or would it be device (and
> > firmware) dependent?
> > 
> I think so but I must check.
> $PSRF150.0
> 
> But as said, these ideas are be for a possibly later patchset.

Yeah, and remember that the receiver can be in binary sirf mode as well,
so this do indeed seem like something that will need to wait.

Thanks,
Johan
