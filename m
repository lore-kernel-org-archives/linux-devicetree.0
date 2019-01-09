From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
Date: Wed, 9 Jan 2019 13:49:26 +0100
Message-ID: <a77e5b5c-fb77-3180-b382-0654eaf7b2a9@gmail.com>
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
 <20190109104922.z6g772vgncdqqbqt@verge.net.au>
 <20190109105754.vvqx6uvsktvxeq7a@ninjato>
 <34cd1769-f0c9-0c2b-8947-4fceca9a9fb2@gmail.com>
 <20190109123259.cpql62omcvypafdu@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190109123259.cpql62omcvypafdu@verge.net.au>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>
Cc: devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On 1/9/19 1:32 PM, Simon Horman wrote:
> On Wed, Jan 09, 2019 at 01:02:00PM +0100, Marek Vasut wrote:
>> On 1/9/19 11:57 AM, Wolfram Sang wrote:
>>>> [    3.373714] renesas_sdhi_internal_dmac ee100000.sd: mmc0 base at 0xee100000 max clock rate 200 MHz
>>>> [    3.456829] renesas_sdhi_internal_dmac ee120000.sd: mmc1 base at 0xee120000 max clock rate 200 MHz
>>>
>>> No mmc2 initialized. That should work regardless of eMMC. Probably
>>> something wrong in the DT somewhere.
>>
>> Weird, it worked in next-20181102 with these patches, I just rechecked:
>>
>> 7818a9f06df1 mmc: renesas_sdhi: Whitelist R8A77990 SDHI
>> a05a906776f8 pinctrl: sh-pfc: r8a77990: Add voltage switch operations
>> for SDHI
>> 2cc9d3a293e9 pinctrl: sh-pfc: r8a77990: Add SDHI pins, groups and functions
>> 6b8d151613b7 pinctrl: sh-pfc: r8a77990: Add Audio SSI pins, groups and
>> functions
>> 9167b22938f7 pinctrl: sh-pfc: r8a77990: Add Audio clock pins, groups and
>> functions
>> 000cc50fc942 arm64: dts: r8a77990-ebisu: Enable HS200 of SDHI3
>> d3f59bbbf7ce arm64: dts: r8a77990-ebisu: Enable eMMC of SDHI3
>> 5928c59bff8d arm64: dts: r8a77990-ebisu: Enable UHS-I of SDHI0 and SDHI1
>> dae32a3172b8 arm64: dts: r8a77990-ebisu: Enable SD card of SDHI0 and SDHI1
>> 8feef039c6c6 arm64: dts: r8a77990: Add SDHI device nodes
>> 25e9471b6a27 (tag: next-20181102) Add linux-next specific files for 20181102
>>
>> I'll let you know once I figure it out.
> 
> Could it be related to potentially old U-Boot etc.. on the board I am using?

No, I don't think so (however, you should only use latest greatest of
course :-) ).

I see this on next/master, but not on next/20181224 right now, so I'm
bisecting it down.

-- 
Best regards,
Marek Vasut
