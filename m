From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [REGRESSION] "console: don't prefer first registered if DT specifies stdout-path" breaks console on video outputs of various ARM boards
Date: Sat, 5 Nov 2016 10:40:02 +0000
Message-ID: <1573891.u0IFOelkNI@np-p-burton>
References: <20161104121135.4780-1-hdegoede@redhat.com> <17833033.PtOSTzKXGD@np-p-burton> <d3f0f1f4-d6f6-1e75-499c-789b82b5bb1b@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1743643.7HBd3xU0qz";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d3f0f1f4-d6f6-1e75-499c-789b82b5bb1b@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--nextPart1743643.7HBd3xU0qz
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
--nextPart1743643.7HBd3xU0qz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYHbcCAAoJEIIg2fppPBxlmigP+wV+EOQ1EN8HfJxNkwRcehXW
vYzYjvOcACEC3NOuB1bIWrszk7XDi2rBdFA0xDbjIa2+UQKoJ4Rth+jnpxn0gsk6
3141Lb7bx7H4spA69brvC1jGzdUkLU3isaCFLnIkDant56WXupVjf0aTjr2j7x7O
Wi7D1BNQZwOc6RWVqRcKem0g05Lq7z/M2u2eQHHV3K9EL67P/YrIQG0S/5YzKj2i
I5Sj5+epPt11Q7WhUUC0UEs5FrURbYYrDACUwcv/67vWipn2eNw5CcrKBgcNvKez
EtDpkSJ3rcXF9uG3qDTEMjMJTg5hFuAF/aTsAPEJbNpKUi02eMLcf56W1pY2fQOK
UQy6Vqki1bF8mim4rzTW4VA/whN4kobfHsIUSx1w8Oz2O4GaHJWVUa7XjQK042mX
JtLQykvSUA+srpauk3+g2tgARKmjKpS7w3ciIB1jLeGRnMBzRMaEHEJXdvj9ca98
ADeMT7Yh+czUZGHHEXol4UWPHSaIHC1RUYpXbi2i/65c3VVOlmVjRJkbgEC2qCeA
fvsKdDwfQvDuI76UgVCkQJu8GVCWx0uBNmueN2DG3diwoRoCVaEKFeQHTOUQwY0h
YhvrbrusesmOBFy19peiK9EV8YO4PB/CjgfTzZX716MkWHHk/AxkEtdd0BiyIj0q
pj51dGaezoIrTkY572o3
=yl2g
-----END PGP SIGNATURE-----

--nextPart1743643.7HBd3xU0qz--
