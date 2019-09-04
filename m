From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Date: Wed, 4 Sep 2019 15:12:57 +0100
Message-ID: <20190904141257.GB6144@bogus>
References: <20190904121606.17474-1-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190904121606.17474-1-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 04, 2019 at 01:16:06PM +0100, Lee Jones wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> The Lenovo Yoga C630 is built on the SDM850 from Qualcomm, but this seem
> to be similar enough to the SDM845 that we can reuse the sdm845.dtsi.
>
> Supported by this patch is: keyboard, battery monitoring, UFS storage,
> USB host and Bluetooth.
>

Just curious to know if the idea of booting using ACPI is completely
dropped as it's extremely difficult(because the firmware is so hacked
up and may violate spec, just my opinion) for whatever reasons.

We just made ACPI table version checking more lenient for this platform
and would be good to know if we continue to run ACPI on that or will
abandon and just use DT.

--
Regards,
Sudeep
