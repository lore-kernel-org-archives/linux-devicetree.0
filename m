From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: qualcomm: usb: Add Super-Speed PHY driver
Date: Wed, 30 Jan 2019 13:27:59 +0100
Message-ID: <61bdca18-cef9-3f02-45ef-5df4f96b4f2b@linaro.org>
References: <1548761715-4004-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548761715-4004-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190129202726.GA3036@builder>
 <fbd70494-e2f1-ae04-8b14-2cc97cead8b9@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fbd70494-e2f1-ae04-8b14-2cc97cead8b9@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, andy.gross@linaro.org, swboyd@chromium.org, shawn.guo@linaro.org, vkoul@kernel.org, khasim.mohammed@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 1/30/19 10:53, Jorge Ramirez wrote:

>> +	priv->vbus = devm_regulator_get_optional(priv->dev, "vbus");
> get_optional means that if vbus-supply is not found, rather than
> returning a dummy regulator object this will fail with -ENODEV.

on this subject, is it intentional that devm_reset_control_get_optional
behaves differently (ie, it returns a NULL if it cant be found)

IMO all *_get_optional should be semantically as well as functionally
equivalent to avoid confusions like the one I had.
