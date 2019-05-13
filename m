From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: interrupt-controller: Update csky
 mpintc
Date: Mon, 13 May 2019 12:49:31 -0500
Message-ID: <20190513174931.GA19167@bogus>
References: <1557741339-29331-1-git-send-email-guoren@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557741339-29331-1-git-send-email-guoren@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jason@lakedaemon.net, tglx@linutronix.de, guoren@kernel.org, ren_guo@c-sky.com
List-Id: devicetree@vger.kernel.org

On Mon, 13 May 2019 17:55:38 +0800, guoren@kernel.org wrote:
> From: Guo Ren <ren_guo@c-sky.com>
> 
> Add trigger type and priority setting for csky,mpintc. The driver also
> could support #interrupt-cells <1> and it wouldn't invalidate existing
> DTs. Here we only show the complete format.
> 
> Changes for V3:
>  - Update commit msg about compatible
> 
> Changes for V2:
>  - change #interrupt-cells to <3>
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  .../bindings/interrupt-controller/csky,mpintc.txt   | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
