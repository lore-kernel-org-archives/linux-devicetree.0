From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v2 25/25] arm64: dts: apq8016-sbc: Add HDMI display
 support
Date: Fri, 26 Aug 2016 00:34:08 -0500
Message-ID: <20160826053408.GC24683@hector.attlocal.net>
References: <1466077007-26792-1-git-send-email-architt@codeaurora.org>
 <1466691210-22779-1-git-send-email-architt@codeaurora.org>
 <1466691210-22779-26-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466691210-22779-26-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: robdclark@gmail.com, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 23, 2016 at 07:43:30PM +0530, Archit Taneja wrote:
> The APQ8016-sbc provides a HDMI output. The APQ8016 display block only
> provides a MIPI DSI output. So, the board has a ADV7533 DSI to HDMI
> encoder chip that sits between the DSI PHY output and the HDMI
> connector.
> 
> Add the ADV7533 DT node under its I2C control bus, and tie the DSI
> output port to the ADV7533's input port.
> 
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>

This also looks fine.

Regards,

Andy
