From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 4/5] ARM: davinci: enable LEDs default-on trigger in
 default config
Date: Thu, 27 Oct 2016 16:59:56 +0530
Message-ID: <669b14c2-7f62-35bc-c8a3-6dde05a99fb1@ti.com>
References: <1477075018-20176-1-git-send-email-david@lechnology.com>
 <1477075018-20176-5-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1477075018-20176-5-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Saturday 22 October 2016 12:06 AM, David Lechner wrote:
> The LEDs default-on trigger is nice to have. For example, it can be used
> to configure a LED as a power indicator.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  arch/arm/configs/davinci_all_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
> index 9d7f0bc..e380743 100644
> --- a/arch/arm/configs/davinci_all_defconfig
> +++ b/arch/arm/configs/davinci_all_defconfig
> @@ -181,6 +181,7 @@ CONFIG_LEDS_GPIO=m
>  CONFIG_LEDS_TRIGGERS=y
>  CONFIG_LEDS_TRIGGER_TIMER=m
>  CONFIG_LEDS_TRIGGER_HEARTBEAT=m
> +CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

Can this be module like rest of the triggers? It will come on later, but
not sure if you care about the difference that much. Having it a module
will be better for those boards that don't need it.

Thanks,
Sekhar
