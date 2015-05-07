From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: m25p80: remove unused flash entries from id_table
Date: Thu, 7 May 2015 15:49:46 -0700
Message-ID: <20150507224946.GS32500@ld-irv-0074>
References: <1428395981-21012-1-git-send-email-zajec5@gmail.com>
 <20150407175406.GK32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150407175406.GK32500@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 07, 2015 at 10:54:06AM -0700, Brian Norris wrote:
> + a few others, some who have had trouble with DT on this driver
>=20
> On Tue, Apr 07, 2015 at 10:39:41AM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
> > We had many entries that were recently added just to allow selectin=
g
> > some flashes directly but were never used. They weren't providing a=
ny
> > special flash handling, we just needed them due to the lack of some
> > generic binding string.
> >=20
> > With the introduction of "nor-jedec" (in 1103b85) they won't be nee=
ded
> > unless we discover some faulty flash requiring workarounds.
> > As explained in m25p80 DT documentation we require specifying
> > "nor-jedec" now as less specific compatible entry.
> >=20
> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> > To verify list of removed entries by yourself:
> > egrep -R "at25fs010|at25fs040|at25df041a|at26f004|at26df161a|at26df=
321|at45db081d" ./
> > egrep -R "en25f32|en25p32|en25q32b|en25p64|en25q64|en25qh128|en25qh=
256" ./
> > egrep -R "f25l32pa" ./
> > egrep -R "mr25h10" ./
> > egrep -R "gd25q32|gd25q64" ./
> > egrep -R "160s33b|320s33b|640s33b" ./
> > egrep -R "mx25l2005a|mx25l8005|mx25l3205d|mx25l3255e|mx25l12855e|mx=
25l25655e|mx66l1g55g" ./
> > egrep -R "n25q256a|n25q512ax3|n25q00" ./
> > egrep -R "pm25lv512|pm25lv010|pm25lq032" ./
> > egrep -R "s25sl032p|s25sl064p|s25fl256s0|s70fl01gs|s25sl12800|s25fl=
129p0|s25fl129p1|s25sl004a|s25sl008a|s25sl016a|s25sl032a|s25fl016k|s25f=
l132k" ./
> > egrep -R "sst25vf080b|sst25vf064c|sst25wf512|sst25wf010|sst25wf020"=
 ./*
> > egrep -R "m25p05|m25p20|n25q032|m25pe20|m25pe80|m25pe16|m25px16|m25=
px32|m25px32-s0|m25px32-s1|m25px80" ./
> > egrep -R "m45pe10|m45pe80|m45pe16" ./
> > egrep -R "w25x10|w25x20|w25x40|w25x64|w25q64|w25q80" ./
> > egrep -R "cat25c11|cat25c03|cat25c09|cat25c17|cat25128" ./
>=20
> The thing is, the kernel tree is not necessarily the definitive sourc=
e
> for device tree files. Just because no one's using these in the kerne=
l
> DTS (or board) files doesn't mean no one can. People can maintain
> out-of-tree DTS files, and even bake them into their firmware, as lon=
g
> as they use the standard bindings. That's kinda why DT becomes ABI...
>=20
> That said, I don't expect most people using this could expect that ki=
nd
> of stability with the current situation (and that's why we'd like to
> improve it). And I think the Debian folks who tripped over the m25p80
> bindings were using the kernel-provided device trees. So I might be O=
K
> with this. I'd like to see if anyone else has comment to the contrary=
,
> though.

No objections, so pushed to l2-mtd.git. Thanks.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
