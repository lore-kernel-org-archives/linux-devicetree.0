From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Subject: Re: [PATCH v5 5/9] ARM: versatile: Map local timers using Device
 Tree when possible
Date: Sat, 10 Dec 2011 19:27:09 +0400
Message-ID: <4EE37A4D.8060204@ru.mvista.com>
References: <1323457432-4800-1-git-send-email-pawel.moll@arm.com>
 <1323457432-4800-6-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1323457432-4800-6-git-send-email-pawel.moll@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 09-12-2011 23:03, Pawel Moll wrote:

> If twd_base is not set, try to map the TWD registers from
> "arm,smp-twd" Device Tree node (compatible value as used in
> Highbank's DT).

> Signed-off-by: Pawel Moll<pawel.moll@arm.com>
> ---
>   arch/arm/plat-versatile/localtimer.c |   12 ++++++++++++
>   1 files changed, 12 insertions(+), 0 deletions(-)

> diff --git a/arch/arm/plat-versatile/localtimer.c b/arch/arm/plat-versatile/localtimer.c
> index 0fb3961..e3da322 100644
> --- a/arch/arm/plat-versatile/localtimer.c
> +++ b/arch/arm/plat-versatile/localtimer.c
[...]
> @@ -21,6 +23,16 @@
>    */
>   int __cpuinit local_timer_setup(struct clock_event_device *evt)
>   {
> +#if defined(CONFIG_OF)
> +	if (!twd_base) {
> +		struct device_node *np = of_find_compatible_node(NULL,
> +				NULL, "arm,smp-twd");
> +
> +		twd_base = of_iomap(np, 0);
> +		if (!twd_base)
> +			return -ENXIO;

    -ENOMEM.

WBR, Sergei
