From: NeilBrown <neilb@suse.com>
Subject: Re: [PATCH] mtd: spi-nor: only apply reset hacks to broken hardware
Date: Wed, 01 Aug 2018 10:38:25 +1000
Message-ID: <87pnz2rke6.fsf@notabene.neil.brown.name>
References: <20180727183313.137943-1-computersforpeace@gmail.com>
 <20180727220337.1b3375ca@bbrezillon>
 <87wotcrz94.fsf@notabene.neil.brown.name>
 <20180731221255.3e65c1fa@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6218850001645144975=="
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180731221255.3e65c1fa@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

--===============6218850001645144975==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31 2018, Boris Brezillon wrote:

> On Tue, 31 Jul 2018 11:05:11 +1000
> NeilBrown <neilb@suse.com> wrote:
>
>> On Fri, Jul 27 2018, Boris Brezillon wrote:
>>=20
>> > On Fri, 27 Jul 2018 11:33:13 -0700
>> > Brian Norris <computersforpeace@gmail.com> wrote:
>> >=20=20
>> >> Commit 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash wh=
en
>> >> exiting") is the latest from a long history of attempts to add reboot
>> >> handling to handle stateful addressing modes on SPI flash. Some prior
>> >> mostly-related discussions:
>> >>=20
>> >> http://lists.infradead.org/pipermail/linux-mtd/2013-March/046343.html
>> >> [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing commands
>> >>=20
>> >> http://lists.infradead.org/pipermail/barebox/2014-September/020682.ht=
ml
>> >> [RFC] MTD m25p80 3-byte addressing and boot problem
>> >>=20
>> >> http://lists.infradead.org/pipermail/linux-mtd/2015-February/057683.h=
tml
>> >> [PATCH 2/2] m25p80: if supported put chip to deep power down if not u=
sed
>> >>=20
>> >> Previously, attempts to add reboot-time software reset handling were
>> >> rejected, but the latest attempt was not.
>> >>=20
>> >> Quick summary of the problem:
>> >> Some systems (e.g., boot ROM or bootloader) assume that they can read
>> >> initial boot code from their SPI flash using 3-byte addressing. If the
>> >> flash is left in 4-byte mode after reset, these systems won't boot. T=
he
>> >> above patch provided a shutdown/remove hook to attempt to reset the
>> >> addressing mode before we reboot. Notably, this patch misses out on
>> >> huge classes of unexpected reboots (e.g., crashes, watchdog resets).
>> >>=20
>> >> Unfortunately, it is essentially impossible to solve this problem 100=
%:
>> >> if your system doesn't know how to reset the SPI flash to power-on
>> >> defaults at initialization time, no amount of software can really res=
cue
>> >> you -- there will always be a chance of some unexpected reset that
>> >> leaves your flash in an addressing mode that your boot sequence didn't
>> >> expect.
>> >>=20
>> >> While it is not directly harmful to perform hacks like the
>> >> aforementioned commit on all 4-byte addressing flash, a
>> >> properly-designed system should not need the hack -- and in fact,
>> >> providing this hack may mask the fact that a given system is indeed
>> >> broken. So this patch attempts to apply this unsound hack more narrow=
ly,
>> >> providing a strong suggestion to developers and system designers that
>> >> this is truly a hack. With luck, system designers can catch their err=
ors
>> >> early on in their development cycle, rather than applying this hack l=
ong
>> >> term. But apparently enough systems are out in the wild that we still
>> >> have to provide this hack.
>> >>=20
>> >> Document a new device tree property to denote systems that do not hav=
e a
>> >> proper hardware (or software) reset mechanism, and apply the hack (wi=
th
>> >> a loud warning) only in this case.
>> >>=20
>> >> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> >> ---
>> >> Note that I intentionall didn't split the documentation patch. It see=
ms
>> >> clearer to do these together IMO, but if it's *really* important to
>> >> someone...I can resend=20=20
>> >
>> > I'm fine with that.
>> >
>> > I'll leave Neil some time to review/test/comment on the patch before
>> > queuing it, but it looks good to me.=20=20
>>=20
>> Thanks.
>> I can confirm that if I apply this patch, my system won't reboot
>> properly (as expected), and if I then add
>>=20
>> 		broken-flash-reset;
>>=20
>> to the jedec,spi-nor device, it starts functioning correctly again.
>>=20
>> I don't like the pejorative "broken", and it also suggests that a thing
>> used to work, but something happened to break it - this is not
>> accurate.
>> I would prefer something like "reset-not-connected" which is an accurate
>> description of the state of the hardware.
>>=20
>> I also think that having a WARN_ON is an over-reaction.  Certainly a
>> warning could be appropriate, but just one pr_warn() should be enough.
>> The "problem" is unlikely in practice, and loudly warning people that an
>> asteroid might kill them isn't particularly helpful.
>>=20
>> I genuinely think that if the system fails to reboot, then Linux is at
>> fault. I accept that changing Linux to be completely robust might be
>> more trouble than it is worth, but I don't accept that it is impossible.
>>=20
>> But I don't intend to fight either of these battles.
>
> Does that mean you're accepting this change? Brian, any comment on what
> Neil said?

I don't see that it is my place to accept or reject the change.
I don't particularly like it, but I hope to never look at this code
against so you shouldn't put to much weight on what I like.

>
> To be honest, I hate being in the middle of this discussion without
> having been involved in the first decision to accept such workarounds.
> I keep thinking that making boards that do not have reset properly
> wired less likely to fail rebooting is a wise decision, but I also
> agree with Brian when he says we should inform people that their design
> is unreliable.
> The main problem I see here, is that adding this prop won't help people
> figuring out what is wrong with their design, it will just help them
> workaround the problem when they find out, and it might already be to
> late to fix the HW design. But maybe it's not what we're trying to do
> here. Maybe we just want to warn users that rebooting such boards is a
> risky procedure.

Simply rebooting the board is not a risky procedure.
The risk is that if something causes Linux to "crash", it may not reboot
properly.

Thanks,
NeilBrown

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlthAQEACgkQOeye3VZi
gbnwWg/8DOKr53azcf+pQsDnM2UWUdT6TiCAktJpVi+gCqgxDGo3wZuR6Q7fs1or
lxvUS9CT4t+7y9kqqMsp5tWjsCS9INY0ChXsO20TuYBqtCQhPldXYJRixjXDziXg
x98SPqEwtxtseiduElJLh4hBK+nlCD1qmR8mOlHE6bYkuBXAlxlYd+9k2f0XUZHr
072h2j3+Rk5RAc/ojc31LHnZIdnDqpc6/jwh1cm2OXbbQVednN8wJRfC/c+8ckrn
Fkik8HvU8pCqG8Aqlr/bT95yWIBszLmcnjSNLHZ2iiVCoxqZQMBfVi37gTSip2ab
pAU1Dqok1kpBl0N/LbfqNg/CmK8KyQ+0cwXB7GGQGnTje5tWIOGEJaVNwDPxrQfj
q7cX0S98+0fnnM39tO7lugu4VFTJaMejVQAXHVJxjqSAd8DI8czAVOVSF7h1Rgjj
tavTUo+QJfttZucVIrBB2iedTsFSxCdF0GVM/fazVvIe+qQ73AxX6gW9LsTUUgKF
ICA3GrIS0DjE22zaOIORxpKG97DxKlmRsnJViwaPKRQYEScnhHg3kjQPtf1RcAoT
440wuDboPVUC35dUR+xmtrvDpZDpOAOS/6/MkjnlwBKUmzGHZXFo69R1txgSuA0m
Jh/8Aa5cVVtwuWFtFU9L3+8dmIr2dLei7hckXd6Trn6iCn1TVFs=
=ZeIO
-----END PGP SIGNATURE-----
--=-=-=--


--===============6218850001645144975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6218850001645144975==--
