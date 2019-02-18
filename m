From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: rtc: add ABEOZ9 support
Date: Mon, 18 Feb 2019 09:46:07 -0600
Message-ID: <20190218154607.GA651@bogus>
References: <20190217185321.2189-1-panfilov.artyom@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190217185321.2189-1-panfilov.artyom@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Artem Panfilov <panfilov.artyom@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 17 Feb 2019 21:53:21 +0300, Artem Panfilov wrote:
> Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
