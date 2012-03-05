From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 7/7] Document: devicetree: add OF documents for arch-mmp
Date: Mon, 5 Mar 2012 14:46:14 +0000
Message-ID: <201203051446.14600.arnd@arndb.de>
References: <1330950111-30797-1-git-send-email-haojian.zhuang@marvell.com>
 <1330950111-30797-8-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1330950111-30797-8-git-send-email-haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 05 March 2012, Haojian Zhuang wrote:
> Add OF support in Document/devicetree directory.
> 
> Signed-off-by: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

One question for Benoit, Grant or Rob:

> +Required properties:
> +- compatible: should be "mrvl,sa1100-rtc"
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +- interrupts: Should be two. The first interrupt number is the rtc alarm
> +  interrupt and the second interrupt number is the rtc hz interrupt.
> +- interrupt-names: Assign name of irq resource.
> +
> +Example:
> +	rtc: rtc@d4010000 {
> +		compatible = "mrvl,mmp-rtc";
> +		reg = <0xd4010000 0x1000>;
> +		interrupts = <5>, <6>;
> +		interrupt-name = "rtc 1Hz", "rtc alarm";
> +	};

When the binding for a device lists the interrupt-names property, should it
also list the specific values for it? This one says that which ones they are,
but I think we should actually mandate the exact string in the binding if
we want to allow drivers to get the resource by its name.

	Arnd
