From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: qcom: Various fixes for MSM8960's global clock
 controller
Date: Wed, 30 Apr 2014 12:14:23 -0700
Message-ID: <20140430191423.5718.27549@quantum>
References: <1396629176-7413-1-git-send-email-galak@codeaurora.org>
 <20140429065114.7224.13620@quantum> <20140430155308.GE20486@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140430155308.GE20486@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2014-04-30 08:53:08)
> On 04/28, Mike Turquette wrote:
> > Quoting Kumar Gala (2014-04-04 09:32:56)
> > > diff --git a/include/dt-bindings/clock/qcom,gcc-msm8960.h b/include/dt-bindings/clock/qcom,gcc-msm8960.h
> > > index 03bbf49..f9f5471 100644
> > > --- a/include/dt-bindings/clock/qcom,gcc-msm8960.h
> > > +++ b/include/dt-bindings/clock/qcom,gcc-msm8960.h
> > > @@ -51,7 +51,7 @@
> > >  #define QDSS_TSCTR_CLK                         34
> > >  #define SFAB_ADM0_M0_A_CLK                     35
> > >  #define SFAB_ADM0_M1_A_CLK                     36
> > > -#define SFAB_ADM0_M2_A_CLK                     37
> > > +#define SFAB_ADM0_M2_H_CLK                     37
> > 
> > Technically these changes break backwards compatibility, but I guess
> > that field updates to newer kernel images for this SoC are not a
> > concern?
> 
> I thought only the number was the ABI. The #defines are just here
> to make it easier to speak about the same numbers in the driver
> and the DT. Technically we could have made two #defines for 37
> but since nobody is using it so far, it seems easier to just
> rename it.

It makes sense for the number to be the ABI, but I've never gone digging
into the dtb format. Either way this change was taken in yesterday so no
big deal.

Regards,
Mike

> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> hosted by The Linux Foundation
