From: Ezaul Zillmer <ezaulzillmer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 2/2] mtd: nand: add sunxi NFC dt bindings doc
Date: Tue, 21 Oct 2014 06:13:16 -0700 (PDT)
Message-ID: <62d54110-9c7f-4342-9201-a1ae23194620@googlegroups.com>
References: <1413805520-14947-1-git-send-email-boris.brezillon@free-electrons.com>
 <1413805520-14947-3-git-send-email-boris.brezillon@free-electrons.com>
 <20141021024134.GC1193@ld-irv-0074>
 <20141021145344.575b19e6@bbrezillon>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_373_186830859.1413897196528"
Return-path: <linux-sunxi+bncBD2ILSOUX4CBB3FXTGRAKGQEYTE25QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141021145344.575b19e6@bbrezillon>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yassinjaffer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_373_186830859.1413897196528
Content-Type: text/plain; charset=UTF-8

Hello everyone 

Boris Brezillon 

downloaded sunxi-nand-v6 now compiled for Cubieboard2 
https://github.com/bbrezillon/linux-sunxi.git sunxi b-nand-v6 

u-boot 
git clone https://github.com/jwrdegoede/u-boot-b sunxi.git sunxi-wip 


[1.143903] nand: Could not find valid JEDEC parameter page; aborting 
[1.150369] nand: device found, Manufacturer ID: 0xec, Chip ID: 0xd7 
[1.156766] nand: Samsung NAND 4GiB 3.3V 8-bit 
[1.161214] nand: 4096MiB, MLC, page size: 8192, OOB size: 640 
[1.167167] sunxi_nand 1c03000.nand: ECC init failed: -22 
[1.172588] sunxi_nand 1c03000.nand: failed to init nand chips 
[1.178502] sunxi_nand: probe of 1c03000.nand failed with error -22 

need some more data?

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_373_186830859.1413897196528
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello everyone&nbsp;</div><div><br></div><div>Bo=
ris Brezillon&nbsp;</div><div><br></div><div>downloaded sunxi-nand-v6 now c=
ompiled for Cubieboard2&nbsp;</div><div>https://github.com/bbrezillon/linux=
-sunxi.git sunxi b-nand-v6&nbsp;</div><div><br></div><div>u-boot&nbsp;</div=
><div>git clone https://github.com/jwrdegoede/u-boot-b sunxi.git sunxi-wip&=
nbsp;</div><div><br></div><div><br></div><div>[1.143903] nand: Could not fi=
nd valid JEDEC parameter page; aborting&nbsp;</div><div>[1.150369] nand: de=
vice found, Manufacturer ID: 0xec, Chip ID: 0xd7&nbsp;</div><div>[1.156766]=
 nand: Samsung NAND 4GiB 3.3V 8-bit&nbsp;</div><div>[1.161214] nand: 4096Mi=
B, MLC, page size: 8192, OOB size: 640&nbsp;</div><div>[1.167167] sunxi_nan=
d 1c03000.nand: ECC init failed: -22&nbsp;</div><div>[1.172588] sunxi_nand =
1c03000.nand: failed to init nand chips&nbsp;</div><div>[1.178502] sunxi_na=
nd: probe of 1c03000.nand failed with error -22&nbsp;</div><div><br></div><=
div>need some more data?</div></div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_373_186830859.1413897196528--
