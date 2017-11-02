From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 6/7] netdev: octeon-ethernet: Add Cavium Octeon III
 support.
Date: Thu, 2 Nov 2017 17:10:16 +0100
Message-ID: <20171102161016.GH24320@lunn.ch>
References: <20171102003606.19913-1-david.daney@cavium.com>
 <20171102003606.19913-7-david.daney@cavium.com>
 <20171102124339.GF4772@lunn.ch>
 <521d6b21-b7f0-66e0-4b49-cf95d83452d1@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <521d6b21-b7f0-66e0-4b49-cf95d83452d1@caviumnetworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Carlos Munoz <cmunoz@cavium.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 02, 2017 at 08:55:33AM -0700, David Daney wrote:
> On 11/02/2017 05:43 AM, Andrew Lunn wrote:
> [...]
> >>+
> >>+		i = atomic_inc_return(&pki_id);
> >>+		pki_dev = platform_device_register_data(&new_dev->dev,
> >>+							is_mix ? "octeon_mgmt" : "ethernet-mac-pki",
> >>+							i, &platform_data, sizeof(platform_data));
> >>+		dev_info(&pdev->dev, "Created %s %u: %p\n",
> >>+			 is_mix ? "MIX" : "PKI", pki_dev->id, pki_dev);
> >
> >Is there any change of these ethernet ports being used to connect to
> >an Ethernet switch. We have had issues in the past with these sort of
> >platform devices combined with DSA.
> >
> 
> There are only two possibilities.  The BGX MACs have a multiplexer that
> allows them to be connected to either the "octeon_mgmt" MIX packet
> processor, or to the "ethernet-mac-pki" PKI/PKO packet processor.  The SoCs
> supported by these drivers do not contain any hardware that would be
> considered an "Ethernet switch".

Hi David

I was thinking of an external Ethernet switch. You generally connect
via RGMII to a port of the switch.

http://elixir.free-electrons.com/linux/v4.9.60/source/Documentation/networking/dsa/dsa.txt

	Andrew
