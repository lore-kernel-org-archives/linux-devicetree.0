From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: of_iomap() and devres questions
Date: Wed, 03 Apr 2013 13:39:20 -0500
Message-ID: <515C7758.8010807@gmail.com>
References: <515B30C7.6040002@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <515B30C7.6040002-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
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
To: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/02/2013 02:25 PM, Markus Mayer wrote:
> Hi all,
> 
> I have a few questions regarding the implementation of the of_iomap()
> function.
> 
> As it currently stands, the function parses the device tree for the
> device's address and then simply calls ioremap() with that address and
> the associated size.
> 
> The first question that has come up is why of_iomap() doesn't also call
> request_mem_region()? Is there a particular reason for it or has it just
> not yet been implemented?

Don't know. It probably should not and make cause some breakage.

> The second question is regarding the use of devres in of_iomap(). Would
> it make sense for of_iomap() to use devm_ioremap() or, better yet,
> devm_request_and_ioremap() instead of simply calling ioremap()?

You should not be using of_iomap in a driver, but rather the functions
you mention. of_iomap is mainly used in cases where there is no driver
or struct device. Which means devm_* functions would be pointless. Also
there is no way to get from a struct device_node ptr to a struct device ptr.

Rob

> 
> Thanks,
> -Markus
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
