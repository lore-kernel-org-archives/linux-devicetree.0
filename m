From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: davinci: da850: add wdt OF_DEV_AUXDATA entry
Date: Mon, 04 Feb 2013 16:00:20 +0400
Message-ID: <510FA2D4.7090807@mvista.com>
References: <1359016695-10362-1-git-send-email-anilkumar.v@ti.com>
 <1359016695-10362-3-git-send-email-anilkumar.v@ti.com>
 <510FA09F.7030604@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <510FA09F.7030604-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>, hs-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 04-02-2013 15:50, Sekhar Nori wrote:

> Auxdata is not evm specific. This can instead be called da850_auxdata_lookup[].

> Also, I dont think it is necessary to add auxdata in a separate patch
> from dt nodes. So, I fixed these issues and came up with below patch. I
> tested basic wdt reboot. reboot command is still broken (with or
> without this patch). Can you please look at that?

> Thanks,
> Sekhar

> ----8<----
> From: "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
> Date: Thu, 24 Jan 2013 14:08:14 +0530
> Subject: [PATCH 1/1] ARM: davinci: da850: add wdt DT node

> Add da850 wdt DT node.

> Signed-off-by: Kumar, Anil <anilkumar.v-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
[...]

> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 8dd15c0..2800090 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -88,6 +88,11 @@
>   				      19>;
>   			status = "disabled";
>   		};
> +		wdt: wdt@1c21000 {
> +			compatible = "ti,davinci-wdt";
> +			reg = <0x21000 0xfff>;

    Not 0x1000? This is region size, not upper limit.

WBR, Sergei
