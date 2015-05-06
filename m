From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Wed, 6 May 2015 11:55:58 +0100
Message-ID: <20150506104856.GC707@leverpostej>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>
 <1430827599-11560-6-git-send-email-bintian.wang@huawei.com>
 <20150505171349.GA30215@leverpostej> <5549877C.10408@huawei.com>
 <5549B9CC.1040709@huawei.com> <20150506093022.GB31001@leverpostej>
 <5549EE97.3020801@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5549EE97.3020801@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bintian <bintian.wang@huawei.com>
Cc: "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>, "btw@mail.itp.ac.cn" <btw@mail.itp.ac.cn>, Catalin Marinas <Catalin.Marinas@arm.com>, "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>, Will Deacon <Will.Deacon@arm.com>, "huxinwei@huawei.com" <huxinwei@huawei.com>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>, "yanhaifeng@gmail.com" <yanhaifeng@gmail.com>, "rob.herring@linaro.org" <rob.herring@linaro.org>, "mturquette@linaro.org" <mturquette@linaro.org>, Pawel Moll <Pawel.Moll@arm.com>, "khilman@kernel.org" <khilman@kernel.org>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>, "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>, "heyunlei@huawei.com" <heyunlei@huawei.com>, "w.f@huawei.com" <w.f@huawei.com>"zhangfei.gao@linaro.org" <zh>
List-Id: devicetree@vger.kernel.org

Hi,

> > I think that given that we know the UART is not quite a PL011 we should
> > add an additional compatible string just in case some difference crops
> > up later that is problematic.
> >
> > So we'd have something like:
> >
> > 	compatible = "hisilicon,hi6220-uart", "arm,pl011", "arm,primecell";
> >
> > That way we can add any optimisations or workarounds later as required.
> I understand and thanks for your suggestion.
> 
> Can I do not do this work in this patch set? Because I got the
> information UART0 is PL011 compatible. Hisilicon uart engineer can do
> this work in the future, maybe for UART1/UART2.

I am not asking you to do any driver work for this -- the current driver
should ignore the "hisilicon,hi6220-uart" string and recognise
"arm,pl011".

I am only asking you to add the additional string to the DTS, and to
update the binding document to list the new string. That way if and when
we need the kernel to distinguish between a regular PL011 and the
hi6220-specific variant, the DTB does not need to be updated in order to
do so.

Is UART 0 different from UART1 and UART2?

Thanks,
Mark.
