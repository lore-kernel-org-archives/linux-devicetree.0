From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: rockchip: Add DT for NanoPi M4
Date: Wed, 16 Jan 2019 15:12:58 -0600
Message-ID: <20190116211258.GA29888@bogus>
References: <cover.1547466003.git.robin.murphy@arm.com>
 <a96995cfa599792b24e740ce46d53bd68ef1d462.1547466003.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a96995cfa599792b24e740ce46d53bd68ef1d462.1547466003.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 14 Jan 2019 12:05:31 +0000, Robin Murphy wrote:
> There are a number of subtle differences between the nanopi4 variants,
> and where they disagree, the common DTSI currently follows the details
> of NanoPi M4. In order to improve matters even more, let's add a
> separate DTS for the M4 to which we can start splitting things out
> appropriately. The third variant, NanoPi NEO4, is a lot closer to the M4
> than either is to the larger T4, so arguably could get away with just
> sharing the M4 DT for now (plus I have neither of the smaller boards to
> actually test with).
> 
> CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> ---
> 
> v2: Fix the copy-paste binding thinko
> 
>  .../devicetree/bindings/arm/rockchip.yaml      |  6 ++++--
>  arch/arm64/boot/dts/rockchip/Makefile          |  1 +
>  .../boot/dts/rockchip/rk3399-nanopi-m4.dts     | 18 ++++++++++++++++++
>  3 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts
> 

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
