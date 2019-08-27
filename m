From: Rob Herring <robh@kernel.org>
Subject: Re: [v4 1/2] dt/bindings: display: Add optional property node define
 for Mali DP500
Date: Tue, 27 Aug 2019 15:07:53 -0500
Message-ID: <20190827200753.GA5081@bogus>
References: <20190822021135.10288-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190822021135.10288-1-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-devel@linux.nxdi.nxp.com, Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, 22 Aug 2019 10:11:34 +0800, Wen He wrote:
> Add optional property node 'arm,malidp-arqos-value' for the Mali DP500.
> This property describe the ARQoS levels of DP500's QoS signaling.
> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> ---
>  Documentation/devicetree/bindings/display/arm,malidp.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
