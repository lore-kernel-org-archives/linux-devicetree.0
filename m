From: Benoit Masson <benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/8] Armada XP pinctrl consolidation and ix4-300d fixes
Date: Wed, 15 Oct 2014 02:53:02 +0200
Message-ID: <CE7A9795-C2AF-451A-8018-3A0B8788BF60@perenite.com>
References: <1411157684-6991-1-git-send-email-sebastian.hesselbarth@gmail.com> <-7443282711873112734@unknownmsgid> <20141003141102.GJ3895@titan.lakedaemon.net> <542EBB93.108@gmail.com> <A9781A2E-F3CA-4E8A-833C-D167B456D9F7@perenite.com> <542EC3A3.1060605@gmail.com> <1ACB5318-863E-40D8-8B27-41F1C0D0A4B8@perenite.com> <5432BFB1.2060300@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5432BFB1.2060300-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Le 6 oct. 2014 =E0 18:13, Sebastian Hesselbarth <sebastian.hesselbarth@=
gmail.com> a =E9crit :

> On 10/06/2014 01:11 AM, Benoit Masson wrote:
>> Le 3 oct. 2014 =E0 17:41, Sebastian Hesselbarth <sebastian.hesselbar=
th-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =E9crit :
>>> On 10/03/2014 05:29 PM, Benoit Masson wrote:
>>>> Le 3 oct. 2014 =E0 17:06, Sebastian Hesselbarth <sebastian.hesselb=
arth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =E9crit :
>>>>> On 10/03/2014 04:11 PM, Jason Cooper wrote:
>>>>>> On Sun, Sep 21, 2014 at 04:11:23PM +0200, Benoit Masson wrote:
>>>>>>>> Le 19 sept. 2014 =E0 22:14, Sebastian Hesselbarth <sebastian.h=
esselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =E9crit :
>>> [...]
>>>>>>>> Patches are based on v3.17-rc1 and intended for v3.18 but I am=
 not in
>>>>>>>> a hurry. I only compile tested this, so a formal Tested-by fro=
m Benoit
>>>>>>>> for the ix4 and any other Armada XP board would be great.
>>>>>>>=20
>>>>>>> I'm not sure what to test since I only receive some patch from =
the
>>>>>>> series of 8. Should I get all 8 or only those you sent me. I'll=
 be
>>>>>>> able to test during next week.
>>>>>>=20
>>>>>> Did you ever get a chance to test this series?
>>>>>=20
>>>>> Uhm, I never prepared a branch for Benoit to test. I have pushed =
the
>>>>> patches with Thomas Acked-by's and renamed eeprom node based on
>>>>> v3.17-rc1 to
>>>>>=20
>>>>> https://github.com/shesselba/linux-dove.git devel/mvebu-ix4
>>>>>=20
>>> [...]
>> Maybe I missed something ? is this branch you sent me a bare fork
>> from mainline 3.17 ? does it includes the armada XP step A0 patch ?
>=20
> Benoit,
>=20
Hi,
> I prepared more branches with the series
> - on top of v3.17 release:
> https://github.com/shesselba/linux-dove.git devel/mvebu-ix4_v3.17
>=20
> - on top of next-20141003 (i.e. what will become v3.18-rc1):
> https://github.com/shesselba/linux-dove.git devel/mvebu-ix4_next-2014=
1003
>=20
> It would be great, if you can test in this order:
> - vanilla v3.17
> - mvebu-ix4_v3.17
> - mvebu-ix4_next-20141003
>=20
All the 3 branch works WHEN APPLYING A0 patch (below), with both my cus=
tom kernel config and the arch/arm/configs/mvebu_v7_defconfig

The reason why it didn't worked last time was that apparently the A0 pa=
tch (copied) below was not merged into 3.17 :(

This means that ix4-300d support is broken on 3.17 because of the A0 st=
epping patch not merged.

patch (from Andrew Lunn Acked-by Gregory Clement is missing:

---
 arch/arm/mach-mvebu/board-v7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-mvebu/board-v7.c b/arch/arm/mach-mvebu/board=
-v7.c
index b2524d6..b1e148d 100644
--- a/arch/arm/mach-mvebu/board-v7.c
+++ b/arch/arm/mach-mvebu/board-v7.c
@@ -174,7 +174,7 @@ static void __init thermal_quirk(void)
=20
 static void __init mvebu_dt_init(void)
 {
-	if (of_machine_is_compatible("plathome,openblocks-ax3-4"))
+	if (of_machine_is_compatible("marvell,armadaxp"))
 		i2c_quirk();
 	if (of_machine_is_compatible("marvell,a375-db")) {
 		external_abort_quirk();
--=20
1.9.1
> If any branch fails, you can stop and please report back.
>=20
> I also have the ix4 but I need more time for a full setup like you
> already seem to have ready. Again, there is no hurry, take your time.
>=20
> Thanks!
>=20
> Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
