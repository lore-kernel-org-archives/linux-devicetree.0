From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC] net: phy: device: Don't deassert the reset when
 register and probe
Date: Tue, 27 Nov 2018 17:44:11 +0100
Message-ID: <20181127164411.GB19601@lunn.ch>
References: <1543320947-32763-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543320947-32763-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: netdev-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27, 2018 at 12:18:20PM +0000, Yoshihiro Shimoda wrote:
> Some PHY device needs edge signal of the reset, but the previous code
> is impossible to achieve it like following:
> 
>  1) Kernel boots by using initramfs.
>  --> No open the nic, so the provious code deasserts the reset by
>      phy_device_register() and phy_probe().
>  2) Kernel enters the suspend.
>  --> So, keep the reset signal as deassert.
>  --> On R-Car Salvator-XS board, unfortunately, the board power is
>      turned off.
>  3) Kernel returns from suspend.
>  4) ifconfig eth0 up
>  --> Then, since edge signal of the reset doesn't happen,
>      it cannot link up.

Hi Yoshihiro

It sounds like you should be adding code to the suspend/resume
handling of phylib, so that it toggle the reset on resume. You cannot
just delete code like you proposed, it is going to break devices. But
adding code should be O.K.

       Andrew
