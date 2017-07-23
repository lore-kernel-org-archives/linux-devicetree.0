From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] of_pci: use of_property_read_u32_array()
Date: Sun, 23 Jul 2017 22:46:45 +0300
Message-ID: <c97cebca-86c2-173d-2228-60afe109c8dc@cogentembedded.com>
References: <20170723194327.508593685@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170723194327.508593685-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/23/2017 10:41 PM, Sergei Shtylyov wrote:

> of_pci_get_devfn() and of_pci_parse_bus_range() somehow didn't use
> of_property_read_u32_array() though it was long available, basically
> open-coding it.  Using the modern DT API saves several LoCs/bytes and

    Oops, cut&paste error! This patch apparently doesn't save any LoCs, but it 
does save 32 bytes of the object code (ARM gcc 4.8.5). Do I need to resend?

> also adds some prop sanity checks as a bonus...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>
> ---
>  drivers/of/of_pci.c |   28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
