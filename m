From: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Tue, 10 May 2016 14:22:51 -0700 (PDT)
Message-ID: <f959ee5c-fa63-48f6-9819-4822c055b928@googlegroups.com>
References: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
 <CAGb2v66E2TuN3+tYaAbniV3q67waDZOfqKAW14VJz6xZFomZ=Q@mail.gmail.com>
 <57285162.2000704@schinagl.nl>
 <CAGb2v66r9m7qVW6BszeT2wqs0KyEr4x5ivTJYqu2Fes=R9-Ltw@mail.gmail.com>
 <CANCTEQgjiuQXcaw=3Dr5kUsTPc3nsDQf2odwzs4nHvrkREAqrg@mail.gmail.com>
 <5729F07C.3080308@schinagl.nl>
 <948be370-4401-43cb-862e-d4376755a75d@googlegroups.com>
 <5729F6D6.8030100@schinagl.nl>
 <4704fa35-9a2a-4e6e-8fd4-f4778405c598@googlegroups.com>
 <572A0052.9060202@schinagl.nl>
 <2e745ef7-ddc0-40fc-b867-414543690276@googlegroups.com>
 <572A10B3.2020803@schinagl.nl>
 <4375220a-f939-4ed0-a6d7-2cf887b07509@googlegroups.com>
 <9fe7ebb6-6d74-4b73-b6d6-93b79650cdb6@googlegroups.com>
 <9745a80b-5444-43f7-b772-68684c96c9e5@googlegroups.com>
 <57322C8D.5060806@schinagl.nl>
 <8afbe753-4e74-4b30-ad7e-a12027d28264@googlegroups.com>
 <57323CAB.7090202@schinagl.nl>
Reply-To: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_5147_1252839803.1462915371621"
Return-path: <linux-sunxi+bncBD7ORYHCVECRBLFCZG4QKGQEPTK6VPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <57323CAB.7090202-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_5147_1252839803.1462915371621
Content-Type: multipart/alternative;
	boundary="----=_Part_5148_1957408923.1462915371623"

------=_Part_5148_1957408923.1462915371623
Content-Type: text/plain; charset=UTF-8


Hi Olliver,

Unfortunately, I have a problem to see and use quoted text so I delete it.

I saw broken-hpi option but currently I use mainly kernel 4.5.3 so not sure 
if it is available there.
About 8-bit staff in my patch it is there by error. I really use 4-bit bus 
without additional pins definitions.

About better results measured by you it is definitely because of larger 
buffers.
If you want to get a real figures you have to measure performance for a set 
of buffer sizes like I do with iozone tool:
root@egpr:~# uname -a
Linux egpr 4.6.0-sunxi #1 SMP Tue May 10 20:50:21 EEST 2016 armv7l GNU/Linux

root@egpr:/mnt# iozone -e -I -a -s 100M -r 4k -r 16k -r 512k -r 1024k -r 
16384k -i 0 -i 1 -i 2
        Iozone: Performance Test of File I/O
                Version $Revision: 3.429 $
                Compiled for 32 bit mode.
                Build: linux

        Contributors:William Norcott, Don Capps, Isom Crawford, Kirby 
Collins
                     Al Slater, Scott Rhine, Mike Wisner, Ken Goss
                     Steve Landherr, Brad Smith, Mark Kelly, Dr. Alain CYR,
                     Randy Dunlap, Mark Montague, Dan Million, Gavin Brebner
,
                     Jean-Marc Zucconi, Jeff Blomberg, Benny Halevy, Dave 
Boone,
                     Erik Habbinga, Kris Strecker, Walter Wong, Joshua Root,
                     Fabrice Bacchella, Zhenghua Xue, Qin Li, Darren Sawyer,
                     Vangel Bojaxhi, Ben England, Vikentsi Lapa.

        Run began: Tue May 10 23:28:08 2016

        Include fsync in write timing
        O_DIRECT feature enabled
        Auto Mode
        File size set to 102400 kB
        Record Size 4 kB
        Record Size 16 kB
        Record Size 512 kB
        Record Size 1024 kB
        Record Size 16384 kB
        Command line used: iozone -e -I -a -s 100M -r 4k -r 16k -r 512k -r 
