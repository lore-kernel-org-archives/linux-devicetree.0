From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] Documentation: dt: iio: imu: st_lsm6dsx: support
 active-low interrupts
Date: Sun, 11 Jun 2017 12:47:48 +0100
Message-ID: <20170611124748.323fb7a4@kernel.org>
References: <20170607181711.16195-1-lorenzo.bianconi@st.com>
        <20170607181711.16195-3-lorenzo.bianconi@st.com>
        <20170609141816.jllbisljifdj4vhr@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170609141816.jllbisljifdj4vhr@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 9 Jun 2017 09:18:16 -0500
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Wed, Jun 07, 2017 at 08:17:11PM +0200, Lorenzo Bianconi wrote:
> > Update st_lsm6dsx device binding with active-low interrupts support
> > (IRQ_TYPE_LEVEL_LOW and IRQ_TYPE_EDGE_FALLING).
> > 
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)  
> 
> "dt-bindings: iio: ..." is preferred for subject. Otherwise,
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Fixed and applied to the togreg branch of iio.git - pushed out as
testing for the autobuilders to play with it.

Thanks,

Jonathan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
