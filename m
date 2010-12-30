From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 02/11] x86: Add device tree support
Date: Thu, 30 Dec 2010 02:45:44 -0600
Message-ID: <AANLkTin2=T=v0ZNOpAGhwuM0i9Ts8Xr+kRtEJ95VGeOp@mail.gmail.com>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-3-git-send-email-bigeasy@linutronix.de>
	<1290807736.32570.143.camel@pasglop>
	<20101128134907.GA30784@www.tglx.de>
	<20101230082654.GB11721@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101230082654.GB11721@angua.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, devicetree-discuss@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org, sodaville@linutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, Dec 30, 2010 at 2:26 AM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> What is the boot sequence for the embedded x86 platforms? =A0Is there
> still a bootloader?

There's no one embedded setup on any platform, but one of the few
constants of embedded development is trying to eliminate unnecessary
requirements.

Just on standard-ish PC hardware I've seen people try to stick Linux in=
 the
BIOS flash (generally not enough room), I've seen people try to stick
it as the first stage PXE payload, there's the fun and games with
kexec of emergency kernels for crash dumps...

If the capability to skip an unnecessary bootloader was available, peop=
le
would use it.

Rob