1024k -r 16384k -i 0 -i 1 -i 2
        Output is in kBytes/sec
        Time Resolution = 0.000001 seconds.
        Processor cache size set to 1024 kBytes.
        Processor cache line size set to 32 bytes.
        File stride size set to 17 * record size.
                                                              random   
 random
              kB  reclen    write  rewrite    read    reread    read     
write
          102400       4     3653     4003    12637    12521     9501     
3997
          102400      16     7277     7531    16300    16413    14910     
7392
          102400     512    11733    11739    39496    39444    39254    
11718
          102400    1024    11793    11843    40015    40086    39951    
11887
          102400   16384    11977    11895    40680    40781    40656    
11952

                                                              random   
 random
              kB  reclen    write  rewrite    read    reread    read     
write
          102400       4     3768     4008    12458    12432     9565     
3895
          102400      16     7231     7526    16488    16634    15085     
7432
          102400     512    11608    11700    38424    38358    38172    
11655
          102400    1024    11841    11853    39543    39736    39573    
10977
          102400   16384    11923    11950    40756    40823    40824    
11994

iozone test complete.
It is strange that read speed of ~40 MB/s is reached at 512+ kB buffers but 
write speed of 17MB/s (as you mention) is never reached at my tests.

For reference iozone test gives eMMC speeds at kernel 4.5.3:
                                                              random   
 random
              kB  reclen    write  rewrite    read    reread    read     
write
          102400       4     3444     3677     9663     9626     7801     
3577
          102400      16     6290     6514    13084    12740    11873     
6409
          102400     512    11623    11653    21592    21567    21485    
10617
          102400    1024    11787    11859    21862    21907    21811    
11805
          102400   16384    11944    11914    22131    22125    22147    
11947

4GB SD card class 10 speeds at kernel 4.6.0 are:
                                                              random   
 random
              kB  reclen    write  rewrite    read    reread    read     
write
          102400       4      630      736     5242     5149     4683      
171
          102400      16     1140     1507    11630    11651    11517      
331
          102400     512     6247     6465    21572    20748    21567      
945
          102400    1024     6297     6521    20707    21943    21901     
1945
          102400   16384     6363     6416    22209    21001    22208     
6459

4GB SD card class 10 speeds at kernel 4.5.3 are:
                                                              random   
 random
              kB  reclen    write  rewrite    read    reread    read     
write
          102400       4      222      227     5790     5821     4180      
203
          102400      16     5681     6149     9470     9661     8340       
62
          102400     512    12033    11656    21194    21194    20982     
2199
          102400    1024    12548    11792    21606    21616    20760     
4737
          102400   16384    12755    11831    21929    21964    21214    
10531
Strange is that SD card write speed is better at kernel 4.5.3 than at 
kernel 4.6.0 while read speed is almost the same.

About using your patch in kernel 4.6 at Armbian build I did not see any 
errors at patching phase.
Maybe I have to try patched with my patches u-boot and kernel 4.6 patched 
with your patch.
But I am not sure that u-boot has to do something for kernel to work with 
eMMC.

I am ready to test if you have some ideas because your patch is probably 
better than one used by me at the moment.

Best regards
Chris

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_5148_1957408923.1462915371623
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><code><br>Hi Olliver,<br><br>Unfortunately, I have a probl=
em to see and use quoted text so I delete it.<br><br>I saw broken-hpi optio=
n but currently I use mainly kernel 4.5.3 so not sure if it is available th=
ere.<br>About 8-bit staff in my patch it is there by error. I really use 4-=
bit bus without additional pins definitions.<br><br>About better results me=
asured by you it is definitely because of larger buffers.<br>If you want to=
 get a real figures you have to measure performance for a set of buffer siz=
