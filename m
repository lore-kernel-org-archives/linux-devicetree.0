From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v3 0/9] Reuse davinci-nand driver for Keystone arch
Date: Sat, 14 Dec 2013 14:18:36 -0500
Message-ID: <52ACAF0C.6060205@ti.com>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
 <52A5F355.9020704@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <52A5F355.9020704@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dwmw2@infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 09 December 2013 11:44 AM, Santosh Shilimkar wrote:
> David,
> 
> On Thursday 05 December 2013 12:25 PM, Ivan Khoronzhuk wrote:
>> This series contains fixes and updates of Davinci nand driver in
>> order to reuse it for Keystone platform.
>>
>> v2..v3:
>> - mtd: nand: davinci: don't set timings if AEMIF is used
>> 	dropped, it would be replaced by alone patch
>> 	ARM: davinci: aemif: get rid of davinci-nand driver dependency on aemif
>>
>> v1..v2
>> The series is combination of two following series:
>> - Davinci nand driver fixes and updates:
>> https://lkml.org/lkml/2013/11/20/271
>> - Reuse davinci-nand driver for Keystone arch
>> https://lkml.org/lkml/2013/11/20/315
>>
>> - mtd: nand: davinci: extend description of bindings
>> 	clarified changeset description
>>
>> - mtd: nand: davinci: reuse driver for Keystone arch
>> 	removed "ti,keystone-nand" compatible from driver
>>
>> Ivan Khoronzhuk (9):
>>   mtd: nand: davinci: fix driver registration
>>   mtd: nand: davinci: return ENOMEM if memory allocation is failed
>>   mtd: nand: davinci: check required ti,davinci-chipselect property
>>   mtd: nand: davinci: simplify error handling
>>   mtd: nand: davinci: move bindings under mtd
>>   mtd: nand: davinci: extend description of bindings
>>   mtd: nand: davinci: adjust DT properties to MTD generic
>>   mtd: nand: davinci: reuse driver for Keystone arch
>>   mtd: nand: davinci: don't request AEMIF address range
>>
> Can you please pick up the $subject series if you are happy
> with it ?
> It lets us re-use Davinci nand driver on Keystone SOCs.
> 
Ping..

regards,
Santosh
