From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Lenovo Miix 630
Date: Fri, 12 Apr 2019 15:47:13 +0100
Message-ID: <20190412144712.GA7481@lakrids.cambridge.arm.com>
References: <20190411205144.43557-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190411205144.43557-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: bjorn.andersson@linaro.org, agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, lee.jones@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2019 at 01:51:44PM -0700, Jeffrey Hugo wrote:
> This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> functionality includes USB (host), microSD-card, keyboard, and trackpad.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
> 
> v2:
> -Changed "cls" to "clam" since feedback indicated "cls" is too opaque, but
> "clamshell" is a mouthfull.  "clam" seems to be a happy medium.

Please use "clamshell". The extra 5 characters aren't going to hurt
anyone, and it avoids having yet another short name just confuses
matters further.

[...]

> +	keyboard@3a {
> +		/* QTEC0001 is the ACPI HID, which could be used for quirks */
> +		compatible = "QTEC0001", "hid-over-i2c";

As mentioned last time, please drop the ACPI HID, and allocate a real
compatible string.

Thanks,
Mark.
