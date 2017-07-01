From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: adc: mt7622: add binding document
Date: Sat, 1 Jul 2017 10:18:53 +0100
Message-ID: <20170701101853.329e3291@kernel.org>
References: <1498457502-3669-1-git-send-email-zhiyong.tao@mediatek.com>
        <1498457502-3669-2-git-send-email-zhiyong.tao@mediatek.com>
        <20170628164622.4fmqmlhhyvkwvbwd@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170628164622.4fmqmlhhyvkwvbwd@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 28 Jun 2017 11:46:22 -0500
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Mon, Jun 26, 2017 at 02:11:40PM +0800, Zhiyong Tao wrote:
> > The commit adds mt7622 compatible node in binding document.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/iio/adc/mt6577_auxadc.txt  |    1 +
> >  1 file changed, 1 insertion(+)  
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied to the togreg branch of iio.git and pushed out
as testing for the autobuilders to play with it.

Thanks,

Jonathan
