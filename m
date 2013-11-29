From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NSAxLzNdIG10ZDogbmFuZDogZ3BpbzogQWRkIERUIHBy?=
 =?UTF-8?B?b3BlcnR5IHRvIGF1dG9tYXRpY2FsbHkgZGV0ZXJtaW5lIGJ1cyB3aWR0aA==?=
Date: Fri, 29 Nov 2013 12:56:04 +0400
Message-ID: <1385715364.73252787@f82.i.mail.ru>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20131127012158.GR9468@ld-irv-0074.broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: =?UTF-8?B?QnJpYW4gTm9ycmlz?= <computersforpeace@gmail.com>
Cc: =?UTF-8?B?TWFyayBSdXRsYW5k?= <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?B?UnVzc2VsbCBLaW5n?= <linux@arm.linux.org.uk>, =?UTF-8?B?UGF3ZWwgTW9sbA==?= <pawel.moll@arm.com>, =?UTF-8?B?QXJ0ZW0gQml0eXV0c2tpeQ==?= <dedekind1@gmail.com>, =?UTF-8?B?SWFuIENhbXBiZWxs?= <ijc+devicetree@hellion.org.uk>, =?UTF-8?B?Um9iIEhlcnJpbmc=?= <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org, =?UTF-8?B?SGFvamlhbiBaaHVhbmc=?= <haojian.zhuang@gmail.com>, =?UTF-8?B?U3RlcGhlbiBXYXJyZW4=?= <swarren@wwwdotorg.org>, =?UTF-8?B?RXJpYyBNaWFv?= <eric.y.miao@gmail.com>, =?UTF-8?B?RGF2aWQgV29vZGhvdXNl?= <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

> Hi Alexander,
> 
> We're dealing with a similar issue in other drivers currently, and I
> think it's worth straightening out the issue for all systems.
> 
> On Wed, Nov 13, 2013 at 03:58:02PM +0400, Alexander Shiyan wrote:
> > This patch adds a property to automatically determine the NAND
> > bus width by CFI/ONFI information from chip. This property works
> > if the bus width is not specified explicitly.
...

Hello Brian.
Can at least part [2/3] "mtd: nand: gpio: Use devm_gpio_request_one() where possible"
be applied at this time?
Thanks.

---
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
