From: Ezaul Zillmer <ezaulzillmer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 2/2] mtd: nand: add sunxi NFC dt bindings doc
Date: Tue, 21 Oct 2014 08:46:37 -0700 (PDT)
Message-ID: <728f7a6f-a6bc-4375-bfd2-dbe64dadc9b1@googlegroups.com>
References: <1413805520-14947-1-git-send-email-boris.brezillon@free-electrons.com>
 <1413805520-14947-3-git-send-email-boris.brezillon@free-electrons.com>
 <20141021024134.GC1193@ld-irv-0074>
 <20141021145344.575b19e6@bbrezillon>
 <62d54110-9c7f-4342-9201-a1ae23194620@googlegroups.com>
 <20141021155841.180861d0@bbrezillon>
 <89bb5f8e-2fb0-4012-a8b2-fdd618da8f11@googlegroups.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_236_391242188.1413906397245"
Return-path: <linux-sunxi+bncBD2ILSOUX4CBBXP7TGRAKGQEG4ZNUDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <89bb5f8e-2fb0-4012-a8b2-fdd618da8f11-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: ezaulzillmer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yassinjaffer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_236_391242188.1413906397245
Content-Type: multipart/alternative;
	boundary="----=_Part_237_12526602.1413906397245"

------=_Part_237_12526602.1413906397245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I found this information more=20

View Picture



