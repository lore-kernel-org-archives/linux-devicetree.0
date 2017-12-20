From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: pwm: renesas-tpu: Correct SoC part
 numbers and family names
Date: Wed, 20 Dec 2017 15:19:59 -0600
Message-ID: <20171220211959.smakfeyyynvsoiaz@rob-hp-laptop>
References: <1513699327-27357-1-git-send-email-geert+renesas@glider.be>
 <1513699327-27357-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pwm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513699327-27357-4-git-send-email-geert+renesas@glider.be>
Sender: linux-pwm-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 05:02:07PM +0100, Geert Uytterhoeven wrote:
> R8A73A4 (not R8A77A4) is R-Mobile APE6,
> R8A7740 is R-Mobile (not R-Car) A1.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
