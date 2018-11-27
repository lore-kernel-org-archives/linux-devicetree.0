From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH/RFC] net: phy: device: Don't deassert the reset when
 register and probe
Date: Tue, 27 Nov 2018 20:45:49 +0100
Message-ID: <4aa356d3-7c99-a9d6-0e6c-d46be7e44948@gmail.com>
References: <1543320947-32763-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181127164411.GB19601@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181127164411.GB19601@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 27.11.2018 17:44, Andrew Lunn wrote:
> On Tue, Nov 27, 2018 at 12:18:20PM +0000, Yoshihiro Shimoda wrote:
>> Some PHY device needs edge signal of the reset, but the previous code
>> is impossible to achieve it like following:
>>
>>  1) Kernel boots by using initramfs.
>>  --> No open the nic, so the provious code deasserts the reset by
>>      phy_device_register() and phy_probe().
>>  2) Kernel enters the suspend.
>>  --> So, keep the reset signal as deassert.
>>  --> On R-Car Salvator-XS board, unfortunately, the board power is
>>      turned off.
>>  3) Kernel returns from suspend.
>>  4) ifconfig eth0 up
>>  --> Then, since edge signal of the reset doesn't happen,
>>      it cannot link up.
> 
> Hi Yoshihiro
> 
> It sounds like you should be adding code to the suspend/resume
> handling of phylib, so that it toggle the reset on resume. You cannot
> just delete code like you proposed, it is going to break devices. But
> adding code should be O.K.
> 
The commit message mentions that the patch is supposed to fix some
issue on the Salvator-XS board. I found the following from a year ago
https://www.spinics.net/lists/netdev/msg457308.html
which is also about PHY reset and this board. Is there still something
open?  But as Andrew mentioned already: Just deleting code w/o
checking what it's good for and whether this could have side effects,
isn't a solution. Especially because the patch would silently remove
the call to phy_scan_fixups().

Heiner

>        Andrew
> .
> 
