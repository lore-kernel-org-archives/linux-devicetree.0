From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
Date: Wed, 2 Oct 2019 11:19:50 +0200
Message-ID: <20191002091950.GA9393@centauri>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
 <CAOCk7NptTHPOdyEkCAofjTPuDQ5dsnPMQgfC0R8=7cp05xKQiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOCk7NptTHPOdyEkCAofjTPuDQ5dsnPMQgfC0R8=7cp05xKQiA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, lkml <linux-kernel@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Sibi Sankar <sibis@codeaurora.org>, daniel.lezcano@linaro.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 30, 2019 at 04:20:15PM -0600, Jeffrey Hugo wrote:
> Amit, the merged version of the below change causes a boot failure
> (nasty hang, sometimes with RCU stalls) on the msm8998 laptops.  Oddly
> enough, it seems to be resolved if I remove the cpu-idle-states
> property from one of the cpu nodes.
> 
> I see no issues with the msm8998 MTP.

Hello Jeffrey, Amit,

If the PSCI idle states work properly on the msm8998 devboard (MTP),
but causes crashes on msm8998 laptops, the only logical change is
that the PSCI firmware is different between the two devices.


Kind regards,
Niklas
