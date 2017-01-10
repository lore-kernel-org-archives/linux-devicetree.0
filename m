From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx6: Specify 'anatop-enable-bit' where
 appropriate
Date: Tue, 10 Jan 2017 10:24:18 -0800
Message-ID: <CAHQ1cqHhiCO8nMmYd_6r0Zx-oycVGf_0wo7x17rxbuJujxftww@mail.gmail.com>
References: <20170110163015.22444-1-andrew.smirnov@gmail.com>
 <CAOMZO5CnwrPcney0qzQgex_aFXCrksmEocZ28nf54Kvcm2dq-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5CnwrPcney0qzQgex_aFXCrksmEocZ28nf54Kvcm2dq-w@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Andrey Yurovsky <yurovsky@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 10, 2017 at 9:28 AM, Fabio Estevam <festevam@gmail.com> wrote:
> On Tue, Jan 10, 2017 at 2:30 PM, Andrey Smirnov
> <andrew.smirnov@gmail.com> wrote:
>> ENABLE_LINREG bit is implemented by 3P0, 1P1 and 2P5 regulators on
>> i.MX6. This property is present in similar code in Fresscale BSP and
>> made its way upstream in imx6ul.dtsi, so this patch adds this property
>> to the rest of i.MX6 family for completness.
>
> Please see:
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/patch/arch/arm/boot/dts/imx6ul.dtsi?id=27958ccdf29e9971732e02494b48be54b0691269

Fabio:

I submitted a patch implementing this property to LKML as well, see
https://www.spinics.net/lists/kernel/msg2418471.html

All of these patches are a part of a broader attempt to add PCIe
support for i.MX7, and on that platform this is a part of a 1P0D
regulator which supplies PCIe PHY.

I can rebase this patch set to take your commit into account, or else
let's discuss the best way to allow setting ENABLE_LINREG.

Thanks,
Andrey Smirnov
