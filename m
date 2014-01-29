From: "Gupta, Pekon" <pekon@ti.com>
Subject: RE: [RFC PATCH v2 09/14] mtd: nand: add sunxi NFC dt bindings doc
Date: Wed, 29 Jan 2014 18:02:33 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6C01D@DBDE04.ent.ti.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
 <1391006064-28890-10-git-send-email-b.brezillon.dev@gmail.com>
 <CAL_JsqLVr1gSLArqtfOiHce+u6ZK8FiKMX0o9bvMrMoGGhATvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqLVr1gSLArqtfOiHce+u6ZK8FiKMX0o9bvMrMoGGhATvg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>, Boris BREZILLON <b.brezillon.dev@gmail.com>, "Ezequiel Garcia
 (ezequiel.garcia@free-electrons.com)" <ezequiel.garcia@free-electrons.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "dev@linux-sunxi.org" <dev@linux-sunxi.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Dear Rob, and other DT maintainers,

>From: Rob Herring
[...]
>> +- onfi,nand-timing-mode : mandatory if the chip does not support the ONFI
>> +  standard.
>
>Add to generic nand binding.
>
>> +- allwinner,rb : shall contain the native Ready/Busy ids.
>> + or
>> +- rb-gpios : shall contain the gpios used as R/B pins.
>
>Isn't allwinner,rb implied by a lack of rb-gpios property. Or no R/B
>pin is an option? If so, don't you need some fixed time delay
>properties like max erase time?
>
>rb-gpios could be added to the generic nand binding as well.
>
I do think this should go into generic nand binding, as this is controller specific.
Some controllers have dedicated R/B pin (Ready/Busy) while others may use
GPIO instead. It's the way a hardware controller is designed.

Request you to please consider Ack from MTD Maintainers 'at-least' for
generic NAND DT bindings. There is already a discussion going in
a separate thread for which is still not awaiting replies [1].

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051625.html


with regards, pekon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
