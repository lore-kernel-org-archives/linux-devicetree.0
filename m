From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V2 net-next 0/5] Peer to Peer One-Step time stamping
Date: Sun, 7 Oct 2018 12:36:57 -0700
Message-ID: <20181007193657.3bgfy5x4plylnnz2@localhost>
References: <20181007173823.21590-1-richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007173823.21590-1-richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 10:38:18AM -0700, Richard Cochran wrote:
> Changed in v2:
> ~~~~~~~~~~~~~~
> - Per the v1 review, changed the modeling of MII time stamping
>   devices.  They are no longer a kind of mdio device.

Forgot to add:

 - Added method to callback into the driver after changes in link
   status.

Thanks,
Richard
