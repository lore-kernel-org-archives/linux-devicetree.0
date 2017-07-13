From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [RFC v2 5/6] drivers: boot_constraint: Add initial DT bindings
Date: Thu, 13 Jul 2017 15:21:21 +0530
Message-ID: <20170713095121.GH352@vireshk-i7>
References: <cover.1499770771.git.viresh.kumar@linaro.org>
 <0610277aef9830cff53b7b53cf41cc54886fdc7f.1499770771.git.viresh.kumar@linaro.org>
 <CAL_Jsq+oAB3gejRMXuY0q9+Et4GrtvF3RwGzPNJ08TPooVyXJg@mail.gmail.com>
 <CAGb2v67XtUcqdjMt-Ln6zn3ShH4JFmjkK4bPSpUNZpJqnmwivw@mail.gmail.com>
 <20170713050934.GB352@vireshk-i7>
 <CAGb2v67pjFRTq56DE+2xCnnKhxa_1u6RdoxbwXznkg6EJ3=X9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67pjFRTq56DE+2xCnnKhxa_1u6RdoxbwXznkg6EJ3=X9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Shiraz Hashim <shashim@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 13-07-17, 17:46, Chen-Yu Tsai wrote:
> This makes more sense. The LCD being able to do DVFS was missing from the last
> discussion. I assume this is for power saving purposes?

Yeah.

> Otherwise one could just
> say you should not use the lower part of the voltage range. And DVFS is for the
> controller's core logic and not I/O?

Yeah.

But for many such cases in different platforms, the LCD controller may
not do DVFS. But we still need to make sure its clk, regulator and
power domain are enabled until the time the driver comes up. This
series would also help in doing proxy-voting for all such resources,
so that they don't get disabled while being used.

-- 
viresh