Em ter=C3=A7a-feira, 21 de outubro de 2014 13h03min57s UTC-2, Ezaul Zillmer=
=20
escreveu:
>
> results=20
> {"K9GBG08U0A 32G 3.3V 8-bit",
> { .id =3D {0xec, 0xd7, 0x94, 0x7a, 0x54, 0x43} },
>   SZ_8K, SZ_4K, SZ_1M, 0, 6, 640, NAND_ECC_INFO(24, SZ_1K) },
>
>
> Start this in the attached image
> ..................................................................
>
> [   20.127045] Bad eraseblock 2900 at 0x0000b54fe000
> [   20.134025] Bad eraseblock 2901 at 0x0000b55fe000
> [   20.140993] Bad eraseblock 2902 at 0x0000b56fe000
> [   20.147973] Bad eraseblock 2903 at 0x0000b57fe000
> [   20.154952] Bad eraseblock 2904 at 0x0000b58fe000
> [   20.161932] Bad eraseblock 2905 at 0x0000b59fe000
> [   20.168900] Bad eraseblock 2906 at 0x0000b5afe000
> [   20.175878] Bad eraseblock 2907 at 0x0000b5bfe000
> [   20.182861] Bad eraseblock 2908 at 0x0000b5cfe000
> [   20.189828] Bad eraseblock 2909 at 0x0000b5dfe000
> [   20.196810] Bad eraseblock 2910 at 0x0000b5efe000
> [   20.203790] Bad eraseblock 2911 at 0x0000b5ffe000
> [   20.210758] Bad eraseblock 2912 at 0x0000b60fe000
> [   20.217742] Bad eraseblock 2913 at 0x0000b61fe000
> [   20.224723] Bad eraseblock 2914 at 0x0000b62fe000
> [   20.231702] Bad eraseblock 2915 at 0x0000b63fe000
> [   20.238669] Bad eraseblock 2916 at 0x0000b64fe000
> [   20.245649] Bad eraseblock 2917 at 0x0000b65fe000
> [   20.252618] Bad eraseblock 2918 at 0x0000b66fe000
> [   20.259585] Bad eraseblock 2919 at 0x0000b67fe000
> [   20.266565] Bad eraseblock 2920 at 0x0000b68fe000
> [   20.273546] Bad eraseblock 2921 at 0x0000b69fe000
> [   20.280512] Bad eraseblock 2922 at 0x0000b6afe000
> [   20.287490] Bad eraseblock 2923 at 0x0000b6bfe000
> [   20.294468] Bad eraseblock 2924 at 0x0000b6cfe000
> [   20.301437] Bad eraseblock 2925 at 0x0000b6dfe000
> [   20.312741] Bad eraseblock 2928 at 0x000. ok
>
>
> I thought this docs of this samsung nand "K9GBG08U0A" that talves be=20
> useful since you have more knowledge about it! so I can help you make the=
=20
> tests of your support in nand cubieboard2.=20
>
> I am available.=20
> I thank you!
>
> Link dos Docs=20
>
> https://www.google.com.br/url?sa=3Dt&rct=3Dj&q=3D&esrc=3Ds&source=3Dweb&c=
d=3D1&ved=3D0CCYQFjAA&url=3Dhttp%3A%2F%2Fe2e.ti.com%2Fcfs-file.ashx%2F__key=
%2FCommunityServer-Discussions-Components-Files%2F100%2F8055.K9GBG08UXA_5F0=
0_1.0.pdf&ei=3D2G9GVND2D8voggTotYCwDw&usg=3DAFQjCNGbGKL10ZePo2SUeyAcdVBmK9U=
4xA&bvm=3Dbv.77880786,d.eXY&cad=3Drja
>
>
> Spare Blocks Arrangement
> The device has 56 spare blocks to increase valid blocks. Extended blocks=
=20
> can be accessed by the following address.
>
> Block 0
> Block 1
> Block 2
> Block 3
> Block 4
> Block 5
> =E3=86=8D=E3=86=8D=E3=86=8D
> Block 4094
> Block 4095
> Block 4096
> Block 4097
> =E3=86=8D=E3=86=8D=E3=86=8D
> Block 4150
> Block 4151
> Page Address
> (Hexadecimal)
> 00000h
> 00080h
> 00100h
> 00180h
> 00200h
> 00280h
> 7FF00h
> 80000h
> Main Blocks
> (4096 Blocks)
> Extended Blocks
> (56 Blocks)
> 7FF80h
> 80080h
> 81B00h
> 81B80h
>
>
> Em ter=C3=A7a-feira, 21 de outubro de 2014 11h58min48s UTC-2, Boris Brezi=
llon=20
> escreveu:
>>
>> On Tue, 21 Oct 2014 06:13:16 -0700 (PDT)=20
>> Ezaul Zillmer <ezaulz...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:=20
>>
>> > Hello everyone=20
>> >=20
>> > Boris Brezillon=20
>> >=20
>> > downloaded sunxi-nand-v6 now compiled for Cubieboard2=20
>> > https://github.com/bbrezillon/linux-sunxi.git sunxi b-nand-v6=20
>> >=20
>> > u-boot=20
>> > git clone https://github.com/jwrdegoede/u-boot-b sunxi.git sunxi-wip=
=20
>> >=20
>> >=20
>> > [1.143903] nand: Could not find valid JEDEC parameter page; aborting=
=20
>> > [1.150369] nand: device found, Manufacturer ID: 0xec, Chip ID: 0xd7=20
>> > [1.156766] nand: Samsung NAND 4GiB 3.3V 8-bit=20
>> > [1.161214] nand: 4096MiB, MLC, page size: 8192, OOB size: 640=20
>> > [1.167167] sunxi_nand 1c03000.nand: ECC init failed: -22=20
>> > [1.172588] sunxi_nand 1c03000.nand: failed to init nand chips=20
>> > [1.178502] sunxi_nand: probe of 1c03000.nand failed with error -22=20
>> >=20
>> > need some more data?=20
>> >=20
>>
>> Can you try to apply this patch [1] ?=20
>>
>> [1]http://code.bulix.org/26bi35-87234=20
>>
>>
>>
>> --=20
>> Boris Brezillon, Free Electrons=20
>> Embedded Linux and Kernel engineering=20
>> http://free-electrons.com=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_237_12526602.1413906397245
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I found this information more&nbsp;</div><div><b=
r></div><div>View Picture</div><div><br></div><div><br><br>Em ter=C3=A7a-fe=
ira, 21 de outubro de 2014 13h03min57s UTC-2, Ezaul Zillmer  escreveu:<bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-l=
eft: 1px #ccc solid;padding-left: 1ex;"><div dir=3D"ltr"><div><div>results&=
nbsp;</div><div><div><span style=3D"white-space:pre">	</span>{"K9GBG08U0A 3=
2G 3.3V 8-bit",</div><div><span style=3D"white-space:pre">		</span>{ .id =
=3D {0xec, 0xd7, 0x94, 0x7a, 0x54, 0x43} },</div><div><span style=3D"white-=
space:pre">		</span> &nbsp;SZ_8K, SZ_4K, SZ_1M, 0, 6, 640, NAND_ECC_INFO(24=
, SZ_1K) },</div></div><div><br></div><div><br></div><div>Start this in the=
 attached image<br></div><div>..............................<wbr>..........=
....................<wbr>......</div><div><br></div><div>[ &nbsp; 20.127045=
] Bad eraseblock 2900 at 0x0000b54fe000</div><div>[ &nbsp; 20.134025] Bad e=
raseblock 2901 at 0x0000b55fe000</div><div>[ &nbsp; 20.140993] Bad eraseblo=
ck 2902 at 0x0000b56fe000</div><div>[ &nbsp; 20.147973] Bad eraseblock 2903=
 at 0x0000b57fe000</div><div>[ &nbsp; 20.154952] Bad eraseblock 2904 at 0x0=
