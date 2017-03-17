From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v3 4/5] clk: hi6220: add debug APB clock
Date: Fri, 17 Mar 2017 23:22:24 +0800
Message-ID: <20170317152224.GB2020@leoy-linaro>
References: <1488520809-31670-1-git-send-email-leo.yan@linaro.org>
 <1488520809-31670-5-git-send-email-leo.yan@linaro.org>
 <20170303235808.GX25384@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170303235808.GX25384@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Fri, Mar 03, 2017 at 03:58:08PM -0800, Stephen Boyd wrote:
> On 03/03, Leo Yan wrote:
> > The debug APB clock is absent in hi6220 driver, so this patch is to add
> > support for it.
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> 
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>

I found this patch introduces regression on Hikey, after I enable
CPUIdle with this patch the kernel booting will hang. I committed a
new version patch:
https://patchwork.kernel.org/patch/9630931/

So please drop v3 patch and help review v4 patch. Really Sorry for
inconvinence.

Thanks,
Leo Yan
