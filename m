From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/2] net: phy: dp83867: Add documentation for SGMII mode
 type
Date: Fri, 6 Sep 2019 21:29:19 +0200
Message-ID: <20190906192919.GA2339@lunn.ch>
References: <1567700761-14195-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Sender: netdev-owner@vger.kernel.org
To: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
Cc: davem@davemloft.net, robh+dt@kernel.org, f.fainelli@gmail.com, Mark Rutland <mark.rutland@arm.com>, Trent Piepho <tpiepho@impinj.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 07:26:00PM +0300, Vitaly Gaiduk wrote:
> Add documentation of ti,sgmii-type which can be used to select
> SGMII mode type (4 or 6-wire).

Hi Vitaly

Is 4 vs 6-wire a generic SGMII property? Or is it proprietary to TI?

I did a quick search and i could not find any other PHYs supporting
it.

	Andrew
