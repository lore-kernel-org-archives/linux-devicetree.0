From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: dts: bcm283x: Fix DTC warnings
Date: Tue, 27 Feb 2018 16:42:55 -0800
Message-ID: <86a385df-c3c4-4c68-565e-baa8c2681ade@gmail.com>
References: <1519481722-22738-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1519481722-22738-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/24/2018 06:15 AM, Stefan Wahren wrote:
> This patch series fixes some DTC warnings, which are only visible with W=1.
> 
> Stefan Wahren (2):
>   ARM: dts: bcm283x: Fix unit address of local_intc
>   ARM: dts: bcm283x: Move arm-pmu out of soc node
> 
>  arch/arm/boot/dts/bcm2835.dtsi |  6 +++---
>  arch/arm/boot/dts/bcm2836.dtsi | 12 ++++++------
>  arch/arm/boot/dts/bcm2837.dtsi |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 

Series applied to devicetree/fixes, thanks Stefan. Can you make sure you
copy bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org for your future submissions?
That allows me to leverage the patchwork instance behind that list,
thank you!
-- 
Florian
