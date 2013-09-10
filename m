From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v9 1/3] gpio: bcm281xx: Add GPIO driver
Date: Tue, 10 Sep 2013 14:02:43 -0600
Message-ID: <522F7AE3.6050105@wwwdotorg.org>
References: <1378836423-12467-1-git-send-email-markus.mayer@linaro.org>
 <1378836423-12467-2-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378836423-12467-2-git-send-email-markus.mayer@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Christian Daudt <csd@broadcom.com>, Tim Kryger <tim.kryger@linaro.org>, Markus Mayer <mmayer@broadcom.com>, Matt Porter <matt.porter@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 09/10/2013 12:07 PM, Markus Mayer wrote:
> From: Markus Mayer <mmayer@broadcom.com>
> 
> Add the GPIO driver for the Broadcom bcm281xx family of mobile SoCs.
> These GPIO controllers may contain up to 8 banks where each bank
> includes 32 pins that can be driven high or low and act as an edge
> sensitive interrupt.

The binding,
Reviewed-by: Stephen Warren <swarren@nvidia.com>

although ...

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-bcm-kona.txt b/Documentation/devicetree/bindings/gpio/gpio-bcm-kona.txt

> +This GPIO driver is used in the following Broadcom SoCs:
> +  BCM11130, BCM11140, BCM11351, BCM28145, BCM28155

Given that, I would expect the documentation of the compatible property
to enumerate the compatible values for all of those different chips,
although the driver could choose to only bind to e.g. brcm,bcm11351-gpio
or brcm,kona-gpio, since they're all compatible with it.
