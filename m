From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/5] arm64: dts: apq8016-sbc: move sdhci node under soc node
Date: Tue, 12 Jan 2016 15:00:30 +0100
Message-ID: <18094818.3Fy0P66y0u@wuerfel>
References: <1452606358-24569-1-git-send-email-srinivas.kandagatla@linaro.org> <1452606412-24659-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1452606412-24659-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 12 January 2016 13:46:52 Srinivas Kandagatla wrote:
> To be consistent with other nodes move sdhci node under the soc node,
> rather than using lable references.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 

Maybe remove the label as well if you are no longer using it?

	Arnd
