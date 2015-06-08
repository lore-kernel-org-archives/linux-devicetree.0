From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v9 4/6] Documentation: DT: PL011: hi6220: add compatible
 string for Hisilicon designed UART
Date: Mon, 8 Jun 2015 15:32:09 +0200
Message-ID: <CACRpkdZ-z0sESSmB=Smng1ra+1Uv4DEt1=kqZm0vMK8+vknHDQ@mail.gmail.com>
References: <1432950661-23060-1-git-send-email-bintian.wang@huawei.com>
 <1432950661-23060-5-git-send-email-bintian.wang@huawei.com>
 <CACRpkdav_5x6RC9F++ErvqGyxDCF-=kap7-jCsO4zZ6QGVLfBQ@mail.gmail.com>
 <556D73B6.4090608@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <556D73B6.4090608@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>, Will Deacon <Will.Deacon@arm.com>, "huxinwei@huawei.com" <huxinwei@huawei.com>, Kevin Hilman <khilman@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, "yanhaifeng@gmail.com" <yanhaifeng@gmail.com>, "rob.herring@linaro.org" <rob.herring@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, "wangbintian@gmail.com" <wangbintian@gmail.com>, Kevin Hilman <khilman@kernel.org>, "victor.lixin@hisilicon.com" <victor.lixin@hisilicon.com>, Xu Wei <xuwei5@hisilicon.com>, Jaehoon Chung <jh80.chung@samsung.com>, "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>, XinWei Kong <kong.kongxinwei@hisilicon.com>, Yunlei He <heyunlei@huawei.com>, puck.c
List-Id: devicetree@vger.kernel.org

On Tue, Jun 2, 2015 at 11:13 AM, Marc Zyngier <marc.zyngier@arm.com> wrote:
> On 02/06/15 09:59, Linus Walleij wrote:

>> enum amba_vendor {
>>         AMBA_VENDOR_ARM = 0x41,
>> +       AMBA_VENDOR_HISILICON = 0x48,
>>
>> Then patch drivers/tty/serial/amba_pl011.c to add vendor_hisilicon
>> and a match table for 0x00048011 just like everyone else.
>
> That feels weird. This amba_vendor enum is not under control of the DT
> author, nor the kernel. This is a set of codes that are managed by a
> third party (probably ARM). What if some company with a name starting
> with 'H' (Hilarious Inc?) comes up with some actual HW and ends up
> conflicting with the above?

Sorry, as indicated by
commit db4fa45ed3182d8206af241811dfc99369ffa849
"spi: pl022: Add support for chip select extension"
bits [6:0] should be the JEP106 manufacturer identity code.

Not that I know how you get such a code. Hardware which is
modified and does not set the JEP106 ID code is buggy I
guess.

Anyways, the pattern we have to handle this is to use that ID
code.

Yours,
Linus Walleij
