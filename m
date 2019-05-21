From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V2 net-next 5/5] ptp: Add a driver for InES time stamping
 IP core.
Date: Tue, 21 May 2019 11:52:53 -0700
Message-ID: <20190521185253.xxcvpx4dqd6htszj@localhost>
References: <20181007173823.21590-6-richardcochran@gmail.com>
 <20181012204256.GA16019@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181012204256.GA16019@bogus>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 12, 2018 at 03:42:57PM -0500, Rob Herring wrote:
> On Sun, Oct 07, 2018 at 10:38:23AM -0700, Richard Cochran wrote:
> > +
> > +Required properties of the control node:
> > +
> > +- compatible:		"ines,ptp-ctrl"
> 
> ines is not registered vendor prefix. Should it be 'zhaw' instead?

I am preparing V3.  Can you explain what you mean by "registered
vendor prefix" please?

This IP Core comes from the ZHAW School of Engineering, Institute of
Embedded Systems (InES).

ZHAW stands for "Zürcher Hochschule für Angewandte Wissenschaften."

Thanks,
Richard
