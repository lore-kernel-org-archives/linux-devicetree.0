From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: sunxi: Add USB clock register defintions
Date: Tue, 04 Feb 2014 11:14:44 +0100
Message-ID: <52F0BD94.1060601@redhat.com>
References: <1390426587-16287-1-git-send-email-hdegoede@redhat.com> <1390426587-16287-3-git-send-email-hdegoede@redhat.com> <20140127144349.GJ3867@lukather> <52E67316.5020906@redhat.com> <20140128094427.GZ3867@lukather> <52E77FCD.5050701@redhat.com> <20140204094051.GL25625@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBHP3YKLQKGQEO4UZDLQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140204094051.GL25625@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

On 02/04/2014 10:40 AM, Maxime Ripard wrote:
> Hi Hans,
>=20
> On Tue, Jan 28, 2014 at 11:00:45AM +0100, Hans de Goede wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>=20
>> Hi,
>>=20
>> On 01/28/2014 10:44 AM, Maxime Ripard wrote:
>>> On Mon, Jan 27, 2014 at 03:54:14PM +0100, Hans de Goede wrote:
>>>>>> "allwinner,sun5i-a13-usb-gates-clk" - for usb gates + resets on A13
>>>>>=20
>>>>> Maybe we can just remove the gates from there? Even though they are g=
ates, they are also (a bit) more than that.
>>>>=20
>>>> To be clear you mean s/usb-gates-clk/usb-clk/ right ?
>>>=20
>>> Yep, exactly
>>>=20
>>>>> I guess that means that we will have the OHCI0 gate declared with <&.=
..-gates-clk 6>, while it's actually the first gate for this clock?
>>>>=20
>>>> Correct.
>>>>=20
>>>>> Maybe introducing an offset field in the gates_data would be a good i=
dea, so that we always start from indexing the gates from 0 in the DT?
>>>>=20
>>>> Well for the other "gates" type clks we also have holes in the range, =
and we always refer to the clk with the bit number in the reg as the clock-=
cell value.
>>>=20
>>> Yes, we have holes, but I see two majors differences here: - the other =
gates are just gates, while the usb clocks are a bit more than that.
>>=20
>> The usb-clk registers contain more then that, but the bits we are talkin=
g about now are gates.
>>=20
>>> - the other gates' gating bits thus all start at bit 0, while - here, s=
ince it's kind of a "mixed" clock, the gating bits start - at bit 6 (on the=
 A20 at least)
>>=20
>> Right, still I believe that the consistent thing to do is keeping the bi=
t-number for the bit in the register controlling the gate as the specifier.=
  When adding new dts entries / reviewing existing ones I'm used to matchin=
g the specifier to the bit-nr in the data-sheet, I think making things diff=
erent just for this one register is counter productive.
>=20
> And if you turn it the other way around, it would be inconsistent that al=
l gates indices start at 0, and we would start at 6 here :)

I think the problem here is that you see the specifier part of the clk
phandle as an index, which it is not. All devicetree docs / code talks
about specifiers or arguments not indexes. Once you stop seeing this as
an index, you will hopefully also stop insisting this needs to
start at 0 :)

Also note that it already is not an index for existing sunxi clks which hav=
e
cells !=3D 0, as there are holes in the bits used in the gates registers an=
d
calling the specifier an index suggest we're dealing with an array, and
arrays never have holes.

The clk specifier as currently used in sunxi clks is a 1:1 mapping of the
gate register bit numbers, as is clearly documented in ie:
Documentation/devicetree/bindings/clock/sunxi/sun4i-a10-gates.txt
Where the datasheet is referenced as the source for (most) of the values
to put in the specifier.

My biggest objection is that this would loose 1:1 mapping we currently
have between the specifier and bit-nr in the register, which really is
convenient when writing new dts bindings.

When we add an offset users will need to first lookup which clk they need i=
n
the datasheet and then look at both the dts bindings doc to find how this i=
s
mapped to the specifier. In my experience such an extra level of indirectio=
n
in documentation is a PITA, and all that just so that some random number
(it is not an index!) can start at 0 ?

To me adding an offset here and making the clk gates different form all
our other clock gates just feels wrong.

Regards,

Hans
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlLwvZMACgkQF3VEtJrzE/sz0gCfQNwhM/RpimtbhumvKKQ4a4V+
Vo4AoLTNKRZXlPC84hi1JInPGYvZIxuR
=3DdA68
-----END PGP SIGNATURE-----

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
