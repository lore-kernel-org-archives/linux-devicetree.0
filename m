From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 0/8] gnss: add new GNSS subsystem
Date: Wed, 30 May 2018 07:38:22 -0700
Message-ID: <20180530143822.lvtwjvbqe7gvbvgq@localhost>
References: <20180530103242.20773-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180530103242.20773-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 30, 2018 at 12:32:34PM +0200, Johan Hovold wrote:
> Another possible extension is to add generic 1PPS support.

There are two possibilities to consider.

1. If the PPS causes an interrupt, then it should hook into the PPS
   subsystem.

2. If the PPS is a HW signal routed for example to the input pin of a
   MAC based PTP Hardware Clock (PHC), then it would make sense to
   model the GNSS device as a PHC as well.  This PHC would be readable
   but not writable, and more importantly it would offer an output
   signal.  Then user space could use the existing interfaces to
   dial the PPS signal from one device the another.

(Come to think of it, modeling the GNSS as PHC would also give you the
interface for #1 as well.)

Thanks,
Richard