es like I do with iozone tool:<br><div class=3D"prettyprint" style=3D"backg=
round-color: rgb(250, 250, 250); border-color: rgb(187, 187, 187); border-s=
tyle: solid; border-width: 1px; word-wrap: break-word;"><code class=3D"pret=
typrint"><div class=3D"subprettyprint"><span style=3D"color: #000;" class=
=3D"styled-by-prettify">root@egpr</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:~</span><span style=3D"color: #800;" class=3D"styl=
ed-by-prettify"># uname -a</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br></span><span style=3D"color: #606;" class=3D"styled-by-=
prettify">Linux</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> egpr </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>4.6</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">0</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify">sunxi </span><span style=3D"color=
: #800;" class=3D"styled-by-prettify">#1 SMP Tue May 10 20:50:21 EEST 2016 =
armv7l GNU/Linux</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"><br><br>root@egpr</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">:</span><span style=3D"color: #080;" class=3D"styled-by-pretti=
fy">/mnt# iozone -e -I -a -s 100M -r 4k -r 16k -r 512k -r 1024k -r 16384k -=
i 0 -i 1 -i 2<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Iozone: Performance Test of Fi=
le I/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">O<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Version</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> $Revision</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" cla=
ss=3D"styled-by-prettify">3.429</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> $<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Co=
mpiled</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #008;" class=3D"styled-by-prettify">for</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">32</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> bit mode</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=3D"styled-by-pretti=
fy">Build</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> linux<br>=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Contributors</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">:</span><span style=3D"color: #606;" class=3D"sty=
led-by-prettify">William</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prett=
ify">Norcott</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span style=3D"color: #606;" class=3D"styled-by-prettify">Don</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #606;" class=3D"styled-by-prettify">Capps</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"=
styled-by-prettify">Isom</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prett=
ify">Crawford</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </spa=
n><span style=3D"color: #606;" class=3D"styled-by-prettify">Kirby</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Collins</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"colo=
r: #606;" class=3D"styled-by-prettify">Al</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Slater</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify=
">Scott</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #606;" class=3D"styled-by-prettify">Rhine</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #606;" class=3D"styled-by-prettify">Mike</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" clas=
s=3D"styled-by-prettify">Wisner</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettif=
y">Ken</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #606;" class=3D"styled-by-prettify">Goss</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span =
style=3D"color: #606;" class=3D"styled-by-prettify">Steve</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #606;" class=3D"styled-by-prettify">Landherr</span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"st=
yled-by-prettify">Brad</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettif=
y">Smith</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #606;" class=3D"styled-by-prettify">Mark</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #606;" class=3D"styled-by-prettify">Kelly</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"sty=
led-by-prettify">Dr</span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Alain</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> CYR</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"c=
olor: #606;" class=3D"styled-by-prettify">Randy</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" c=
lass=3D"styled-by-prettify">Dunlap</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-pret=
tify">Mark</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Montague<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Dan</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;=
" class=3D"styled-by-prettify">Million</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-=
prettify">Gavin</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Breb=
ner</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><s=
pan style=3D"color: #606;" class=3D"styled-by-prettify">Jean</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"co=
lor: #606;" class=3D"styled-by-prettify">Marc</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" cla=
ss=3D"styled-by-prettify">Zucconi</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-pret=
tify">Jeff</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Blomberg<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Benny</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #60=
6;" class=3D"styled-by-prettify">Halevy</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by=
-prettify">Dave</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Boon=
e</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span =
style=3D"color: #606;" class=3D"styled-by-prettify">Erik</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #606;" class=3D"styled-by-prettify">Habbinga</span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"st=
yled-by-prettify">Kris</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettif=
y">Strecker</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span>=
<span style=3D"color: #606;" class=3D"styled-by-prettify">Walter</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Wong</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Joshua</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by=
-prettify">Root</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0</span><span style=3D"color: #606;" class=3D"styled-by-prettify">Fabrice=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><s=
pan style=3D"color: #606;" class=3D"styled-by-prettify">Bacchella</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #606;" class=3D"styled-by-prettify">Zhenghua</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" cl=
ass=3D"styled-by-prettify">Xue</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify=
">Qin</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span style=3D"color: #606;" class=3D"styled-by-prettify">Li</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #=
606;" class=3D"styled-by-prettify">Darren</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Sawyer</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0</span><span style=3D"color: #606;" class=3D"styled-by-pre=
ttify">Vangel</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Bojaxh=
i</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #606;" class=3D"styled-by-prettify">Ben</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606=
;" class=3D"styled-by-prettify">England</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by=
-prettify">Vikentsi</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">=
Lapa</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"><br><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=3D"styled-by=
-prettify">Run</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> began</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><=
span style=3D"color: #606;" class=3D"styled-by-prettify">Tue</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #606;" class=3D"styled-by-prettify">May</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">10</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">23</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
:</span><span style=3D"color: #066;" class=3D"styled-by-prettify">28</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span sty=
le=3D"color: #066;" class=3D"styled-by-prettify">08</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">2016</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span =
style=3D"color: #606;" class=3D"styled-by-prettify">Include</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> fsync </span><span style=
=3D"color: #008;" class=3D"styled-by-prettify">in</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> write timing<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 O_DIRECT feature enabled<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><=
span style=3D"color: #606;" class=3D"styled-by-prettify">Auto</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"c=
olor: #606;" class=3D"styled-by-prettify">Mode</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>=
<span style=3D"color: #606;" class=3D"styled-by-prettify">File</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> size </span><span styl=
e=3D"color: #008;" class=3D"styled-by-prettify">set</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> to </span><span style=3D"color: #=
066;" class=3D"styled-by-prettify">102400</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> kB<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><s=
pan style=3D"color: #606;" class=3D"styled-by-prettify">Record</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #606;" class=3D"styled-by-prettify">Size</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">4</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> kB<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D=
"color: #606;" class=3D"styled-by-prettify">Record</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;=
" class=3D"styled-by-prettify">Size</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"styl=
ed-by-prettify">16</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> kB<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #60=
6;" class=3D"styled-by-prettify">Record</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"=
styled-by-prettify">Size</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">512</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> k=
B<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Record</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by=
-prettify">Size</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">1024=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> kB<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Record</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify=
">Size</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">16384</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> kB<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" class=3D"styled-by-pr=
ettify">Command</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> line used</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> ioz=
one </span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">e </span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify">I </span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">a </span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify">s </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>100M</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify">r </span><span style=3D=
"color: #066;" class=3D"styled-by-prettify">4k</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify">r </span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">16k</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">r </span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">512k</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify">r </span><span style=3D"color: #066;" class=3D=
"styled-by-prettify">1024k</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">r =
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">16384k</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify">i </span><span style=3D"color: #=
066;" class=3D"styled-by-prettify">0</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify">i </span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
1</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify">i </span><span style=3D"col=
or: #066;" class=3D"styled-by-prettify">2</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span=
 style=3D"color: #606;" class=3D"styled-by-prettify">Output</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #008;" class=3D"styled-by-prettify">is</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> </span><span style=3D"color: #008;" class=
