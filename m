From: Justin Swartz <justin.swartz-4mSLLtuPuFdOJuVFMUvaKw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add device tree for Mecer Xtreme Mini S6
Date: Fri, 26 Jul 2019 11:14:44 +0200
Message-ID: <509782f4ece936f5ac7d0abffbd555fc@risingedge.co.za>
References: <20190616204746.21001-1-justin.swartz@risingedge.co.za>
 <1618985.EOrKlNyPW4@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1618985.EOrKlNyPW4@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2019-07-26 00:19, Heiko Stuebner wrote:

> please add an entry to 
> Documentation/devicetree/bindings/arm/rockchip.yaml
> for your board and if necessary also a vendor-prefix to
> Documentation/devicetree/bindings/vendor-prefixes.(yaml?)

OK

> please sort the &node-references alphabetically.

OK

>> +&cpu0 {
>> +    clock-frequency = <1464000000>;
> 
> not sure I understand the reasoning here.
> There seems to be a regulator defined, so the cpu cores should
> have operating points defined to allow them to switch between
> different frequencies as needed.

I added the clock-frequency property to quell the following messages:

[ 0.003273] /cpus/cpu@f00 missing clock-frequency property
[ 0.003323] /cpus/cpu@f01 missing clock-frequency property
[ 0.003352] /cpus/cpu@f02 missing clock-frequency property
[ 0.003382] /cpus/cpu@f03 missing clock-frequency property

I think they are from parse_dt_topology() in arch/arm/kernel/topology.c

What do you suggest?

Regards
Justin
