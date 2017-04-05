From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/3] add support of usb2-phy for rk3328
Date: Wed, 5 Apr 2017 16:54:12 +0530
Message-ID: <877ef848-c92d-d9fe-f1b1-8a19f8b8a5c6@ti.com>
References: <1488763778-27499-1-git-send-email-daniel.meng@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488763778-27499-1-git-send-email-daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Monday 06 March 2017 06:59 AM, Meng Dongyang wrote:
> The config information of RK3328 about address and port property
> is different from other platform. So adds config information in the
> data of match table and the device tree bindings description for
> usb2-phy.
> 
> Changes in v2:
>  - move usb2-phy grf specification to .../devicetree/bindings/soc/rockchip/grf.txt
>  - add otg port config information of rk3328
> Changes in v3:
>  - remove tuning function and id pin configs
>  - delete example of usb2-phy grf in grf.txt

removed the version history in commit log and merged the series.

Thanks
Kishon
> 
> Meng Dongyang (3):
>   dt-bindings: phy: add assign clock property in usb2-phy node
>   dt-bindings: phy: add DT bindings for usb2-phy grf
>   phy: rockchip-inno-usb2: add support of usb2-phy for rk3328
> 
>  .../bindings/phy/phy-rockchip-inno-usb2.txt        |  6 +++
>  .../devicetree/bindings/soc/rockchip/grf.txt       |  4 ++
>  drivers/phy/phy-rockchip-inno-usb2.c               | 44 ++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
> 
