From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 2/5] drm: bridge: add API to query the expected input
 formats of bridges
Date: Tue, 27 Mar 2018 15:04:42 +0200
Message-ID: <f35fb82a-d098-475c-4daf-cc2800a70c91@axentia.se>
References: <20180326212447.7380-1-peda@axentia.se>
 <20180326212447.7380-3-peda@axentia.se> <20180327094743.GL27746@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180327094743.GL27746@w540>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2018-03-27 11:47, jacopo mondi wrote:
>> + * RETURNS:
>> + * The number of bus input formats the bridge accepts. Zero means that
>> + * the chain of bridges are not converting the bus format and that the
>> + * format of the drm_connector should be used.
> 
> How do we get to the connector format from a bridge that has maybe
> other components in between in the pipeline?

Forgot to write something here in my previous reply, sorry...

The chain of bridges do not end with the connector in the in-kernel
representation, IIUC. So, I think it is up to the caller to find the
format desired by the connector. See patch [5/5] for an example.

Maybe the connector should be passed in as an argument?

Cheers,
Peter
