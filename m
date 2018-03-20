From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH v3 08/10] clk: qcom: Add ACD path to CPU clock driver for
 msm8996
Date: Tue, 20 Mar 2018 13:04:26 -0700
Message-ID: <152157626668.125118.4516232540705254181@swboyd.mtv.corp.google.com>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-9-git-send-email-ilialin@codeaurora.org>
 <152147863176.242365.17292287330283256524@swboyd.mtv.corp.google.com>
 <014101d3c054$52104460$f630cd20$@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <014101d3c054$52104460$f630cd20$@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ilialin@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, rnayak@codeaurora.org, robh@kernel.org, will.deacon@arm.com, amit.kucheria@linaro.org, tfinkel@codeaurora.org, nicolas.dechesne@linaro.org, celster@codeaurora.org
List-Id: devicetree@vger.kernel.org

Quoting ilialin@codeaurora.org (2018-03-20 07:04:05)
> > From: Stephen Boyd <sboyd@kernel.org>
> > Quoting Ilia Lin (2018-02-14 05:59:50)
> > 
> > >
> > >  static const u8 prim_pll_regs[PLL_OFF_MAX_REGS] = {
> > >         [PLL_OFF_L_VAL] = 0x04,
> > > @@ -399,10 +424,64 @@ struct clk_hw_clks {
> > >         return ret;
> > >  }
> > >
> > > +#define CPU_AFINITY_MASK 0xFFF
> > > +#define PWRCL_CPU_REG_MASK 0x3
> > > +#define PERFCL_CPU_REG_MASK 0x103
> > > +
> > > +/* ACD static settings (HMSS HPG 7.2.2) */ #define L2ACDCR_REG
> > > +0x580ULL #define L2ACDTD_REG 0x581ULL #define L2ACDDVMRC_REG
> > 0x584ULL
> > > +#define L2ACDSSCR_REG 0x589ULL #define ACDTD_VAL 0x00006A11
> > #define
> > > +ACDCR_VAL 0x002C5FFD #define ACDSSCR_VAL 0x00000601 #define
> > > +ACDDVMRC_VAL 0x000E0F0F
> > 
> > Please don't have #defines for random register settings. It just obfuscates
> > what's going on at the place where the define is used.
> 
> So should I just use the values directly?

Yes.
