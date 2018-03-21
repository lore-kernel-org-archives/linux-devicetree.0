Return-Path: <SRS0=ljBG=GL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:38205 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752974AbeCUTdV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 21 Mar 2018 15:33:21 -0400
Date: Wed, 21 Mar 2018 20:33:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Message-ID: <20180321193315.GR24516@lunn.ch>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 21, 2018 at 11:58:18AM -0700, Richard Cochran wrote:
> The InES at the ZHAW offers a PTP time stamping IP core.  The FPGA
> logic recognizes and time stamps PTP frames on the MII bus.  This
> patch adds a driver for the core along with a device tree binding to
> allow hooking the driver to MAC devices.

Hi Richard

Can you point us at some documentation for this.

I think Florian and I want to better understand how this device works,
in order to understand your other changes.

   Andrew
