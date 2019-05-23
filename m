From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 2/8] dt-bindings: phy: dp83867: Add
 documentation for disabling clock output
Date: Wed, 22 May 2019 17:44:02 -0700 (PDT)
Message-ID: <20190522.174402.536799926980375439.davem@davemloft.net>
References: <20190522184255.16323-1-tpiepho@impinj.com>
        <20190522184255.16323-2-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190522184255.16323-2-tpiepho@impinj.com>
Sender: netdev-owner@vger.kernel.org
To: tpiepho@impinj.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 22 May 2019 18:43:21 +0000

> The clock output is generally only used for testing and development and
> not used to daisy-chain PHYs.  It's just a source of RF noise afterward.
> 
> Add a mux value for "off".  I've added it as another enumeration to the
> output property.  In the actual PHY, the mux and the output enable are
> independently controllable.  However, it doesn't seem useful to be able
> to describe the mux setting when the output is disabled.
> 
> Document that PHY's default setting will be left as is if the property
> is omitted.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Applied.
