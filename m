From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NSAxLzNdIG10ZDogbmFuZDogZ3BpbzogQWRkIERUIHBy?=
 =?UTF-8?B?b3BlcnR5IHRvIGF1dG9tYXRpY2FsbHkgZGV0ZXJtaW5lIGJ1cyB3aWR0aA==?=
Date: Thu, 05 Dec 2013 11:45:25 +0400
Message-ID: <1386229525.801342898@f370.i.mail.ru>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131130091738.GE29397@norris.computersforpeace.net>
 <20131205021809.GK27149@ld-irv-0074.broadcom.com>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20131205021809.GK27149@ld-irv-0074.broadcom.com>
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
Cc: =?UTF-8?B?TWFyayBSdXRsYW5k?= <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?B?UnVzc2VsbCBLaW5n?= <linux@arm.linux.org.uk>, =?UTF-8?B?UGF3ZWwgTW9sbA==?= <pawel.moll@arm.com>, =?UTF-8?B?SWFuIENhbXBiZWxs?= <ijc+devicetree@hellion.org.uk>, =?UTF-8?B?QXJ0ZW0gQml0eXV0c2tpeQ==?= <dedekind1@gmail.com>, =?UTF-8?B?Um9iIEhlcnJpbmc=?= <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org, =?UTF-8?B?SGFvamlhbiBaaHVhbmc=?= <haojian.zhuang@gmail.com>, =?UTF-8?B?U3RlcGhlbiBXYXJyZW4=?= <swarren@wwwdotorg.org>, =?UTF-8?B?RXJpYyBNaWFv?= <eric.y.miao@gmail.com>, =?UTF-8?B?RGF2aWQgV29vZGhvdXNl?= <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

> On Sat, Nov 30, 2013 at 01:17:38AM -0800, Brian Norris wrote:
> > On Fri, Nov 29, 2013 at 12:56:04PM +0400, Alexander Shiyan wrote:
> > > Can at least part [2/3] "mtd: nand: gpio: Use devm_gpio_request_one() where possible"
> > > be applied at this time?
> > 
> > Probably. I was avoiding taking things out of order in the series for
> > now, but I'll take another look. If it looks good and applies
> > independently, then I'll take it.
> 
> Patch 2 can't be applied independently. You can rebase and resend if you
> want it applied.
> 
> We still haven't resolved patch 1. It doesn't seem like quite the right
> binding.

I am again inclined to believe that it is necessary to completely remove
the width parameter for the driver and always determine the bus width
automatically when the window size is more than 1 byte.

---
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
