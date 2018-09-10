From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Subject: Re: [PATCH v3 2/3] dt-bindings: add bindings for mtd-concat devices
Date: Mon, 10 Sep 2018 14:13:08 +0200
Message-ID: <bf3d2900-aa99-e39f-24af-aa57d1f41928@nospam.obeliks.de>
References: <20180908131345.8145-1-kernel@nospam.obeliks.de>
 <20180908131345.8145-3-kernel@nospam.obeliks.de>
 <CACna6ryWCwKZJm2rq0_KeaKve8Ym9zi6AU+Kat9cpYAqtzCMdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACna6ryWCwKZJm2rq0_KeaKve8Ym9zi6AU+Kat9cpYAqtzCMdg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, kernel@nospam.obeliks.de
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Am 10.09.2018 um 12:51 schrieb Rafał Miłecki:
> On Sat, 8 Sep 2018 at 15:14, Bernhard Frauendienst  > <kernel@nospam.obeliks.de> wrote: >> >> Document virtual mtd-concat 
device bindings. >> >> Signed-off-by: Bernhard Frauendienst 
<kernel@nospam.obeliks.de> >> --- >> 
.../devicetree/bindings/mtd/mtd-concat.txt | 36 +++++++++++++++++++ >> 1 
file changed, 36 insertions(+) >> create mode 100644 
Documentation/devicetree/bindings/mtd/mtd-concat.txt >> >> diff --git 
a/Documentation/devicetree/bindings/mtd/mtd-concat.txt 
b/Documentation/devicetree/bindings/mtd/mtd-concat.txt >> new file mode 
100644 >> index 000000000000..2daf3157b163 >> --- /dev/null >> +++ 
b/Documentation/devicetree/bindings/mtd/mtd-concat.txt >> @@ -0,0 +1,36 
@@ >> +Virtual MTD concat device > > I think you forgot to include the 
documentation. Please ***describe*** > that binding.
You are right, I'm afraid I was mislead by some of the rather sparse
documentation files in the mtd directory.
Would something along these lines be sufficient?

--snip--
Virtual MTD concat device

A virtual composite device that concatenates multiple child devices into a
single mtd device. The child mtd nodes must also be defined in the tree and
are referenced using phandles.

Required properties:
- compatible : must be "mtd-concat"
- devices : list of phandles to mtd nodes in the order they should be
         concatenated

The device tree may optionally contain sub-nodes describing partitions 
of the
address space. See partition.txt for more detail.


Example:
--snip--

Regards,
Bernhard