=3D"styled-by-prettify">in</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> kBytes</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy">sec<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #606;" =
class=3D"styled-by-prettify">Time</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Resolution</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">=3D</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0.000001</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> seconds</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span><span style=3D"color: #606;" class=3D"styled-by-prettify"=
>Processor</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 cache size </span><span style=3D"color: #008;" class=3D"styled-by-prettify=
">set</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> to <=
/span><span style=3D"color: #066;" class=3D"styled-by-prettify">1024</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> kBytes</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span><span style=3D"color: #606;" class=3D"styled-by-prettify">Proces=
sor</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> cache =
line size </span><span style=3D"color: #008;" class=3D"styled-by-prettify">=
set</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> to </s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">32</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> bytes</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </=
span><span style=3D"color: #606;" class=3D"styled-by-prettify">File</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> stride size </spa=
n><span style=3D"color: #008;" class=3D"styled-by-prettify">set</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> to </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">17</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">*</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> record size</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 random =C2=A0 =C2=A0random<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 kB =C2=A0reclen =C2=A0 =C2=A0write =C2=A0rewrite =C2=A0 =
=C2=A0read =C2=A0 =C2=A0reread =C2=A0 =C2=A0read =C2=A0 =C2=A0 write<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">102400</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">4</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">3653</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">4003</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">12637</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">12521</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">9501</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">3997</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">102400</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">16</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">7277</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">7531</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">16300</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">16413</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">14910</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">7392</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>102400</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">512</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">11733</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">11739</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">39496</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">39444</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">39254</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">11718</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" cl=
ass=3D"styled-by-prettify">102400</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">1024</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">11793</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">11843</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">40015</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">40086</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">39951</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">11887</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">102400</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">16384</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">11977</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">11895</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">40680</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">40781</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">40656</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">11952</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 random =C2=A0 =C2=A0random<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kB =C2=A0reclen =C2=A0 =
=C2=A0write =C2=A0rewrite =C2=A0 =C2=A0read =C2=A0 =C2=A0reread =C2=A0 =C2=
=A0read =C2=A0 =C2=A0 write<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">102400</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 <=
/span><span style=3D"color: #066;" class=3D"styled-by-prettify">4</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">3768</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">4008</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">12458</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">12432</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">9565</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><sp=
an style=3D"color: #066;" class=3D"styled-by-prettify">3895</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">102400</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">16</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">7231</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">7526</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">16488</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">16634</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">15085</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">7432</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" cl=
ass=3D"styled-by-prettify">102400</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">512</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">11608</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">11700</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">38424</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">38358</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">38172</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">11655</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">102400</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">1024</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">11841</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">11853</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">39543</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">39736</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">39573</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">10977</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>102400</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify">163=
84</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">1192=
3</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">1195=
0</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">4075=
6</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">4082=
3</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">4082=
4</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">1199=
4</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br><br>i=
ozone test complete</span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
<br></span></div></code></div>It is strange that read speed of ~40 MB/s is =
reached at 512+ kB buffers but write speed of 17MB/s (as you mention) is ne=
ver reached at my tests.<br><br>For reference iozone test gives eMMC speeds=
 at kernel 4.5.3:<br><div class=3D"prettyprint" style=3D"background-color: =
