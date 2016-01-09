From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] Documentation: gpio: Update description for
 X-Gene standby GPIO controller DTS binding
Date: Sat, 9 Jan 2016 16:28:10 -0600
Message-ID: <20160109222810.GA11205@rob-hp-laptop>
References: <1452162428-26839-1-git-send-email-qnguyen@apm.com>
 <1452162428-26839-3-git-send-email-qnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452162428-26839-3-git-send-email-qnguyen@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Quan Nguyen <qnguyen@apm.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Duc Dang <dhdang@apm.com>, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 07, 2016 at 05:27:07PM +0700, Quan Nguyen wrote:
> Update description for X-Gene standby GPIO controller DTS binding to
> support GPIO line configuration as input, output or external IRQ pin.
> 
> Signed-off-by: Y Vo <yvo@apm.com>
> Signed-off-by: Quan Nguyen <qnguyen@apm.com>
> ---
>  .../devicetree/bindings/gpio/gpio-xgene-sb.txt     | 49 +++++++++++++++++-----
>  1 file changed, 38 insertions(+), 11 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
