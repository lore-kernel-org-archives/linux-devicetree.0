From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH V2 net-next 4/5] net: mdio: of: Register discovered MII
 time stampers.
Date: Sun, 7 Oct 2018 20:19:21 +0200
Message-ID: <20181007181921.GB22794@lunn.ch>
References: <20181007173823.21590-5-richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007173823.21590-5-richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 10:38:22AM -0700, Richard Cochran wrote:
> When parsing a PHY node, register its time stamper, if any, and attach
> the instance to the PHY device.

Hi Richard

This does look a lot better.

Thanks for making the changes.

       Andrew
