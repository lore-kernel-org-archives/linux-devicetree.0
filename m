From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/3] Documentation: gpio: Update description for
 X-Gene standby GPIO controller DTS binding
Date: Thu, 28 Jan 2016 20:46:06 -0600
Message-ID: <20160129024606.GA18663@rob-hp-laptop>
References: <1453792935-19916-1-git-send-email-qnguyen@apm.com>
 <1453792935-19916-3-git-send-email-qnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453792935-19916-3-git-send-email-qnguyen@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Quan Nguyen <qnguyen@apm.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Duc Dang <dhdang@apm.com>, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Tue, Jan 26, 2016 at 02:22:14PM +0700, Quan Nguyen wrote:
> Update description for X-Gene standby GPIO controller DTS binding to
> support GPIO line configuration as input, output or external IRQ pin.
> 
> Signed-off-by: Y Vo <yvo@apm.com>
> Signed-off-by: Quan Nguyen <qnguyen@apm.com>
> ---
>  .../devicetree/bindings/gpio/gpio-xgene-sb.txt     | 39 ++++++++++++++++++----
>  1 file changed, 33 insertions(+), 6 deletions(-)

Did you change something here? I've already acked this. Please add acks 
when posting new versions.

Rob
