From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v1 6/7] arm64: dts: sdm845: Increase alert trip point to
 95 degrees
Date: Fri, 11 Jan 2019 09:02:16 +0530
Message-ID: <20190111033216.u3ic5it3lygot4sb@vireshk-i7>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
 <041258d65883df964890249a24d2a4788c419304.1547078153.git.amit.kucheria@linaro.org>
 <20190110011533.GV261387@google.com>
 <20190110021522.GW261387@google.com>
 <CAHLCerM+p+GkVsR_WuC0xF1oFvj=8cZ+OmU=pMssfZGGs-eS7w@mail.gmail.com>
 <20190110200034.GZ261387@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110200034.GZ261387@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Taniya Das <tdas@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10-01-19, 12:00, Matthias Kaehlcke wrote:
> Viresh helped me understand that we currently need to add cooling
> device entries for all CPUs to the DT, even though at most one will be
> active per freq domain at any time (I wonder if this could be changed
> though).

Actually we were only adding cooling-cells in CPU0 until now and I
fixed that, so that is going to stay :)

The idea is that the hardware should be described properly and not
partially. Even if all the CPUs are part of the same freq-domain, they
are all capable of being a cooling device here and the DT should
describe that. Kernel will ofcourse create a single cooling device.

-- 
viresh
