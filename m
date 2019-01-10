Return-Path: <SRS0=MwbZ=PS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from 212-186-180-163.static.upcbusiness.at ([212.186.180.163]:38158
        "EHLO cgate.sperl.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727344AbfAJQhI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 10 Jan 2019 11:37:08 -0500
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH V5 0/4] Microchip mcp25xxfd can controller driver
From: kernel@martin.sperl.org
In-Reply-To: <98ecfed2-0834-c842-540e-fb3cc4abe7e1@grandegger.com>
Date: Thu, 10 Jan 2019 17:37:00 +0100
Content-Transfer-Encoding: 8BIT
Message-Id: <7970E0CD-658C-4837-AA40-33B2D8935079@martin.sperl.org>
References: <20181221092950.14192-1-kernel@martin.sperl.org> <98ecfed2-0834-c842-540e-fb3cc4abe7e1@grandegger.com>
Sender: devicetree-owner@vger.kernel.org
To: Wolfgang Grandegger <wg@grandegger.com>
Cc: linux-can@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, Wilhelm Leichtfried <Wilhelm.Leichtfried@microchip.com>, Thomas Kopp <Thomas.Kopp@microchip.com>, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Brad Hanson <Brad.Hanson@arity.com>, Teemu Keskinarkaus <teemu.keskinarkaus@crosscontrol.com>
List-ID: <devicetree@vger.kernel.org>

Hi Wolfgang,

> On 10.01.2019, at 09:30, Wolfgang Grandegger <wg@grandegger.com> wrote:
> 
> Hello Martin,
> 
> Do I understand you correctly, this is the basic driver and the
> optimizations are not yet included!? Well, I expected less code than
> last time but now it's spit up in smaller files, at least. Will try to
> do a review this week…
> 
This is the basic driver - split into the 3 main components:
* core (essentially basic module management, identification and clock/ram)
* GPIO handling of the GPIO/INT pins
* CAN

where CAN is obviously the biggest, but it is also split out into
* basic
* interrupt handling
* fifo setup
* CAN Frame reception
* CAN Frame transmission

The place that we could split out more is reducing the fifo-setup
to a single TX and RX fifo, but the cost of ripping out that portion 
(and itsstructural dependencies) is quite high just to produce code 
that is never actually run…

So I have made the driver all minimal removing all the big performance
optimizations while leaving the basic multi-fifo setup in the config 
- mostly in mcp25xxfd_can_fifo and some in mcp25xxfd_can_rx and 
mcp25xxfd_can_tx.

I have to admit that there is one optimization that is in can_tx that
could get separated out into a separate patch.

That is the function mcp25xxfd_can_int_handle_tefif_oportunistic
the removal of which would simplify mcp25xxfd_can_int_handle_tefif
slightly, but that code should be fairly simple to read.

If you want, then I can move this to a separate patch in the next
version.

Basic setup, interrupt handling, SERR error handling and others
would still need to happen in the initial driver, so that is a 
big chunk of the overall driver.

There is already a new patchset in the pipeline that:
* addresses some concerns in mcp_write_then_* with regards to the
  use of stack variables for transmit/receive buffers 
  - rewrite of function.
  (reported by Enrico Scholz)
* initialization of 2 variables in priv (reported by Enrico Scholz).
* adds 4 optimization patches:
  * can: mcp25xxfd: optimize tef reads reading multiple TEFs in one go
  * can: mcp25xxfd: optimize SPI reads of FIFOs in can2.0 mode
  * can: mcp25xxfd: add prediction of CanFD frames sizes based on history
  * can: mcp25xxfd: optimize reception of big CanFD frame reception with BRS

There is a bug with regards to transmission of CanFD with BRS that
still needs to get fixed before I send out the next version - what
is the root cause here is unclear (this may be a regression in the
calculation of data bitrate that gives now different SJW values than
before that impacts the controllers ability to send BRS frames,
but it could also be something else like TDC (= Transmitter Delay
Compensation).

But I guess I shall also wait for further feedback before sending
out this next version.

Thanks,
	Martin
