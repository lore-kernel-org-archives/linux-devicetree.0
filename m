From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] net: phy: device: Don't deassert the reset when
 register and probe
Date: Tue, 27 Nov 2018 22:02:41 +0100
Message-ID: <CAMuHMdVOFxDCmFDPgNbvsP9PEcw9yAtN8CPmF3=Tx79buDZWrg@mail.gmail.com>
References: <1543320947-32763-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181127164411.GB19601@lunn.ch> <4aa356d3-7c99-a9d6-0e6c-d46be7e44948@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <4aa356d3-7c99-a9d6-0e6c-d46be7e44948@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Heiner,

On Tue, Nov 27, 2018 at 8:47 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> On 27.11.2018 17:44, Andrew Lunn wrote:
> > On Tue, Nov 27, 2018 at 12:18:20PM +0000, Yoshihiro Shimoda wrote:
> >> Some PHY device needs edge signal of the reset, but the previous code
> >> is impossible to achieve it like following:
> >>
> >>  1) Kernel boots by using initramfs.
> >>  --> No open the nic, so the provious code deasserts the reset by
> >>      phy_device_register() and phy_probe().
> >>  2) Kernel enters the suspend.
> >>  --> So, keep the reset signal as deassert.
> >>  --> On R-Car Salvator-XS board, unfortunately, the board power is
> >>      turned off.
> >>  3) Kernel returns from suspend.
> >>  4) ifconfig eth0 up
> >>  --> Then, since edge signal of the reset doesn't happen,
> >>      it cannot link up.
> >
> > Hi Yoshihiro
> >
> > It sounds like you should be adding code to the suspend/resume
> > handling of phylib, so that it toggle the reset on resume. You cannot
> > just delete code like you proposed, it is going to break devices. But
> > adding code should be O.K.
> >
> The commit message mentions that the patch is supposed to fix some
> issue on the Salvator-XS board. I found the following from a year ago
> https://www.spinics.net/lists/netdev/msg457308.html
> which is also about PHY reset and this board. Is there still something
> open?  But as Andrew mentioned already: Just deleting code w/o
> checking what it's good for and whether this could have side effects,
> isn't a solution. Especially because the patch would silently remove
> the call to phy_scan_fixups().

That's correct: my original motivation for picking up Sergei's patches was to
make Ethernet work after suspend/resume on the same Salvator-XS board.

The main difference seems to be that I was using NFS root, while Shimoda-san
is using an initramfs.  Hence there probably is an inconsistency in reset
handling for an active vs. inactive Ethernet interface.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
