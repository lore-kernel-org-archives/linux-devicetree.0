From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] mfd: dt-bindings: Add rk808 PMIC reset property
Date: Mon, 9 Apr 2018 15:19:30 -0500
Message-ID: <20180409201930.urz35eovzffrx2mn@rob-hp-laptop>
References: <1522334683-22169-1-git-send-email-d.schultz@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522334683-22169-1-git-send-email-d.schultz@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Schultz <d.schultz@phytec.de>
Cc: mark.rutland@arm.com, heiko@sntech.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 29, 2018 at 04:44:43PM +0200, Daniel Schultz wrote:
> Add documentation about a new rk808 devicetree property. This can enable
> the rk805/rk808/rk818 PMIC reset, instead of using soft resets from the
> Control and Reset Module.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
> Changes:
> 	v2: Changed commit message
> 
>  Documentation/devicetree/bindings/mfd/rk808.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