000b58fe000</div><div>[ &nbsp; 20.161932] Bad eraseblock 2905 at 0x0000b59f=
e000</div><div>[ &nbsp; 20.168900] Bad eraseblock 2906 at 0x0000b5afe000</d=
iv><div>[ &nbsp; 20.175878] Bad eraseblock 2907 at 0x0000b5bfe000</div><div=
>[ &nbsp; 20.182861] Bad eraseblock 2908 at 0x0000b5cfe000</div><div>[ &nbs=
p; 20.189828] Bad eraseblock 2909 at 0x0000b5dfe000</div><div>[ &nbsp; 20.1=
96810] Bad eraseblock 2910 at 0x0000b5efe000</div><div>[ &nbsp; 20.203790] =
Bad eraseblock 2911 at 0x0000b5ffe000</div><div>[ &nbsp; 20.210758] Bad era=
seblock 2912 at 0x0000b60fe000</div><div>[ &nbsp; 20.217742] Bad eraseblock=
 2913 at 0x0000b61fe000</div><div>[ &nbsp; 20.224723] Bad eraseblock 2914 a=
t 0x0000b62fe000</div><div>[ &nbsp; 20.231702] Bad eraseblock 2915 at 0x000=
0b63fe000</div><div>[ &nbsp; 20.238669] Bad eraseblock 2916 at 0x0000b64fe0=
00</div><div>[ &nbsp; 20.245649] Bad eraseblock 2917 at 0x0000b65fe000</div=
><div>[ &nbsp; 20.252618] Bad eraseblock 2918 at 0x0000b66fe000</div><div>[=
 &nbsp; 20.259585] Bad eraseblock 2919 at 0x0000b67fe000</div><div>[ &nbsp;=
 20.266565] Bad eraseblock 2920 at 0x0000b68fe000</div><div>[ &nbsp; 20.273=
546] Bad eraseblock 2921 at 0x0000b69fe000</div><div>[ &nbsp; 20.280512] Ba=
d eraseblock 2922 at 0x0000b6afe000</div><div>[ &nbsp; 20.287490] Bad erase=
block 2923 at 0x0000b6bfe000</div><div>[ &nbsp; 20.294468] Bad eraseblock 2=
924 at 0x0000b6cfe000</div><div>[ &nbsp; 20.301437] Bad eraseblock 2925 at =
0x0000b6dfe000</div><div>[ &nbsp; 20.312741] Bad eraseblock 2928 at 0x000. =
ok</div></div><div><br></div><div><br></div><div><div>I thought this docs o=
f this samsung nand "K9GBG08U0A" that talves be useful since you have more =
knowledge about it! so I can help you make the tests of your support in nan=
d cubieboard2.&nbsp;</div><div><br></div><div>I am available.&nbsp;</div><d=
iv>I thank you!</div></div><div><br></div><div>Link dos Docs&nbsp;</div><di=
v><a href=3D"https://www.google.com.br/url?sa=3Dt&amp;rct=3Dj&amp;q=3D&amp;=
esrc=3Ds&amp;source=3Dweb&amp;cd=3D1&amp;ved=3D0CCYQFjAA&amp;url=3Dhttp%3A%=
2F%2Fe2e.ti.com%2Fcfs-file.ashx%2F__key%2FCommunityServer-Discussions-Compo=
nents-Files%2F100%2F8055.K9GBG08UXA_5F00_1.0.pdf&amp;ei=3D2G9GVND2D8voggTot=
YCwDw&amp;usg=3DAFQjCNGbGKL10ZePo2SUeyAcdVBmK9U4xA&amp;bvm=3Dbv.77880786,d.=
eXY&amp;cad=3Drja" target=3D"_blank" onmousedown=3D"this.href=3D'https://ww=
w.google.com.br/url?sa\75t\46rct\75j\46q\75\46esrc\75s\46source\75web\46cd\=
0751\46ved\0750CCYQFjAA\46url\75http%3A%2F%2Fe2e.ti.com%2Fcfs-file.ashx%2F_=
_key%2FCommunityServer-Discussions-Components-Files%2F100%2F8055.K9GBG08UXA=
_5F00_1.0.pdf\46ei\0752G9GVND2D8voggTotYCwDw\46usg\75AFQjCNGbGKL10ZePo2SUey=
AcdVBmK9U4xA\46bvm\75bv.77880786,d.eXY\46cad\75rja';return true;" onclick=
=3D"this.href=3D'https://www.google.com.br/url?sa\75t\46rct\75j\46q\75\46es=
rc\75s\46source\75web\46cd\0751\46ved\0750CCYQFjAA\46url\75http%3A%2F%2Fe2e=
.ti.com%2Fcfs-file.ashx%2F__key%2FCommunityServer-Discussions-Components-Fi=
les%2F100%2F8055.K9GBG08UXA_5F00_1.0.pdf\46ei\0752G9GVND2D8voggTotYCwDw\46u=
sg\75AFQjCNGbGKL10ZePo2SUeyAcdVBmK9U4xA\46bvm\75bv.77880786,d.eXY\46cad\75r=
ja';return true;">https://www.google.com.br/url?<wbr>sa=3Dt&amp;rct=3Dj&amp=
;q=3D&amp;esrc=3Ds&amp;source=3D<wbr>web&amp;cd=3D1&amp;ved=3D0CCYQFjAA&amp=
;url=3D<wbr>http%3A%2F%2Fe2e.ti.com%2Fcfs-<wbr>file.ashx%2F__key%<wbr>2FCom=
munityServer-Discussions-<wbr>Components-Files%2F100%2F8055.<wbr>K9GBG08UXA=
_5F00_1.0.pdf&amp;ei=3D<wbr>2G9GVND2D8voggTotYCwDw&amp;usg=3D<wbr>AFQjCNGbG=
KL10ZePo2SUeyAcdVBmK9<wbr>U4xA&amp;bvm=3Dbv.77880786,d.eXY&amp;<wbr>cad=3Dr=
ja</a><br></div><div><br></div><div><br></div><div><div>Spare Blocks Arrang=
ement</div><div>The device has 56 spare blocks to increase valid blocks. Ex=
tended blocks can be accessed by the following address.</div><div><br></div=
><div>Block 0</div><div>Block 1</div><div>Block 2</div><div>Block 3</div><d=
iv>Block 4</div><div>Block 5</div><div>=E3=86=8D=E3=86=8D=E3=86=8D</div><di=
v>Block 4094</div><div>Block 4095</div><div>Block 4096</div><div>Block 4097=
</div><div>=E3=86=8D=E3=86=8D=E3=86=8D</div><div>Block 4150</div><div>Block=
 4151</div><div>Page Address</div><div>(Hexadecimal)</div><div>00000h</div>=
