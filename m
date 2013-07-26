From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH RESEND 1/2] clk: mmp: use global clock lock
Date: Fri, 26 Jul 2013 10:42:45 +0800
Message-ID: <CAN1soZw7_3X5pdvp2M-Wp69=7Cr9bp4DDD0qMps4XT6u1s_9mQ@mail.gmail.com>
References: <20130716181029.C08D8FAAF3@dev.laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130716181029.C08D8FAAF3@dev.laptop.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Drake <dsd@laptop.org>
Cc: Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, pgf@laptop.org, Miao Eric <eric.y.miao@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2013 at 2:10 AM, Daniel Drake <dsd@laptop.org> wrote:
> The mmp platform shares a lock between different clock types, and all
> clocks are currently initialized by static bindings.
>
> Move this static/private lock into global context so that it can
> easily be shared by clocks that will be defined by the device tree in
> followup patches.
>
> Signed-off-by: Daniel Drake <dsd@laptop.org>
> ---
>  drivers/clk/mmp/Makefile   |   2 +-
>  drivers/clk/mmp/clk-apbc.c |  38 +++++----------
>  drivers/clk/mmp/clk-apmu.c |  20 ++------
>  drivers/clk/mmp/clk-mmp2.c | 116 ++++++++++++++++++++++-----------------------
>  drivers/clk/mmp/clk.h      |   8 ++--
>  drivers/clk/mmp/common.c   |  13 +++++
>  6 files changed, 92 insertions(+), 105 deletions(-)
>  create mode 100644 drivers/clk/mmp/common.c
>
> Resending after a month without review.
>

Currently lock is defined in pxa910, pxa168 & mmp2 clock driver. Only
one of these driver
could be active in real system. So I can't see any benefit to use the
shared clock lock among
these three drivers.

Regards
Haojian
