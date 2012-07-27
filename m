From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [DT] API to determine if interrupt is PPI or SPI ?
Date: Fri, 27 Jul 2012 07:33:36 -0500
Message-ID: <50128AA0.8040409@gmail.com>
References: <53a41d02c4c4c24bdab47667183891bf.squirrel@www.codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <53a41d02c4c4c24bdab47667183891bf.squirrel-mMfbam+mt9083fI46fginR2eb7JE58TQ@public.gmane.org>
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
To: rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/26/2012 02:18 PM, rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org wrote:
> Hello,
> 
> We can specify the interrupt information in the device tree using the arm
> gic convention.
> Is there an API to read directly the 1st cell and determine if an
> interrupt is a PPI or a SPI ? This information is directly relevant to the
> driver because it needs to call request_irq or request_percpu_irq based on
> this data.
> 
> How should this be done ideally ?

Seems a bit strange to me that you would have a h/w block that can be
connected either way...

Perhaps the irq resource should have a flag for percpu irq.

Rob
