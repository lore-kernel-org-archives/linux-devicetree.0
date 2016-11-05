From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [REGRESSION] "console: don't prefer first registered if DT specifies stdout-path" breaks console on video outputs of various ARM boards
Date: Sat, 5 Nov 2016 11:00:23 +0000
Message-ID: <2806714.DJA9EBBcvx@np-p-burton>
References: <20161104121135.4780-1-hdegoede@redhat.com> <17833033.PtOSTzKXGD@np-p-burton> <d3f0f1f4-d6f6-1e75-499c-789b82b5bb1b@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1801633.8lPRXRx3SU";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d3f0f1f4-d6f6-1e75-499c-789b82b5bb1b@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--nextPart1801633.8lPRXRx3SU
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 4 November 2016 14:22:17 GMT Hans de Goede wrote:
> Hi,
> 
> On 04-11-16 13:30, Paul Burton wrote:
> > Hi Hans,
> > 
> > On Friday, 4 November 2016 13:11:34 GMT Hans de Goede wrote:
> >> Hi All,
> >> 
> >> While booting 4.9-rc# for the first time on an Allwinner A33 tablet,
> >> I noticed that after u-boot the LCD display stayed black. It turns out
> >> that there was an issue which caused X to never get up, and all kernel
> >> (and other startup) messages prior to that only went to ttyS0 which
> >> consists of 2 tiny testpads on the PCB with this tablet.
> >> 
> >> The same issue will also happen on any ARM boards which have a HDMI or
> >> composite video output and which use a stdout-path pointing to their
> >> serial console. I think this will e.g. also impact the Raspberry Pi,
> >> I know for certain that this will impact the 99 different Allwinnner
> >> boards currently supported by mainline u-boot + the mainline kernel.
> >> 
> >> This is a behavior changes from previous kernels and I consider this
> >> a regression. Thus I propose to revert the commit in question, for more
> >> info here is a partial copy of the commit message of the proposed revert:
> >> 
> >> The reverted commit changes existing behavior on which many ARM boards
> >> rely. Many ARM small-board-computers, like e.g. the Raspberry Pi have
> >> both a video output and a serial console. Depending on whether the user
> >> is using the device as a more regular computer; or as a headless device
> >> we need to have the console on either one or the other.
> >> 
> >> Many users rely on the kernel behavior of the console being present on
> >> both outputs, before the reverted commit the console setup with no
> >> console= kernel arguments on an ARM board which sets stdout-path in dt
> >> would look like this:
> >> 
> >> [root@localhost ~]# cat /proc/consoles
> >> ttyS0                -W- (EC p a)    4:64
> >> tty0                 -WU (E  p  )    4:1
> >> 
> >> Where as after the reverted commit, it looks like this:
> >> 
> >> [root@localhost ~]# cat /proc/consoles
> >> ttyS0                -W- (EC p a)    4:64
> >> 
> >> This commit reverts commit 05fd007e4629 ("console: don't prefer first
> >> registered if DT specifies stdout-path") restoring the original behavior.
> >> 
> >> Regards,
> >> 
> >> Hans
> > 
> > Ugh... so the devices you're talking about rely upon set stdout-path in
> > their device tree but effectively rely upon us ignoring it?
> 
> No they rely on the kernel using stdout-path as an extra console while
> keeping tty0 as console, not ignoring it. This how stdout-path has always
> worked (at least as long as the Allwinner boards have used it, which has
> been 2 - 3 years now).
> 
> If you want only the console specified by stdout-path you can get this by
> specifying it with console=... on the kernel cmdline.
> 
> > If that's the case then I guess reverting is probably the best option, but
> > it does restore us to a position where we honor stdout-path for earlycon
> > & then essentially ignore it for the proper kernel console. That seems
> > pretty bust to me...
> 
> We do not ignore it, we use both the tty pointed to by stdout-path and tty0.
> 
> Regards,
> 
> Hans

Hi Hans,

Could you walk me though how you're getting that behaviour from the current 
code? I don't see how that would happen besides perhaps if drivers are probed 
in a fortunate order. Is that what you're relying upon?

What I see in my systems, and what 05fd007e4629 ("console: don't prefer first 
registered if DT specifies stdout-path") addressed, is that if there are for 
example 2 UARTs uart0 & uart1 that are probed in that order and stdout-path 
indicates that we should use uart1 we wind up essentially ignoring it because 
the ordering of the relevant calls goes:

  - of_console_check() for uart0
  - add_preferred_console() for uart0
  - register_console() for uart0
  - of_console_check() for uart1
  - add_preferred_console() for uart1
  - register_console() for uart1

Since of_check_console() doesn't get called for uart1 until after uart0 has 
been probed, we don't add an entry for it to the console_cmdline array until 
after register_console() has already decided to enable uart0 because 
preferred_console == -1.

I'm not the only one seeing this oddity either, for example see the discussion 
on this patch:

https://patchwork.kernel.org/patch/9263753/

By simply reverting my patch you restore us to a position where so far as I 
can see we simply do not honor stdout-path for the real kernel console.

Thanks,
    Paul
--nextPart1801633.8lPRXRx3SU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYHbvHAAoJEIIg2fppPBxlRO4P/iypGs5IKAT7TVAWs9PdgEl0
9PT6dK+VgosH0eQpwn7WPih/pUzsL13HqcXql3KZLdsa4+E8devPM0KUqSisXuiA
AsNO1e1WCWCU45LQZxqOUUuIvInfmI2LuB3KFAgD+xdAOv85/LGEa+kSB/kF5C0K
aZrNsymq8Np1Xlp350mDurutNKaIm/IMKN42/wSppfCcyMUT/EIMJoluEgbDzJjA
QTs4IrQT3vthCsP9+vJyGtARaZm+Ij5dOz357OtWyvAY13f+rj8CyTYXs3YGqRe8
cZvtKyTfQygdWGHKznJT/pSrbG5xISqRKBzjmF0JzlHQ/BUGlYm+zcSomTmpE2PB
iVP90WDOarO2hvVVD/dw9ewU/KxuWPVX7RdlNUwHAR8Jp2g2IqnLzq7ckH4VE+1D
wHvWt2S2S8LoS+0pxL9gyw+1iRhlzz6mKDvQb4rDx2ZzxSY1hXNOZSrP4BcTiFW8
rwTVwD3NxfsxDwuCBaHNGgTAJ7XeMlQvJGfsnfXjTnkvaNjt+ycltMGI2Vvbfx95
RS+SAJbsUBkAE/pwthM0g3n6anJbGaxxUXPRZRIBFMq3rMvlG9PB5C/WC8zSvlET
iwD8+8jPWqPgWa1u0+ZDpeMmXDh9cg6xwcipRVuqJKTCWNFSmSDaNbBje0N/vxnQ
Lpk5Dz/tg0xZaIfm9LFK
=IA7d
-----END PGP SIGNATURE-----

--nextPart1801633.8lPRXRx3SU--
