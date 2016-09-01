From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 0/3] nvmem: rockchip-efuse: support more rockchip SoCs
Date: Thu, 01 Sep 2016 22:43:32 +0200
Message-ID: <3728837.exfccSJxkh@diego>
References: <1472464210-30252-1-git-send-email-finley.xiao@rock-chips.com>
 <f9c6e53e-ae5f-d67a-3464-e10a3dee808c@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <f9c6e53e-ae5f-d67a-3464-e10a3dee808c-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tony.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi srini,

Am Donnerstag, 1. September 2016, 21:02:23 schrieb Srinivas Kandagatla:
> On 29/08/16 10:50, Finley Xiao wrote:
> > As the timing and organization of efuse may be different
> > between rockchip SoCs, so their read function may be different.
> > We add different device tree compatible string for rockchip SoCs
> > to match their own read function.
> > 
> > V3->V4:
> > - 3/3 change the type of out_value into u32 and buf into u8, their values
> > 
> >   come from register, use u32 and u8 may be more readable.
> > 
> > Finley Xiao (3):
> >   nvmem: rockchip-efuse: update compatible strings for Rockchip efuse
> >   ARM: dts: rockchip: update compatible strings for Rockchip efuse
> >   nvmem: rockchip-efuse: add rk3399-efuse support
> 
> I can take patch 1 and 3, but dts has to go via arm soc tree.

that is really fine, and also what I somehow expect :-) .

So once you picked these two (I guess after Doug's comments are fixed) I'll 
pick up the dts patch.


Heiko
