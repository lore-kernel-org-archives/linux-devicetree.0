From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] Documentation: of: fix typo in graph bindings
Date: Mon, 05 Jan 2015 11:37:31 +0100
Message-ID: <1420454251.3180.20.camel@pengutronix.de>
References: <1420452136-76466-1-git-send-email-xiakaixu@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420452136-76466-1-git-send-email-xiakaixu@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kaixu Xia <xiakaixu@huawei.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kaixu.xia@linaro.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 05.01.2015, 18:02 +0800 schrieb Kaixu Xia:
> Just fix a minor typo about the example path.
> 
> Signed-off-by: Kaixu Xia <xiakaixu@huawei.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

thanks
Philipp

> ---
>  Documentation/devicetree/bindings/graph.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/graph.txt b/Documentation/devicetree/bindings/graph.txt
> index 1a69c07..fcb1c6a 100644
> --- a/Documentation/devicetree/bindings/graph.txt
> +++ b/Documentation/devicetree/bindings/graph.txt
> @@ -19,7 +19,7 @@ type of the connections, they just map their existence. Specific properties
>  may be described by specialized bindings depending on the type of connection.
>  
>  To see how this binding applies to video pipelines, for example, see
> -Documentation/device-tree/bindings/media/video-interfaces.txt.
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
>  Here the ports describe data interfaces, and the links between them are
>  the connecting data buses. A single port with multiple connections can
>  correspond to multiple devices being connected to the same physical bus.
