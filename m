From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/3] clk: vc5: Add support for IDT VersaClock 5P49V5935
Date: Fri, 7 Apr 2017 21:56:09 +0200
Message-ID: <cb635515-7770-73cb-f9d3-f81b2d647614@gmail.com>
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
 <1491556344-9465-4-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491556344-9465-4-git-send-email-alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/07/2017 11:12 AM, Alexey Firago wrote:
> Update IDT VersaClock 5 driver to support 5P49V5935. This chip has
> two clock inputs (internal XTAL or external CLKIN), four fractional
> dividers (FODs) and five clock outputs (four universal clock outputs
> and one reference clock output at OUT0_SELB_I2C).
> 
> Current driver supports up to 2 FODs and up to 3 clock outputs. This
> patch sets max number of supported FODs to 4 and max number of supported
> clock outputs to 5.
> 
> Signed-off-by: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

Reviewed-by: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
