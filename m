From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] r8169: Load MAC address from device tree if present
Date: Fri, 25 Jan 2019 20:07:15 +0100
Message-ID: <20190125190715.GG22211@lunn.ch>
References: <20190125101814.6262-1-thierry.reding@gmail.com>
 <20190125145711.GF12962@lunn.ch>
 <42d32783-c433-b859-6ba4-f2864f034871@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <42d32783-c433-b859-6ba4-f2864f034871@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, "David S. Miller" <davem@davemloft.net>, Realtek linux nic maintainers <nic_swsd@realtek.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> Andrew, for my understanding: What do you think is wrong with the 
> alignment requirement? It was introduced because we do a 32 bit access
> to the start address of the array and want to avoid an unaligned access.

Hi Heiner

Because you are doing pointer aliasing, the compiler will by default
generate bad code, doing unaligned access. Adding the attribute works
around this. But it is just a work around. Since this is very slow
path code, i would just avoid the pointer aliasing, write a bit more C
code as Thierry suggested, and the optimiser will probably figure out
what is going on and produce reasonable code.

Also, in general, by avoiding pointer aliasing, you allow static code
checkers to work better. They are more likely to discover buffer
overruns, etc.

    Andrew
