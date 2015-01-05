From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 1/3] TTY: add support for "tty slave" devices.
Date: Mon, 5 Jan 2015 15:41:41 +0000
Message-ID: <20150105154141.6f191cd5@lxorguk.ukuu.org.uk>
References: <20141211214801.4127.93914.stgit@notabene.brown>
	<20141211215943.4127.24792.stgit@notabene.brown>
	<20141228142010.GA3922@amd>
	<20150103103357.2406fc23@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150103103357.2406fc23@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.de>
Cc: Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> It would be really nice if the uart would register the line disciple as a
> child device, then the line discipline would register whatever it wants.

For almost every case this doesn't work. You need a tty interface as well
because thats how you manage it.

> But that isn't how it works.  The line discipline doesn't talk to the uart.
> Rather the tty layer talks to the uart (through tty_operations) and to the
> line discipline (through tty_ldisc_ops) and also registers the char_dev.

This is intentional. An ldisc has no business knowing what it's connected
to. Try running bluetooth over a tty/pty pair remotely to a dongle - and
you can do it or faking a GSM mux over a tty/pty pair for testing.

There are lots of cases where we know the correct ldisc from information
in the ACPI, DT or even USB identifiers in order to plug in the right
ldisc and daemon but I think that pretty much has to be in user space.
The kernel might be able to set an ldisc but it can't go around starting
bluetooth daemons, doing modem chats to go into mux mode or firing up
JMRI and java when it sees a Sprog. That's a job for systemd/udev.

Alan
