From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/8] arm64: dts: db820c: add basic board support
Date: Wed, 22 Jun 2016 14:06:21 +0100
Message-ID: <20160622130621.GB28950@leverpostej>
References: <1466529769-2674-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1466529769-2674-2-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466529769-2674-2-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 21, 2016 at 06:22:42PM +0100, Srinivas Kandagatla wrote:
> +	chosen {
> +		stdout-path = "serial0";
> +	};

Please add the configuration (e.g. make this "serial0:115200n8"), as per
Documentation/devicetree/bindings/chosen.txt, so that we're not relying
on implicit defaults.

Otherwise this looks ok.

Thanks,
Mark.
