From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: sound: add devicetree document for
 rt5616
Date: Tue, 22 Dec 2015 18:37:22 -0600
Message-ID: <20151223003722.GA21083@rob-hp-laptop>
References: <1450763103-21073-1-git-send-email-wxt@rock-chips.com>
 <1450763103-21073-2-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450763103-21073-2-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: broonie@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.or, heiko@sntech.de, bardliao@realtek.com
List-Id: devicetree@vger.kernel.org

On Tue, Dec 22, 2015 at 01:45:03PM +0800, Caesar Wang wrote:
> Add the description for rt5616 codec.
> 
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - As Frank comments, rt5616@1b to instead of rt5616.
> - Update the Pins device from Bard.
> 
> Changes in v1:
> - As Heiko comments, remove the not exist option properties.

> 
>  Documentation/devicetree/bindings/sound/rt5616.txt | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/rt5616.txt

Acked-by: Rob Herring <robh@kernel.org>
