From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: update binding document exynos-dw-mshc.txt
Date: Thu, 29 Aug 2013 10:29:36 -0700
Message-ID: <CAD=FV=V8dW0RBoUCR5rg=JgP8TtivzP14HHiVkCucXLyfF-FmQ@mail.gmail.com>
References: <1377777238-25087-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1377777238-25087-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, pawel.moll@arm.com, mark.rutland@arm.com, Stephen Warren <swarren@wwwdotorg.org>, ian.campbell@citrix.com, Tomasz Figa <t.figa@samsung.com>, Chris Ball <cjb@laptop.org>, Thomas Abraham <thomas.abraham@linaro.org>, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
List-Id: devicetree@vger.kernel.org

Yavaraj,

On Thu, Aug 29, 2013 at 4:53 AM, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com> wrote:
> This patch updates the exynos-dw-mshc.txt.Currently we are using
> "pinctrl" binding property to describe the CMD and DATA line's
> of Mobile Storage Host Controller(mshc) node.
>
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
> ---
>  .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |   34 ++++++++++----------
>  1 file changed, 17 insertions(+), 17 deletions(-)

This looks good to me, though it's hard to apply since you made this
patch atop the change that added the "5420" property, but you don't
reference that patch anywhere.  I also wouldn't have tagged this "ARM:
dts", since this doesn't actually update a "dts" file.  I'd probably
tag it "mmc: dw_mmc:".  You should probably re-spin for that.

Aside from that this looks fine to me.

Reviewed-by: Doug Anderson <dianders@chromium.org>
