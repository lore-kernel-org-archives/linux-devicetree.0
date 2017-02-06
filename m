From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2] ARM: dts: imx: Pass 'chosen' and 'memory' nodes
Date: Mon, 6 Feb 2017 11:49:53 +0100
Message-ID: <13787b59-6bfc-d020-9853-ae37074009dc@i2se.com>
References: <6d3e9733-bebc-4347-95db-2a1c9018948d@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6d3e9733-bebc-4347-95db-2a1c9018948d@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 01.02.2017 um 14:30 schrieb Stefan Wahren:
> Hi,
>
>> On Mon, Jan 30, 2017 at 4:54 PM, Russell King - ARM Linux
>> <linux@xxxxxxxxxxxxxxx> wrote:
>>
>>> /We need this regression fixed before 4.10 comes out so systems don't/
>>> /break when 4.10 comes out./
>> It will be fixed in the next rc with the following commit:
>>
> https://git.kernel.org/cgit/linux/kernel/git/shawnguo/linux.git/commit/?h=imx/fixes&id=a971c5545c3d45a1e33fda6e57913bb75aaa20c9
> <https://git.kernel.org/cgit/linux/kernel/git/shawnguo/linux.git/commit/?h=imx/fixes&id=a971c5545c3d45a1e33fda6e57913bb75aaa20c9>
>
>
> i want to report that the combination i.MX28 + imx-bootlets (requires
> CONFIG_ARM_APPENDED_DTB since bootlets can't handle DTBs) was also
> affected before and fixed by this patch.
>
> Btw are Arnd and Olof informed about this urgent patch?

@Shawn

Okay, 4.10-rc7 is out but this fix isn't applied :-(

Is there a chance for 4.10 or do we have to wait for 4.10.1?

Maybe the subject of the patch is to harmless.