<div>00080h</div><div>00100h</div><div>00180h</div><div>00200h</div><div>00=
280h</div><div>7FF00h</div><div>80000h</div><div>Main Blocks</div><div>(409=
6 Blocks)</div><div>Extended Blocks</div><div>(56 Blocks)</div><div>7FF80h<=
/div><div>80080h</div><div>81B00h</div><div>81B80h</div></div><div><br></di=
v><div><br></div>Em ter=C3=A7a-feira, 21 de outubro de 2014 11h58min48s UTC=
-2, Boris Brezillon  escreveu:<blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0;margin-left:0.8ex;border-left:1px #ccc solid;padding-left:1ex">On Tu=
e, 21 Oct 2014 06:13:16 -0700 (PDT)
<br>Ezaul Zillmer &lt;<a>ezaulz...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:
<br>
<br>&gt; Hello everyone=20
<br>&gt;=20
<br>&gt; Boris Brezillon=20
<br>&gt;=20
<br>&gt; downloaded sunxi-nand-v6 now compiled for Cubieboard2=20
<br>&gt; <a href=3D"https://github.com/bbrezillon/linux-sunxi.git" target=
=3D"_blank" onmousedown=3D"this.href=3D'https://www.google.com/url?q\75http=
s%3A%2F%2Fgithub.com%2Fbbrezillon%2Flinux-sunxi.git\46sa\75D\46sntz\0751\46=
usg\75AFQjCNE7U8Oe687VzAFQxW1NRxjRyZbzsA';return true;" onclick=3D"this.hre=
f=3D'https://www.google.com/url?q\75https%3A%2F%2Fgithub.com%2Fbbrezillon%2=
Flinux-sunxi.git\46sa\75D\46sntz\0751\46usg\75AFQjCNE7U8Oe687VzAFQxW1NRxjRy=
ZbzsA';return true;">https://github.com/bbrezillon/<wbr>linux-sunxi.git</a>=
 sunxi b-nand-v6=20
