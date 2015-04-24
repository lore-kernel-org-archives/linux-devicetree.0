From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 9/9] ARM: BCM283x: Register fixed clocks for uart in the DT.
Date: Fri, 24 Apr 2015 10:06:23 -0700
Message-ID: <87vbglwj5c.fsf@eliezer.anholt.net>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <1429639796-2169-10-git-send-email-eric@anholt.net> <5539CA1A.1040009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5539CA1A.1040009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 04/21/2015 12:09 PM, Eric Anholt wrote:
>> We were previously relying on the fixed clock registration in
>> clk-bcm2835, but there doesn't seem to be any real reason to not just
>> define it in the DT (and for the 2836 port, I would have needed to
>> change the clock's physical address in clk-bcm2835.c).  Also, because
>> we weren't registering the apb_pclk in clk-bcm2835 as a clock device,
>> we were picking up the uart clock node as apb_pclk by accident.
>
> Doesn't the following do just that?
>
> clk = clk_register_fixed_rate(NULL, "apb_pclk", NULL, CLK_IS_ROOT,
>                               126000000);

Nope!  You also need the clk_register_clkdev for the type of lookup
being done by APB to find it.

> Anyway, with this patch, shouldn't we fix drivers/clk/clk-bcm2835.c not
> to register clocks that match those that are added to DT in this patch?
> Actually, to maintain DT ABI (new kernels working with old or new DT),
> we probably need to keep the code in clk-bcm2835.c, but make it
> conditional upon whether there's a clock node in the DT file.

Yeah, I hadn't modified the .c code because of DT ABI

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVOngPAAoJELXWKTbR/J7oFTwP/0/t5zFNlqo8tVnRy34p4/9m
uIVe7v+NjC5/I9RLobxB6p87FnEp98VysV82z9UM8tLk3NxAXn57PaSq6RtqHZg4
7swOYtYOz1Z84Sbm+sBlNrHKXjs5Jt6uiePK1eaoUmkOYMGBwbfMlL5wysPyUJzO
HwCggVx7KoYGwazDvGPoTW1Rq2oVc174Ro+/Dg1/W8eIucSL2nOm6Z7VtwVhhpPm
jjHeeKG8TXgJY594WrftewWms8mJBwXpuOo3L22urCUI7Zc+GPEdA1Oxgwc9tfBv
NrPSdG/HAi3jVOgpfahtv5CjxLAIv9cPWEFbZrKw83k0KggXSzzwDGYENZ4eUfHF
S06OOQBTABfz/PuIdl89YDOaOMsRLt3ttdg+oZu5cxlv4QlFG+Ghh4oYIl+S986a
VJ+xuYG0thhe1IUrZjBDKrpTRWSNcwQlBFSz0lweG2y763Rw2Fd25qayFQJ2/8qv
9qZwpI9Z8MDi9vrOOlX0V2GF25mWoyeTqKpX7GLOMdZWBfiuHlTMrOsfxH/tfEKP
2WbH4zDwZnWhrRshirKMHZwuFBJuUSAJK3C1ivNP8xvNZpnLoQc52so3/Ddv0He6
SVLzikKHSHwWtot/7QkJrZP65tkLh9LZhOpcZ4qXEcPoFBkUKZFt4LYdxun0lGhB
qQJ2ojqF2iYniI05VYdf
=kGSW
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
