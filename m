From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Mon, 18 Nov 2013 13:26:46 +0100
Message-ID: <20131118122644.GA26046@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52644A9E.3060007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 20, 2013 at 10:26:54PM +0100, Stephen Warren wrote:
[...]
> In general, the kernel still needs a complete driver to every last
> device on every strange board, and needs to support every strange way
> some random board hooks all the devices together.
[...]

This may only be slightly related and it doesn't address all the points
you brought up here, but for lack of a better place, here goes.

I've had an interesting discussion with a friend over the weekend which
eventually turned to a similar topic. With all the recent discussions
about how to push board-specific details out into firmware, perhaps a
more drastic measure would be to push for standardization of hardware
interfaces.

For instance, one of the reason we have so much code in the kernel is
because every driver needs to talk to hardware through a slightly
different set of registers. Perhaps it would be possible to get some
discussion going about standardizing register interfaces for various
components. This has already been done for 16550 UART and the same
should be possible for a wide variety of other controllers such as I2C
or SPI.

There have been some attempts at creating reusable IP blocks, I think
ARM does have quite a few which can be licensed. At the same time, many
vendors may already have their own IP so it makes little sense for them
to license third party IP just to provide a standard interface for
drivers. However it might be easy in many cases to support the standard
interface using custom IP blocks.

I suspect something similar could be done for much of the clock, power
and reset requirements of IP blocks. Now I know little about how exactly
an SoC is designed these days, but I can imagine that it would be easy
to move out some of the complexity into hardware by defining something
like a standard register to enable a block. If each block has that
standard register it becomes trivial to write driver and SoC support. It
essentially becomes a matter of calling a platform_device_enable()
function, analogous to pci_enable_device(). There would no longer be a
need for the kind of intra-SoC glue that's taking up a significant
amount of code these days.

Obviously an effort such as the above is on a completely different scale
and would require many vendors to sit together and work something out.
But this isn't new either. After all there are committees and consortia
that already do this in some areas (Khronos). Many of these working
groups seem to focus mostly on software specifications, but what would
prevent them from doing something similar on a hardware interface level?

There are of course some dangers to this as well. Since much of the
complexity is moved into hardware, bugs can no longer be fixed or easily
worked around in software. However to some degree the same is true for
scenarios where a lot of the complexity is moved into firmware instead,
since that's typically not easily replaceable or fixable either.

Thierry

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSigeEAAoJEN0jrNd/PrOhdr0P/A57CgMoAelt0SutJAxBqwTo
qjDydCl91fNwyB7cr16lElz8KHgsTMWymDTDWali256GKLOJPMiWrS5BE4uedDum
EGQOJA8DkLlAowhDYC73/q/Jfs/uamDQsqIwIPwZYBL006hetqYKML1i76uXi2yz
AjKLBtrzufJHwlsZQtwUdzu48IkLuYoxHTiBZct+mrH3b4bl6kVfZJ05pMx/4F1W
Jz5HOOd4RaImIi98DSlbw4k3C3a/1/74B1GBYyxmKzEKIx7zSpETGGPvbk1lgzly
sM+9uic24vmekri3vMjosY3d86vU8Xwi3R2OUL+dj/BxpV6Ty6iDHGIIgH2zF6VT
l9ri8JkaSHg7NLpvfGuj+aIH8ZlfAKq5boXSNsk2yC0MC59yBMx4OAwbIkv3nxde
S4D1hXCvzAOn17lCnRQxsj+IdpsxB9gY6Kmu1j25SKbqZnN8/71AXYxOfLnWtqKo
BCXxQGRcQ8cVnSyd4EfvvGBWNxpHDE6S/1uMAzoofDetKwsoXzZ039Jz32U8/MVh
pwL/NupLmEFMnClJmh0FEr3qvKVfstMmMUY31UbK9niEAvSw0573slu6uhu/vqCN
OewLBAcaBH5wZQhbjT0TRhh17OOfILIshQiCsCL5GAH3dkrmnYPdEEuZc4+uDW3p
2PyXVfPK2pQGagrhlsF9
=2ZAq
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
