From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 2/2] mtd: nand: add sunxi NFC dt bindings doc
Date: Tue, 21 Oct 2014 15:58:41 +0200
Message-ID: <20141021155841.180861d0@bbrezillon>
References: <1413805520-14947-1-git-send-email-boris.brezillon@free-electrons.com>
	<1413805520-14947-3-git-send-email-boris.brezillon@free-electrons.com>
	<20141021024134.GC1193@ld-irv-0074>
	<20141021145344.575b19e6@bbrezillon>
	<62d54110-9c7f-4342-9201-a1ae23194620@googlegroups.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBBF6NTGRAKGQEVGCLC3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <62d54110-9c7f-4342-9201-a1ae23194620-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Ezaul Zillmer <ezaulzillmer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yassinjaffer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 Oct 2014 06:13:16 -0700 (PDT)
Ezaul Zillmer <ezaulzillmer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hello everyone 
> 
> Boris Brezillon 
> 
> downloaded sunxi-nand-v6 now compiled for Cubieboard2 
> https://github.com/bbrezillon/linux-sunxi.git sunxi b-nand-v6 
> 
> u-boot 
> git clone https://github.com/jwrdegoede/u-boot-b sunxi.git sunxi-wip 
> 
> 
> [1.143903] nand: Could not find valid JEDEC parameter page; aborting 
> [1.150369] nand: device found, Manufacturer ID: 0xec, Chip ID: 0xd7 
> [1.156766] nand: Samsung NAND 4GiB 3.3V 8-bit 
> [1.161214] nand: 4096MiB, MLC, page size: 8192, OOB size: 640 
> [1.167167] sunxi_nand 1c03000.nand: ECC init failed: -22 
> [1.172588] sunxi_nand 1c03000.nand: failed to init nand chips 
> [1.178502] sunxi_nand: probe of 1c03000.nand failed with error -22 
> 
> need some more data?
> 

Can you try to apply this patch [1] ?

[1]http://code.bulix.org/26bi35-87234



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
