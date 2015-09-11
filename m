From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/9] dmaengine: st_fdma: Add STMicroelectronics FDMA DT binding documentation
Date: Fri, 11 Sep 2015 22:36 +0200
Message-ID: <51503956.PMFrWKUjxX@wuerfel>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org> <1441980871-24475-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441980871-24475-2-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, devicetree@vger.kernel.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, lee.jones@linaro.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

On Friday 11 September 2015 15:14:23 Peter Griffin wrote:
> +- st,fdma-id	: Must contain fdma controller number

What for?
> +Example:
> +
> +	fdma1: fdma-app@8e40000 {

The name should be "dma-controller", not "fdma-app".

> +Example:
> +
> +	snd_uni_player2: snd-uni-player@2 {
> +		compatible = "st,snd_uni_player";

Maybe change the compatible string to "st,snd-uni-player"?

The string you use here would not be acceptable for a binding.

	Arnd
