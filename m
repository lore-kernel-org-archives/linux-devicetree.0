From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [DT] API to determine if interrupt is PPI or SPI ?
Date: Fri, 27 Jul 2012 14:09:47 +0100
Message-ID: <20120727130947.GN559@mudshark.cambridge.arm.com>
References: <53a41d02c4c4c24bdab47667183891bf.squirrel@www.codeaurora.org>
 <50128AA0.8040409@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50128AA0.8040409-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 27, 2012 at 01:33:36PM +0100, Rob Herring wrote:
> On 07/26/2012 02:18 PM, rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org wrote:
> > Hello,
> > 
> > We can specify the interrupt information in the device tree using the arm
> > gic convention.
> > Is there an API to read directly the 1st cell and determine if an
> > interrupt is a PPI or a SPI ? This information is directly relevant to the
> > driver because it needs to call request_irq or request_percpu_irq based on
> > this data.
> > 
> > How should this be done ideally ?
> 
> Seems a bit strange to me that you would have a h/w block that can be
> connected either way...

The CPU PMU can be wired as either SPI or PPI. The latter makes more sense to
me but usually (although not exclusively) it's wired using the former.

Will
