From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v9 1/6] arm64: Enable Hisilicon ARMv8 SoC family in
 Kconfig and defconfig
Date: Tue, 2 Jun 2015 10:03:28 +0100
Message-ID: <20150602090328.GA22569@arm.com>
References: <1432950661-23060-1-git-send-email-bintian.wang@huawei.com>
 <1432950661-23060-2-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1432950661-23060-2-git-send-email-bintian.wang@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bintian Wang <bintian.wang@huawei.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>, "tyler.baker@linaro.org" <tyler.baker@linaro.org>, "huxinwei@huawei.com" <huxinwei@huawei.com>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>, "yanhaifeng@gmail.com" <yanhaifeng@gmail.com>, "rob.herring@linaro.org" <rob.herring@linaro.org>, "mturquette@linaro.org" <mturquette@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "wangbintian@gmail.com" <wangbintian@gmail.com>, "khilman@kernel.org" <khilman@kernel.org>, "victor.lixin@hisilicon.com" <victor.lixin@hisilicon.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>, "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisil>
List-Id: devicetree@vger.kernel.org

On Sat, May 30, 2015 at 02:50:56AM +0100, Bintian Wang wrote:
> This patch introduces ARCH_HISI to enable Hisilicon SoC family in
> Kconfig and defconfig.
> 
> Signed-off-by: Bintian Wang <bintian.wang@huawei.com>
> Acked-by: Haojian Zhuang <haojian.zhuang@linaro.org>
> Reviewed-by: Wei Xu <xuwei5@hisilicon.com>
> Tested-by: Will Deacon <will.deacon@arm.com>
> Tested-by: Tyler Baker <tyler.baker@linaro.org>
> Tested-by: Kevin Hilman <khilman@linaro.org>
> ---
>  arch/arm64/Kconfig           |    5 +++++
>  arch/arm64/configs/defconfig |    1 +
>  2 files changed, 6 insertions(+)

Acked-by: Will Deacon <will.deacon@arm.com>

Will
