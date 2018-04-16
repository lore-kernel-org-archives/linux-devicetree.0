From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: sunxi: Fix reference to driver
Date: Mon, 16 Apr 2018 10:07:26 -0500
Message-ID: <20180416150726.fitlgrgusr2iazhv@rob-hp-laptop>
References: <1523423823-9115-1-git-send-email-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523423823-9115-1-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: mark.rutland@arm.com, wens@csie.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 11, 2018 at 01:17:03AM -0400, Matheus Castello wrote:
> Bindings describe hardware, not drivers.
> Use reference to hardware Allwinner A1X Pin Controller instead driver.
> 
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> ---
>  .../devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Rob
