From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v4 0/5] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Thu, 7 May 2015 13:57:53 +0100
Message-ID: <20150507125752.GE22115@arm.com>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>
 <20150507090210.GB22115@arm.com> <554B305F.4080907@huawei.com>
 <20150507112536.GD22115@arm.com> <554B542B.6040006@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <554B542B.6040006@huawei.com>
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>, "btw@mail.itp.ac.cn" <btw@mail.itp.ac.cn>, Catalin Marinas <Catalin.Marinas@arm.com>, "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>, "tyler.baker@linaro.org" <tyler.baker@linaro.org>, "huxinwei@huawei.com" <huxinwei@huawei.com>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>, "yanhaifeng@gmail.com" <yanhaifeng@gmail.com>, "rob.herring@linaro.org" <rob.herring@linaro.org>, "mturquette@linaro.org" <mturquette@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "khilman@kernel.org" <khilman@kernel.org>, "victor.lixin@hisilicon.com" <victor.lixin@hisilicon.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>, "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.co>
List-Id: devicetree@vger.kernel.org

On Thu, May 07, 2015 at 01:01:47PM +0100, Bintian wrote:
> On 2015/5/7 19:25, Will Deacon wrote:
> > On Thu, May 07, 2015 at 10:29:03AM +0100, Bintian wrote:
> >> Hikey is a low cost board, I think it doesn't have an automatic thermal
> >> cut out; I always use HiKey to test my patch, in the normal case,
> >> temperature is not a problem.
> >
> > I don't see why the cost has anything to do with this issue; any money I
> > save on the board will quickly be re-invested in my increased insurance
> > premium.
> >
> > All I think we need is for secure software to keep an eye on the temperature
> > and hit the power controller if it goes over some `fatal' threshold.
> > Ideally, you'd be able to use a secure interrupt for this, but I suspect
> > that you don't have the right hardware features for that (please correct me
> > if I'm wrong). An alternative would be to hang something off a secure timer
> > and get the firmware to check the board temperature on some low-frequency
> > periodic tick.
> If there is exception occurred on A core, there are two methods to
> handle it:
> (1) Delay for a period of time, watchdog will trigger the system reset.
> (2) If the temperature is over 105 degree, the CPU will trigger reset(I
> guess it's chip level).

Aha, so now you're saying that there *is* a hardware shut-off at 105
degrees, regardless of what the kernel is doing? If that's the case, then
we're fine and the current patches make sense in isolation.

Cheers,

Will
