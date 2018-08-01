From: NeilBrown <neilb@suse.com>
Subject: Re: [PATCH] mtd: spi-nor: only apply reset hacks to broken hardware
Date: Wed, 01 Aug 2018 11:06:18 +1000
Message-ID: <87k1parj3p.fsf@notabene.neil.brown.name>
References: <20180727183313.137943-1-computersforpeace@gmail.com>
 <20180727220337.1b3375ca@bbrezillon>
 <87wotcrz94.fsf@notabene.neil.brown.name>
 <20180731221255.3e65c1fa@bbrezillon>
 <20180731223550.GA60117@ban.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2446501229037701834=="
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180731223550.GA60117@ban.mtv.corp.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============2446501229037701834==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31 2018, Brian Norris wrote:

> Hi Neil, Boris,
>
> On Tue, Jul 31, 2018 at 10:12:55PM +0200, Boris Brezillon wrote:
>> On Tue, 31 Jul 2018 11:05:11 +1000
>> NeilBrown <neilb@suse.com> wrote:
>> > On Fri, Jul 27 2018, Boris Brezillon wrote:
>> > > On Fri, 27 Jul 2018 11:33:13 -0700
>> > > I'll leave Neil some time to review/test/comment on the patch before
>> > > queuing it, but it looks good to me.=20=20
>> >=20
>> > Thanks.
>> > I can confirm that if I apply this patch, my system won't reboot
>> > properly (as expected), and if I then add
>> >=20
>> > 		broken-flash-reset;
>> >=20
>> > to the jedec,spi-nor device, it starts functioning correctly again.
>> >=20
>> > I don't like the pejorative "broken", and it also suggests that a thing
>> > used to work, but something happened to break it - this is not
>> > accurate.
>> > I would prefer something like "reset-not-connected" which is an accura=
te
>> > description of the state of the hardware.
>
> One reason I didn't specifically say something like "not connected", is
> because IIUC it's actually *possible* to have a robust boot sequence
> without the RESET# pin -- e.g., if your boot ROM hardcoded a software
> reset command (just because it's not really standardized doesn't mean
> one can't do it).

Yes, if we could change the hardware (ROM is hardware) there are various
things we could do to improve reliability.
What we want to do in devicetree is to describe the (unchangeable)
hardware so that Linux can work with it as well as possible.

If I have hardware that doesn't reset the flash on reset, then labeling
it
  doesnt-reset-flash-on-system-reset
is perfectly appropriate.  Labeling it "broken" is pejorative and unhelpful.

>
>> > I also think that having a WARN_ON is an over-reaction.  Certainly a
>> > warning could be appropriate, but just one pr_warn() should be enough.
>> > The "problem" is unlikely in practice, and loudly warning people that =
an
>> > asteroid might kill them isn't particularly helpful.
>> >=20
>> > I genuinely think that if the system fails to reboot, then Linux is at
>> > fault. I accept that changing Linux to be completely robust might be
>> > more trouble than it is worth, but I don't accept that it is impossibl=
e.
>
> Did you read my last response on the original thread? In my
> understanding, there's always a way to, e.g., b0rk your exception
> handlers, etc., such that you cannot guarantee your software fallbacks
> will work. Normally, one would rely on a (hardware) watchdog to do your
> last resort reset for you, but if said reset cannot also reset your boot
> flash, then...you're stuck.
>
> IOW, it's impossible.

I cannot say for certain if I read your last response, but I've read
quite a few opinions while researching this and think I have a good
handle on the details.

I agree that if you want high reliability then you need a properly
configured hardware watchdog.  Not everyone needs that and not everyone
bothers with a watchdog.
If you do want a watchdog, you would (obviously?) make sure to buy
hardware that supports a watchdog.
But if you choose to buy hardware that doesn't have a watchdog, then it
isn't "broken", it simply doesn't have a watchdog and so can be expected
to freeze if something particularly bad happens.

Linux could get almost arbitrarily sophisticated in ensuring that
the panic-handling code was fully robust and was stored in
write-protected memory, and so be able to reboot cleanly after any
panic.
There will, of course, be situations where it cannot recover (it might
not panic...), but the fact that it needs to reset the flash as part of
recovery shouldn't increase the set of such situations noticeably.

>
> Is that not an accurate description?
>
>> > But I don't intend to fight either of these battles.
>>=20
>> Does that mean you're accepting this change? Brian, any comment on what
>> Neil said?
>>=20
>> To be honest, I hate being in the middle of this discussion without
>> having been involved in the first decision to accept such workarounds.
>> I keep thinking that making boards that do not have reset properly
>> wired less likely to fail rebooting is a wise decision, but I also
>> agree with Brian when he says we should inform people that their design
>> is unreliable.
>> The main problem I see here, is that adding this prop won't help people
>> figuring out what is wrong with their design, it will just help them
>
> How else would we help someone figure out what's wrong with their
> design? My best attempt is to make it quite obvious, as long as they're
> using vanilla mainline: if their system hangs on reboot (without this
> property), then it's probably a bad design.

Is it really our job to help people figure out what's wrong with their
designs (unless they ask)?
I see it as our job to make Linux work reliably.
If a system hangs on reboot, but we can fix reboot so that it doesn't, I
think we should.  Clearly you disagree.

To clearly state my position:
1/ A clean reboot should reboot cleanly, resetting any hardware that
   might need resetting.
2/ an unclean reboot is never guaranteed (though "best effort" is still
   a good goal).  If you need guaranteed unclean reboots, you need a
   properly configured hardware watchdog.

My hardware doesn't have a properly configured hardware watchdog, and I
don't expect it to handle an unclean reboot.  I do expect it to handle a
clean reboot.  I'd rather not be told the hardware is "broken" because
it isn't - it simply doesn't have watchdog support (it doesn't have
hardware floating point either - that doesn't make it 'broken').

Thanks,
NeilBrown


>
> And if instead, someone stuck in this DT property already, the loud
> warning might suggest the reader look at the DT binding doc or code
> comments, where I elaborated.
>
>> workaround the problem when they find out, and it might already be to
>> late to fix the HW design. But maybe it's not what we're trying to do
>> here. Maybe we just want to warn users that rebooting such boards is a
>> risky procedure.
>
> Brian

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlthB4oACgkQOeye3VZi
gbkhnw//RnsNYOvFg454t6N8Q5imXzhj+ksU5kiED/2l8WYD6j1zkhSuOIo5zNUY
tpAAy4zkO7U7e96oSaO057D7p9qZK2CkOxs9a367aH45Z8oaE0tWVIrpJBwqmDO8
wgZ6tRC7VHv+4YFcKUyaYYNrTALDSODg2VMy439u7XWkhALT1NB6GYenjBmHI/5l
D7m3LT2cjBNdI4sH1kZGorCFfv1CDb7/NtQduTt+6lUNJIRfTHyVzISfUjQHM3Lx
juIlWIDWHRLble1A/KImMMJ0upX850SEXatQjlo3r59sBg8iWa72V3voGdTKH8Qp
9PAs/PRbFpA/P5W4oryk+o1P/7gOAFt3D9xHL3gxs5t5Y1bUPImrBI5By88CHV3P
+UVoQEf3cDO0reqFXc4sk34SL3R4ASzKCGlaX9QZ9Qd0nWTLpm+wspes5kaR5xG2
XtUzmCZNBTBEHJhDtAYmlbEjmJAecjxy2qnFeReavA7yCJTVNsw2Eoi3VmnA1jR/
JckkZ8XhH/Sa1FktNRKW2HbfLmCQ3taeKWmliGRVTAHb7aWOxPO3/xGkhpUughOk
amRnpT6QS/Irl9ICJFgZbOQzdnGTlF+IASLZRdwY16WcSnYCVhqBcqEcFcW+5xNV
or/tEgoGWtCZt2SxG+CuLTgmj/owMszawL75tkYKPp2okEUj5Vw=
=FHhr
-----END PGP SIGNATURE-----
--=-=-=--


--===============2446501229037701834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2446501229037701834==--
