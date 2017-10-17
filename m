From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy: Add RX equalizer properties for
 Broadcom SATA PHY
Date: Tue, 17 Oct 2017 15:26:13 -0500
Message-ID: <20171017202613.2ut6upxxs6acuy3t@rob-hp-laptop>
References: <20171012005312.17363-1-f.fainelli@gmail.com>
 <20171012005312.17363-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171012005312.17363-2-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Ray Jui <ray.jui@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Viresh Kumar <viresh.kumar@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Dan Carpenter <dan.carpenter@oracle.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Wed, Oct 11, 2017 at 05:53:10PM -0700, Florian Fainelli wrote:
> Define two new properties: brcm,rx-aeq-mode which allows configuring the
> SATA PHY RX equalizers and when "manual" is used, brcm,rx-aeq can be
> used to set the exact value.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/brcm-sata-phy.txt | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