rgb(250, 250, 250); border-color: rgb(187, 187, 187); border-style: solid; =
border-width: 1px; word-wrap: break-word;"><code class=3D"prettyprint"><div=
 class=3D"subprettyprint"><span style=3D"color: #000;" class=3D"styled-by-p=
rettify">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 random =C2=A0 =C2=A0random<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 kB =C2=A0reclen =C2=A0 =C2=A0write =C2=A0rewrite =C2=A0 =C2=A0read =
=C2=A0 =C2=A0reread =C2=A0 =C2=A0read =C2=A0 =C2=A0 write<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">102400</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">4</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">3444</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled=
-by-prettify">3677</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-=
by-prettify">9663</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">9626</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">7801</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">3577</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">102400</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</span><span style=3D"col=
or: #066;" class=3D"styled-by-prettify">16</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color:=
 #066;" class=3D"styled-by-prettify">6290</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: =
#066;" class=3D"styled-by-prettify">6514</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #0=
66;" class=3D"styled-by-prettify">13084</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">12740</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">11873</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">6409</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><sp=
an style=3D"color: #066;" class=3D"styled-by-prettify">102400</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">512</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">11623</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">11653</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">21592</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">21567</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">21485</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">10617</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>102400</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">1024</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">11787</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">11859</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">21862</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">21907</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">21811</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">11805</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" cl=
ass=3D"styled-by-prettify">102400</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 </span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">16384</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">11944</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">11914</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">22131</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">22125</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">22147</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">11947</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"><br></span></div></code></div></code><br><code>4GB SD ca=
rd class 10 speeds at kernel 4.6.0 are:<br><div class=3D"prettyprint" style=
=3D"background-color: rgb(250, 250, 250); border-color: rgb(187, 187, 187);=
 border-style: solid; border-width: 1px; word-wrap: break-word;"><code clas=