<br>&gt;=20
<br>&gt; u-boot=20
<br>&gt; git clone <a href=3D"https://github.com/jwrdegoede/u-boot-b" targe=
t=3D"_blank" onmousedown=3D"this.href=3D'https://www.google.com/url?q\75htt=
ps%3A%2F%2Fgithub.com%2Fjwrdegoede%2Fu-boot-b\46sa\75D\46sntz\0751\46usg\75=
AFQjCNGTN15JwUwNT2KMb7yHqW26k238qw';return true;" onclick=3D"this.href=3D'h=
ttps://www.google.com/url?q\75https%3A%2F%2Fgithub.com%2Fjwrdegoede%2Fu-boo=
t-b\46sa\75D\46sntz\0751\46usg\75AFQjCNGTN15JwUwNT2KMb7yHqW26k238qw';return=
 true;">https://github.com/jwrdegoede/<wbr>u-boot-b</a> sunxi.git sunxi-wip=
=20
<br>&gt;=20
<br>&gt;=20
<br>&gt; [1.143903] nand: Could not find valid JEDEC parameter page; aborti=
ng=20
<br>&gt; [1.150369] nand: device found, Manufacturer ID: 0xec, Chip ID: 0xd=
7=20
<br>&gt; [1.156766] nand: Samsung NAND 4GiB 3.3V 8-bit=20
<br>&gt; [1.161214] nand: 4096MiB, MLC, page size: 8192, OOB size: 640=20
<br>&gt; [1.167167] sunxi_nand 1c03000.nand: ECC init failed: -22=20
<br>&gt; [1.172588] sunxi_nand 1c03000.nand: failed to init nand chips=20
<br>&gt; [1.178502] sunxi_nand: probe of 1c03000.nand failed with error -22=
=20
<br>&gt;=20
<br>&gt; need some more data?
<br>&gt;=20
<br>
<br>Can you try to apply this patch [1] ?
<br>
<br>[1]<a href=3D"http://code.bulix.org/26bi35-87234" target=3D"_blank" onm=
ousedown=3D"this.href=3D'http://www.google.com/url?q\75http%3A%2F%2Fcode.bu=
lix.org%2F26bi35-87234\46sa\75D\46sntz\0751\46usg\75AFQjCNHumxY_BVcyMW55CuR=
HNBzZjMrypQ';return true;" onclick=3D"this.href=3D'http://www.google.com/ur=
l?q\75http%3A%2F%2Fcode.bulix.org%2F26bi35-87234\46sa\75D\46sntz\0751\46usg=
\75AFQjCNHumxY_BVcyMW55CuRHNBzZjMrypQ';return true;">http://code.bulix.org/=
<wbr>26bi35-87234</a>
<br>
<br>
<br>
<br>--=20
<br>Boris Brezillon, Free Electrons
<br>Embedded Linux and Kernel engineering
<br><a href=3D"http://free-electrons.com" target=3D"_blank" onmousedown=3D"=
this.href=3D'http://www.google.com/url?q\75http%3A%2F%2Ffree-electrons.com\=
46sa\75D\46sntz\0751\46usg\75AFQjCNGC8C9pT7xKJEabITLGL5cqtolifQ';return tru=
e;" onclick=3D"this.href=3D'http://www.google.com/url?q\75http%3A%2F%2Ffree=
-electrons.com\46sa\75D\46sntz\0751\46usg\75AFQjCNGC8C9pT7xKJEabITLGL5cqtol=
ifQ';return true;">http://free-electrons.com</a>
<br></blockquote></div></blockquote></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_237_12526602.1413906397245--

------=_Part_236_391242188.1413906397245
Content-Type: image/jpeg; name=K9GBG08U0A-INFO.jpg
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=K9GBG08U0A-INFO.jpg
X-Attachment-Id: 94921245-058d-45dd-b17f-78ac085ba157
Content-ID: <94921245-058d-45dd-b17f-78ac085ba157>

/9j/4AAQSkZJRgABAgAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0a
HBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIy
MjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAByB0IDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDT0mDX
5dG0918RlVe1jYD+z422/KOM7ufTNXPsviD/AKGb/wApsX/xVSaGB/wjul4AGbOLp/uitCvdp004
o7FHRGX9l8Q/9DMP/BbF/wDFUfZfEP8A0Mw/8FsX/wAVWpRV+yiPkMv7L4h/6GYf+C2L/wCKo+y+
If8AoZh/4LIv/iq1KMUeyiHIjL+y+If+hlH/AILYv/iqPsviH/oZh/4LYv8A4qtTHtR+VHsohyGX
9l8Q/wDQyj/wWxf/ABVH2XxD/wBDL/5TYv8A4qtTiij2cQ5DL+y+If8AoZh/4LYv/iqPsviH/oZh
/wCC2L/4qtSij2UQ5EZf2XxD/wBDMP8AwWxf/FUfZfEP/QzD/wAFsX/xValGKPZRDkRl/ZfEOP8A
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
------=_Part_236_391242188.1413906397245--
