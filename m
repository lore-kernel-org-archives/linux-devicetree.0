From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/9] dt-bindings: iio: humidity: hts221: support
 active-low interrupts
Date: Mon, 10 Jul 2017 21:49:36 -0500
Message-ID: <20170711024936.3jncjvrx37g4herl@rob-hp-laptop>
References: <20170709165704.26311-1-lorenzo.bianconi@st.com>
 <20170709165704.26311-7-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170709165704.26311-7-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 09, 2017 at 06:57:01PM +0200, Lorenzo Bianconi wrote:
> Update hts221 device binding with active-low interrupts support
> (IRQ_TYPE_LEVEL_LOW and IRQ_TYPE_EDGE_FALLING).
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/iio/humidity/hts221.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
