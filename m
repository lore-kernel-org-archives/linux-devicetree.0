From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC V3 2/3] mxs: add driver for ocotp in i.MX23 and i.MX28
Date: Mon, 20 Oct 2014 17:32:37 +0200
Message-ID: <54452B15.50502@i2se.com>
References: <1413628372-2809-1-git-send-email-stefan.wahren@i2se.com>
 <1413628372-2809-3-git-send-email-stefan.wahren@i2se.com>
 <3434817.dk7dLDFrcN@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3434817.dk7dLDFrcN@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, kernel@pengutronix.de, galak@codeaurora.org, shawn.guo@linaro.org, festevam@gmail.com, mhei@heimpold.de
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Am 20.10.2014 um 16:44 schrieb Arnd Bergmann:
> On Saturday 18 October 2014 10:32:51 Stefan Wahren wrote:
>> This patch brings readonly support for the On Chip OTP cells in the i.MX23
>> and i.MX28 processor. The driver uses files (one for each cell) in sysfs
>> as interface.
>>
>> ...
> I think this needs to be an MTD driver, not a "misc" driver, and it
> should use the proper MTD interfaces instead of introducing an
> incompatible set of interfaces.
>
> 	Arnd

phew that sounds like a lot of work and much complexity.

Am i right, that i should drop the sysfs interface?

Does MTD drivers have a readonly text (non binary) user interface?

Best regards
Stefan
