From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmVbMl06IFtQQVRDSCBWMiA0LzZdIEFSTTogZHRzOiBpbXg2cTogYWRkIHBp?=
 =?UTF-8?B?bmN0cmwgZm9yIFdFSU0gTk9S?=
Date: Thu, 23 May 2013 13:39:56 +0400
Message-ID: <1369301996.738631947@f310.mail.ru>
References: <1369296978-7669-1-git-send-email-b32955@freescale.com>
 <1369300440.725629549@f101.mail.ru>
 <519DE109.1030903@freescale.com>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <519DE109.1030903@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?SHVhbmcgU2hpamll?= <b32955@freescale.com>
Cc: arnd@arndb.de, s.hauer@pengutronix.de, rob.herring@calxeda.com, Alison_Chaiken@mentor.com, grant.likely@linaro.org, shawn.guo@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> > I suggest remove "nor" label here since it can be used for other devices later.
> this pinctrl is just for NOR.
> 
> If we attach other device to WEIM, it maybe needs other PAD, such as
> MX6Q_PAD_EIM_LBA__EIM_LBA_B. We need to add another pinctrl then.

How we should define CS1 pin in your example for second device?

---
