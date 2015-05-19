From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 4/5] clk: hi6220: Clock driver support for Hisilicon
 hi6220 SoC
Date: Tue, 19 May 2015 13:35:07 -0700
Message-ID: <555B9E7B.9000809@codeaurora.org>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>	<1430827599-11560-5-git-send-email-bintian.wang@huawei.com>	<20150515002527.GD31753@codeaurora.org>	<5555A37B.1090105@huawei.com>	<20150515193041.GO31753@codeaurora.org> <CAAS=xmjsFoQg-HgWA5-e=cF3qF+PcVNc3i_3Z5EBPNJ2HyOZKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAS=xmjsFoQg-HgWA5-e=cF3qF+PcVNc3i_3Z5EBPNJ2HyOZKQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brent Wang <wangbintian@gmail.com>
Cc: Bintian <bintian.wang@huawei.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kevin Hilman <khilman@linaro.org>, Mike Turquette <mturquette@linaro.org>, Rob Herring <rob.herring@linaro.org>, Zhangfei Gao <zhangfei.gao@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Xu Wei <xuwei5@hisilicon.com>, Jaehoon Chung <jh80.chung@samsung.com>, Olof Johansson <olof@lixom.net>, Haifeng Yan <yanhaifeng@gmail.com>, "xuejiancheng@huawei.com" <xuejiancheng@huawei.com>, sledge.
List-Id: devicetree@vger.kernel.org

On 05/15/15 19:54, Brent Wang wrote:
>
>>> How about just send this patch for review not the whole patch set in
>>> next version?
>>>
>> Yes a single patch is fine. I take it you want the patch to go
>> through arm-soc with some Ack from us?
> Yes, exactly.
> The dts file includes the clock head file,  this patch goes through
> arm-soc is a good choice.

One way to avoid that problem is to split the clock header file into its
own patch and then duplicate that patch in two trees, one that goes
through arm-soc and one that goes through clk.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
