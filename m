From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 0/5] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Wed, 13 May 2015 11:19:28 +0200
Message-ID: <3248923.PjrRTtAClR@wuerfel>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>
 <5552FE59.30505@huawei.com> <20150513091644.GA1564@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150513091644.GA1564@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>, "btw@mail.itp.ac.cn" <btw@mail.itp.ac.cn>, Catalin Marinas <Catalin.Marinas@arm.com>, "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>, "tyler.baker@linaro.org" <tyler.baker@linaro.org>, "huxinwei@huawei.com" <huxinwei@huawei.com>, "khilman@linaro.org" <khilman@linaro.org>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>, "yanhaifeng@gmail.com" <yanhaifeng@gmail.com>, "rob.herring@linaro.org" <rob.herring@linaro.org>, "mturquette@linaro.org" <mturquette@linaro.org>, "khilman@kernel.org" <khilman@kernel.org>, "victor.lixin@hisilicon.com" <victor.lixin@hisilicon.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>, "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@h>
List-Id: devicetree@vger.kernel.org

On Wednesday 13 May 2015 10:16:44 Will Deacon wrote:
> On Wed, May 13, 2015 at 08:33:45AM +0100, Bintian wrote:
> > Any other suggestions for this patch set?
> 
> You sent a v5, right, so this version (4) has been superseded?
> The patches should all go via arm-soc once you've got the relevant acks
> in place (I don't think you need anything from me or Catalin -- the Kconfig
> changes are trivial).
> 
> 

To be more specific here, I expect the patches to be picked up by Wei Xu
and forwarded to arm@kernel.org when he's made sure that everybody
including himself is happy with the outcome.

	Arnd