s=3D"prettyprint"><div class=3D"subprettyprint"><span style=3D"color: #000;=
" class=3D"styled-by-prettify">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 random =C2=A0 =C2=A0random<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kB =C2=A0reclen =C2=A0 =C2=A0write =C2=A0re=
write =C2=A0 =C2=A0read =C2=A0 =C2=A0reread =C2=A0 =C2=A0read =C2=A0 =C2=A0=
 write<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #=
066;" class=3D"styled-by-prettify">102400</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"=
color: #066;" class=3D"styled-by-prettify">4</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">630</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">736</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span sty=
le=3D"color: #066;" class=3D"styled-by-prettify">5242</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span styl=
e=3D"color: #066;" class=3D"styled-by-prettify">5149</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">4683</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">171</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>102400</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">16</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">1140</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">1507</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">11630</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">11651</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">11517</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">331</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">102400</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">512</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">6247</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;"=
 class=3D"styled-by-prettify">6465</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">21572</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">20748</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">21567</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #=
066;" class=3D"styled-by-prettify">945</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">102400</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">1024</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">6297</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><sp=
an style=3D"color: #066;" class=3D"styled-by-prettify">6521</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">20707</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">21943</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">21901</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">1945</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>102400</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify">163=
84</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify">636=
3</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify">641=
6</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">2220=
9</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">2100=
1</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">2220=
8</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify">645=
9</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></spa=
n></div></code></div><br></code><code><code>4GB SD card class 10 </code>spe=
eds at kernel 4.5.3 are:<br><div class=3D"prettyprint" style=3D"background-=
color: rgb(250, 250, 250); border-color: rgb(187, 187, 187); border-style: =
solid; border-width: 1px; word-wrap: break-word;"><code class=3D"prettyprin=
t"><div class=3D"subprettyprint"><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 random =C2=A0 =C2=A0random<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 kB =C2=A0reclen =C2=A0 =C2=A0write =C2=A0rewrite =C2=A0 =C2=
=A0read =C2=A0 =C2=A0reread =C2=A0 =C2=A0read =C2=A0 =C2=A0 write<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">102400</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" cl=
ass=3D"styled-by-prettify">4</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">222</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #=
066;" class=3D"styled-by-prettify">227</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">5790</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">5821</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">4180</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: =
#066;" class=3D"styled-by-prettify">203</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">102400</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0=
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">16</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">5681</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </sp=
an><span style=3D"color: #066;" class=3D"styled-by-prettify">6149</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">9470</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">9661</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">8340</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 <=
/span><span style=3D"color: #066;" class=3D"styled-by-prettify">62</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">102400</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">512</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">12033</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">11656</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">21194</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">21194</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">20982</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">2199</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">102400</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">1024</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">12548</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">11792</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">21606</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">21616</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">20760</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">4737</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">102400</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">16384</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">12755</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">11831</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">21929</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">21964</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">21214</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">10531</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"><br></span></div></code></div>Str=
ange is that SD card write speed is better at kernel 4.5.3 than at kernel 4=
.6.0 while read speed is almost the same.<br><br>About using your patch in =
kernel 4.6 at Armbian build I did not see any errors at patching phase.<br>=
Maybe I have to try patched with my patches u-boot and kernel 4.6 patched w=
ith your patch.<br>But I am not sure that u-boot has to do something for ke=
rnel to work with eMMC.<br><br>I am ready to test if you have some ideas be=
cause your patch is probably better than one used by me at the moment.<br><=
br>Best regards<br>Chris<br><br></code></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_5148_1957408923.1462915371623--

------=_Part_5147_1252839803.1462915371621--
