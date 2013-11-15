From: Olof Kindgren <olof.kindgren@gmail.com>
Subject: Re: [PATCH] openrisc: Add DTS and defconfig for DE0-Nano
Date: Fri, 15 Nov 2013 12:39:05 +0100
Message-ID: <CAKaYPCNqzYcSyTUjjb9H3naErjzqjLDBthE2xfQ98j-YOzQWwg@mail.gmail.com>
References: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
	<5285EE5A.1070202@southpole.se>
	<CAMuHMdWA-9ax=NG_d0tyfzY3+42Ka7_r+jTeF-m5oW0eV8t1=g@mail.gmail.com>
	<5285FE1D.3020800@southpole.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2806180033323348029=="
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <5285FE1D.3020800@southpole.se>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Jonas Bonn <jonas@southpole.se>
Cc: Kevin Mehall <contact@kevinmehall.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux <linux@lists.openrisc.net>
List-Id: devicetree@vger.kernel.org

--===============2806180033323348029==
Content-Type: multipart/alternative; boundary=f46d043c7f544a1ffa04eb35a532

--f46d043c7f544a1ffa04eb35a532
Content-Type: text/plain; charset=ISO-8859-1

2013/11/15 Jonas Bonn <jonas@southpole.se>

> On 11/15/2013 11:22 AM, Geert Uytterhoeven wrote:
>
>> This should probably be "altera,de0_nano".  We also need to put a version
>>>
>>
>> "terasic,de0_nano"? The board says "Designed and manufactured by Terasic".
>> Hmm, the sticker on the box says "Altera DE0-Nano".
>>
>
> Good question...
>
>
>
terasic makes more sense than Altera. Altera just provides one of the
components on the board


>
>>> Version number needed.  OpenCores wanted "projectname-rtlsvn###" where
>>> ###
>>> is the SVN commit number of the RTL directory in the project's source
>>> repository.
>>>
>>
>> That's gonna need some information diving, as Stefan's orpsoc git
>> repositories
>> only contains references to orpsocv2 git-svn-ids, not the svn ids of
>> the original
>> component repositories.
>>
>
> Stefan?  Where's the "official" home of these cores nowadays?  Have they
> been modified since they were copied from OpenCores into orpsocv2?
>
>
Most cores are fetched directly from OpenCores SVN. Out of these, some are
patched on the fly by ORPSoC before they are being built. Most of the new
cores are only available on github

More generally, can Linux use out-of-tree DTS files in an easy way? It's
handy to have them in the kernel, but the best fit might actually be to put
them in the corresponding orpsocv3 system directory. That would also make
it easier to have separate device trees for differently configured FPGAs
(they are reprogrammable after all).


//Olof

--f46d043c7f544a1ffa04eb35a532
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2013/11/15 Jonas Bonn <span dir=3D"ltr">&lt;<a href=3D"mailto:jonas=
@southpole.se" target=3D"_blank">jonas@southpole.se</a>&gt;</span><br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<div class=3D"im">On 11/15/2013 11:22 AM, Geert Uytterhoeven wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">

This should probably be &quot;altera,de0_nano&quot;. =A0We also need to put=
 a version<br>
</blockquote>
<br>
&quot;terasic,de0_nano&quot;? The board says &quot;Designed and manufacture=
d by Terasic&quot;.<br>
Hmm, the sticker on the box says &quot;Altera DE0-Nano&quot;.<br>
</blockquote>
<br></div>
Good question...<div class=3D"im"><br>
<br></div></blockquote><div><br>terasic makes more sense than Altera. Alter=
a just provides one of the components on the board<br>=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<div class=3D"im">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">

<br>
Version number needed. =A0OpenCores wanted &quot;projectname-rtlsvn###&quot=
; where ###<br>
is the SVN commit number of the RTL directory in the project&#39;s source<b=
r>
repository.<br>
</blockquote>
<br>
That&#39;s gonna need some information diving, as Stefan&#39;s orpsoc git r=
epositories<br>
only contains references to orpsocv2 git-svn-ids, not the svn ids of<br>
the original<br>
component repositories.<br>
</blockquote>
<br></div>
Stefan? =A0Where&#39;s the &quot;official&quot; home of these cores nowaday=
s? =A0Have they been modified since they were copied from OpenCores into or=
psocv2?<div class=3D"im"><br></div></blockquote><div><br></div><div>Most co=
res are fetched directly from OpenCores SVN. Out of these, some are patched=
 on the fly by ORPSoC before they are being built. Most of the new cores ar=
e only available on github<br>
</div></div><br></div><div class=3D"gmail_extra">More generally, can Linux =
use out-of-tree DTS files in an easy way? It&#39;s handy to=20
have them in the kernel, but the best fit might actually be to put them=20
in the corresponding orpsocv3 system directory. That would also make it=20
easier to have separate device trees for differently configured FPGAs=20
(they are reprogrammable after all).<br><div><br></div><br></div><div class=
=3D"gmail_extra">//Olof<br></div></div>

--f46d043c7f544a1ffa04eb35a532--

--===============2806180033323348029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2806180033323348029==--
