From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add regulators for LeMaker BananaPi
Date: Thu, 24 Sep 2015 10:57:11 -0700
Message-ID: <CAMAWPa-Q7o+Ys2FjhLZt6Nwq=Ja6TTdWFDZFTCYLkoLGjpLpxw@mail.gmail.com>
References: <1438532305-5884-1-git-send-email-public_timo.s@silentcreek.de>
	<20150818153631.GH2547@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150818153631.GH2547@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Timo Sigurdsson <public_timo.s@silentcreek.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>, Tyler Baker <tyler.baker@linaro.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 18, 2015 at 8:36 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Sun, Aug 02, 2015 at 06:18:25PM +0200, Timo Sigurdsson wrote:
>> sun7i-a20-bananapi.dts doesn't contain regulator nodes for the AXP209 PMU
>> driver, so add them to allow for voltage-scaling with cpufreq-dt.
>>
>> Signed-off-by: Timo Sigurdsson <public_timo.s@silentcreek.de>
>
> Queued, thanks!
> Maxime

kernelci.org started finding boot faiulres[1] on bananapi linux-next
around next-20150918, but it was only failing in some labs and not
others.  I finally bisected it down to this patch, which landed in
linux-next in the form of 2d665a8a8350 ARM: dts: sunxi: Add regulators
for LeMaker BananaPi.  Reverting that commit on top of next-20150923
gets my bananapi booting again.

Note it's kind of an interesting boot failure.  The kernel boots fully
to a shell, but panics after running a few commands.  In particular
'dmesg -n1' seems to trigger it usually[2].

Kevin

[1] http://kernelci.org/boot/sun7i-a20-bananapi/job/next/kernel/next-20150923/defconfig/multi_v7_defconfig/lab/lab-khilman/?_id=5602504359b514be146c326f
[2] http://storage.kernelci.org/next/next-20150923/arm-multi_v7_defconfig/lab-khilman/boot-sun7i-a20-bananapi.html
