From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V3 net-next 6/6] ptp: Add a driver for InES time stamping
 IP core.
Date: Mon, 27 May 2019 22:28:55 -0700
Message-ID: <20190528052855.5n4eb47rinjzzl4w@localhost>
References: <20190521224723.6116-7-richardcochran@gmail.com>
 <20190522014220.GB734@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522014220.GB734@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 22, 2019 at 03:42:20AM +0200, Andrew Lunn wrote:
> I don't know about the PTP subsystem, but in general, forward
> declarations are frowned upon, and it is generally requested to
> reorder the functions to remove them.

I am not aware of any general coding style rule or even defacto
practice in this area, but there is a method to this driver.  The
functions are in alphabetical order.  This makes it easier to find
your way around the driver.

Thanks,
Richard
