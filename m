From: Janusz Uzycki <j.uzycki@elproma.com.pl>
Subject: Re: [PATCH RESEND] serial: mxs-auart: add sysrq support
Date: Thu,  2 Oct 2014 20:11:35 +0200
Message-ID: <1412273496-10610-1-git-send-email-j.uzycki@elproma.com.pl>
References: <20140929014129.GA8687@kroah.com>
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <20140929014129.GA8687@kroah.com>
In-Reply-To: <20140929014129.GA8687@kroah.com>
Sender: linux-serial-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Jiri Slaby <jslaby@suse.cz>, Richard Genoud <richard.genoud@gmail.com>, Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Janusz Uzycki <j.uzycki@elproma.com.pl>
List-Id: devicetree@vger.kernel.org

> So I'm deleting all of these now, please resend the latest
> versions you have, with properly versioning
> and order information.
Sure. I've just learnt about RFC header.

[PATCH RESEND] serial: mxs-auart: add sysrq support
It is extracted from my previous patchset
as independent from others.
The patch is resent as ready to apply.

I resend it again because last time
in conver letter I swapped subject with
in-reply-to and the patch could be omited.

Janusz Uzycki (1):
  serial: mxs-auart: add sysrq support

 drivers/tty/serial/mxs-auart.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.7.11.3
