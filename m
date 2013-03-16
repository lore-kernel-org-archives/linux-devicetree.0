From: Anil Kumar <anilk4.v@gmail.com>
Subject: Getting kernel uImage build issue on omap2+
Date: Sat, 16 Mar 2013 10:14:09 +0530
Message-ID: <CABYxbz6ydTtHmLW1xETanHa9uZzZ5M=4wv3Wj5aNDE2Db1b2Rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>, Tony Lindgren <tony@atomide.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Benoit Cousson <b-cousson@ti.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

I am getting kernel uImage build issue on omap2+ log[1]

Taken kernel branch "for_3.10/dts" from
https://git.kernel.org/pub/scm/linux/kernel/git/bcousson/linux-omap-dt.git

Taking reference from
https://kernel.googlesource.com/pub/scm/linux/kernel/git/tmlind/linux-omap/+/omap-for-v3.9/multiplatform-enable-signed-v2

Am I missing some thing ?

[1]
anil@anil-laptop:~/Anil/omap3/bcousson$  mkimage -A arm -O linux -T
kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux" -d
zImage-omap2plus uImage-omap2plus
mkimage: Can't open zImage-omap2plus: No such file or directory
anil@anil-laptop:~/Anil/omap3/bcousson$

Thanks,
Anil
