From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v5 01/44] dt-bindings: clock: Add new bindings for TI
 Davinci PLL clocks
Date: Tue, 16 Jan 2018 16:52:53 +0530
Message-ID: <8184c7b5-5f82-5590-9caf-fd038e1d07ac@ti.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <ebd677dc-44a4-5053-2509-e3ee948ccf98@ti.com>
 <22409e49-5c14-4068-b137-7535afaf90d7@lechnology.com>
 <0f90b5f7-f21e-5f81-1154-9a815bbb786d@ti.com>
 <ba7fa842-cfc5-6f6f-f9bf-09c74ab08ec2@lechnology.com>
 <5aacc350-6236-2e4f-35bb-a681fc9d47e7@ti.com>
 <CAHCN7x+ZYezmEU_0mF=6_gF14DZxKnuDp1Cx=aC2=eN_QLNdJQ@mail.gmail.com>
 <fd162516-cddc-e857-ce60-2cd89303971e@lechnology.com>
 <CAHCN7xKORFriQ2Gjx85OsCUzHO-mavCQXLOzh5D3n4kEG=i-Yg@mail.gmail.com>
 <40501635-6f5b-20c9-f8bc-d17e26b58426@lechnology.com>
 <CAHCN7xL=h_g6HK2ey82r_w5qRbXg9+68Og+84YUYuePsjYd-Vg@mail.gmail.com>
 <f20267f2-be4c-e031-1c5f-76490164c60d@lechnology.com>
 <CAHCN7x+G5pxOeD7TahqiQUePEu1Z4Hyinkjq_bcSM+Hz36xoSg@mail.gmail.com>
 <a79184c5-3e28-bbac-0783-992615d49fae@lechnology.com>
 <CAHCN7x+EtQs6NHAYbVga7vU1U+qQLqOxdf+1MW6HewaT+ZF_Xg@mail.gmail.com>
 <5832fd62-16aa-e167-7e52-2ce493e33cdc@lechnology.com>
 <CAHCN7xKV+Rwep3WiY2aS49iLu+oiZmjtUN2QK+E=hVkqdSPwhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAHCN7xKV+Rwep3WiY2aS49iLu+oiZmjtUN2QK+E=hVkqdSPwhw@mail.gmail.com>
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
To: Adam Ford <aford173@gmail.com>, David Lechner <david@lechnology.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Adam, David,

On Friday 12 January 2018 03:04 AM, Adam Ford wrote:
> Thanks for clarifying.  I was able to make it work with the following patch:
> 
> diff --git a/drivers/clk/davinci/psc-da850.c b/drivers/clk/davinci/psc-da850.c
> index 3b4583d..a76b8682 100644
> --- a/drivers/clk/davinci/psc-da850.c
> +++ b/drivers/clk/davinci/psc-da850.c
> @@ -25,7 +25,7 @@ static const struct davinci_psc_clk_info
> da850_psc0_info[] __initconst = {
>         LPSC(9, 0, uart0, pll0_sysclk2, 0),
>         LPSC(13, 0, pruss, pll0_sysclk2, 0),
>         LPSC(14, 0, arm, pll0_sysclk6, LPSC_ALWAYS_ENABLED),
> -       LPSC(15, 1, dsp, pll0_sysclk1, LPSC_FORCE | LPSC_LOCAL_RESET),
> +       LPSC(15, 1, dsp, pll0_sysclk1, LPSC_FORCE | LPSC_LOCAL_RESET |
> LPSC_ALWAYS_ENABLED),

Keeping the DSP clock always enabled was not needed earlier AFAICS, so
this needs to be investigated.

Thanks,
Sekhar
