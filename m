From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] arm64: dts: msm8996: fix blsp2_uart1 4-pin pinconfig
Date: Mon, 11 Feb 2019 10:37:01 +0100
Message-ID: <20190211093701.GX4686@localhost>
References: <20181220161750.12587-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181220161750.12587-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 20, 2018 at 05:17:50PM +0100, Johan Hovold wrote:
> Fix "gpiio5" typo in the (currently unused) blsp2_uart1 4-pin sleep
> config.
> 
> Fixes: 22e6789f9493 ("arm64: dts: msm8996: add blsp2_uart1 pinctrl")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>

I can't seem to find this one in your tree (or linux-next), Andy. Lost
or simply not applied yet?

Johan
