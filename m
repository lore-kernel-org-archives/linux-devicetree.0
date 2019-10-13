From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RESEND PATCH] thermal: mediatek: add suspend/resume callback
Date: Sun, 13 Oct 2019 19:50:37 +0200
Message-ID: <a0af0b72-dbc3-f284-34b7-fc94bbe349a4@linaro.org>
References: <1570613704-16609-1-git-send-email-michael.kao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570613704-16609-1-git-send-email-michael.kao@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: michael.kao@mediatek.com, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Louis Yu <louis.yu@mediatek.com>
List-Id: devicetree@vger.kernel.org

On 09/10/2019 11:35, michael.kao@mediatek.com wrote:
> From: Louis Yu <louis.yu@mediatek.com>
> 
> Add suspend/resume callback to disable/enable Mediatek thermal sensor
> respectively. Since thermal power domain is off in suspend, thermal driver
> needs re-initialization during resume.
> 
> Signed-off-by: Louis Yu <louis.yu@mediatek.com>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> ---
> This patch series base on these patches [1][2].
> 
> [1]thermal: mediatek: mt8183: fix bank number settings (https://patchwork.kernel.org/patch/10938817/)
> [2]thermal: mediatek: add another get_temp ops for thermal sensors (https://patchwork.kernel.org/patch/10938829/)

There is no new version with the comments take into account. Did I miss
something?


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
