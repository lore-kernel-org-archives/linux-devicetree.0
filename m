From: Ezaul Zillmer <ezaulzillmer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 2/2] mtd: nand: add sunxi NFC dt bindings doc
Date: Wed, 22 Oct 2014 04:17:48 -0700 (PDT)
Message-ID: <4e9e7a56-c2b5-4eb1-9dc4-b6f15b009bf8@googlegroups.com>
References: <1413805520-14947-1-git-send-email-boris.brezillon@free-electrons.com>
 <1413805520-14947-3-git-send-email-boris.brezillon@free-electrons.com>
 <20141021024134.GC1193@ld-irv-0074>
 <20141021145344.575b19e6@bbrezillon>
 <62d54110-9c7f-4342-9201-a1ae23194620@googlegroups.com>
 <20141021155841.180861d0@bbrezillon>
 <89bb5f8e-2fb0-4012-a8b2-fdd618da8f11@googlegroups.com>
 <20141021180103.37ca7357@bbrezillon>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_198_642273560.1413976668443"
Return-path: <linux-sunxi+bncBD2ILSOUX4CBBXFET2RAKGQEGRCIUBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141021180103.37ca7357@bbrezillon>
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

------=_Part_198_642273560.1413976668443
Content-Type: text/plain; charset=UTF-8

Good Day My Noble Friend ... 

I'll post here some results 
Boris would like if possible could pass me some more step 
for tests with nand? what is still missing to run? 
take a look below ..

______________________________________________________________________
[    1.119502] nand: device found, Manufacturer ID: 0xec, Chip ID: 0xd7
[    1.125908] nand: Samsung K9GBG08U0A 32G 3.3V 8-bit
[    1.130790] nand: 4096MiB, MLC, page size: 8192, OOB size: 640
[    1.136811] Scanning device for bad blocks
[    1.833630] random: nonblocking pool is initialized
[   10.083008] No valid partition found on 
/soc@01c00000/nand@01c03000/nand@0
_______________________________________________________________________
root@cubie0:~# mtdinfo
Count of MTD devices:           1
Present MTD devices:            mtd0
Sysfs interface supported:      yes
_______________________________________________________________________
root@cubie0:~# mtdinfo /dev/mtd0
mtd0
Name:                                      K9GBG08U0A 32G 3.3V 8-bit
Type:                                       mlc-nand
Eraseblock size:                      1048576 bytes, 1024.0 KiB
Amount of eraseblocks:            4096 (4294967296 bytes, 4.0 GiB)
Minimum input/output unit size: 8192 bytes
Sub-page size:                         8192 bytes
OOB size:                               640 bytes
Character device major/minor:   90:0
Bad blocks are allowed:            false
Device is writable:                    true
______________________________________________________________________
root@cubie0:~# mtd_debug info /dev/mtd0
mtd.type = (unknown type - new MTD API maybe?)
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 0
mtd.erasesize = 1048576 (1M)
mtd.writesize = 8192 (8K)
mtd.oobsize = 640
regions = 0
_____________________________________________________________________
/dev/mtd0  /dev/mtd0ro
_____________________________________________________________________
root@cubie0:~# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 100000000 00100000 "K9GBG08U0A 32G 3.3V 8-bit"
_____________________________________________________________________



______________________________________________________________________

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_198_642273560.1413976668443
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Good Day My Noble Friend ...&nbsp;</di=
v><div><br></div><div>I'll post here some results&nbsp;</div><div>Boris wou=
ld like if possible could pass me some more step&nbsp;</div><div>for tests =
with nand? what is still missing to run?&nbsp;</div><div>take a look below =
..</div></div><div><br></div><div>_________________________________________=
_____________________________</div><div>[ &nbsp; &nbsp;1.119502] nand: devi=
ce found, Manufacturer ID: 0xec, Chip ID: 0xd7</div><div>[ &nbsp; &nbsp;1.1=
25908] nand: Samsung K9GBG08U0A 32G 3.3V 8-bit</div><div>[ &nbsp; &nbsp;1.1=
30790] nand: 4096MiB, MLC, page size: 8192, OOB size: 640</div><div>[ &nbsp=
; &nbsp;1.136811] Scanning device for bad blocks</div><div>[ &nbsp; &nbsp;1=
.833630] random: nonblocking pool is initialized</div><div>[ &nbsp; 10.0830=
08] No valid partition found on /soc@01c00000/nand@01c03000/nand@0</div></d=
iv><div>___________________________________________________________________=
____</div><div>root@cubie0:~# mtdinfo</div><div>Count of MTD devices: &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; 1</div><div>Present MTD devices: &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;mtd0</div><div>Sysfs interface supported: &nbs=
p; &nbsp; &nbsp;yes</div></div><div>_______________________________________=
________________________________</div><div>root@cubie0:~# mtdinfo /dev/mtd0=
<br></div><div>mtd0</div><div>Name: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;K9GBG08U0A 32G 3.3V 8-bit</div><div>Type: &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mlc-nand</div><div>Eraseblock si=
ze: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;1048576 bytes, 1024.0 KiB</div><div>Amount of eraseblocks: &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;4096 (4294967296 bytes, 4.0 GiB)</div><div>Mi=
nimum input/output unit size: 8192 bytes</div><div>Sub-page size: &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
8192 bytes</div><div>OOB size: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 640 bytes</div=
><div>Character device major/minor: &nbsp; 90:0</div><div>Bad blocks are al=
lowed: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;false</div><div>Device is w=
ritable: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;true</div><div>_________________________________________________________=
_____________</div><div><div>root@cubie0:~# mtd_debug info /dev/mtd0</div><=
div>mtd.type =3D (unknown type - new MTD API maybe?)</div><div>mtd.flags =
=3D MTD_CAP_NANDFLASH</div><div>mtd.size =3D 0</div><div>mtd.erasesize =3D =
1048576 (1M)</div><div>mtd.writesize =3D 8192 (8K)</div><div>mtd.oobsize =
=3D 640</div><div>regions =3D 0</div></div><div>___________________________=
__________________________________________</div><div>/dev/mtd0 &nbsp;/dev/m=
td0ro<br></div><div>_______________________________________________________=
______________</div><div><div>root@cubie0:~# cat /proc/mtd</div><div>dev: &=
nbsp; &nbsp;size &nbsp; erasesize &nbsp;name</div><div>mtd0: 100000000 0010=
0000 "K9GBG08U0A 32G 3.3V 8-bit"</div></div><div>__________________________=
___________________________________________</div><div><br></div><div><br></=
div><div><br></div><div>___________________________________________________=
___________________</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_198_642273560.1413976668443--
