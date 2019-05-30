From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH V4 net-next 0/6] Peer to Peer One-Step time stamping
Date: Thu, 30 May 2019 11:55:07 -0700 (PDT)
Message-ID: <20190530.115507.1344606945620280103.davem@davemloft.net>
References: <cover.1559109076.git.richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cover.1559109076.git.richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: richardcochran@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, jacob.e.keller@intel.com, mark.rutland@arm.com, mlichvar@redhat.com, robh+dt@kernel.org, willemb@google.com
List-Id: devicetree@vger.kernel.org

From: Richard Cochran <richardcochran@gmail.com>
Date: Tue, 28 May 2019 22:58:01 -0700

> This series adds support for PTP (IEEE 1588) P2P one-step time
> stamping along with a driver for a hardware device that supports this.
> 
> If the hardware supports p2p one-step, it subtracts the ingress time
> stamp value from the Pdelay_Request correction field.  The user space
> software stack then simply copies the correction field into the
> Pdelay_Response, and on transmission the hardware adds the egress time
> stamp into the correction field.
> 
> This new functionality extends CONFIG_NETWORK_PHY_TIMESTAMPING to
> cover MII snooping devices, but it still depends on phylib, just as
> that option does.  Expanding beyond phylib is not within the scope of
> the this series.
> 
> User space support is available in the current linuxptp master branch.
> 
> - Patch 1 adds the new option.
> - Patches 2-5 add support for MII time stamping in non-PHY devices.
> - Patch 6 adds a driver implementing the new option.

Series applied, thanks Richard.
