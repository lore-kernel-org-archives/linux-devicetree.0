From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: Move smem below hwlock
Date: Tue, 23 Feb 2016 22:00:48 -0800
Message-ID: <20160224060048.GJ21240@tuxbot>
References: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: andy.gross@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 23 Feb 09:21 PST 2016, Georgi Djakov wrote:

> When the SMEM is probed it defers as it depends on the hardware lock, which
> is not available yet. But the SMD bus and RPM regulators and clocks depend
> on SMEM and they defer too. The problem with this is that the order of
> registering the devices is not optimal and also we may end with messed
> up serial console as the RPM clocks are not registered yet..
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Not only do you need the probe order to be "correct", you also need some
luck to have the smd code execute its two workers to initialise the
rpmcc driver before your serial driver is probed. So I don't think we
should merge this upstream.


I tried this on my linux-next tree on db410c and it doesn't hide the
problem for me.

Regards,
Bjorn
