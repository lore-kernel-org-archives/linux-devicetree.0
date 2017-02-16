From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: bindings: fpga: add xilinx slave-serial binding
 description
Date: Thu, 16 Feb 2017 19:54:18 +0100
Message-ID: <20170216195418.224e607a@crub>
References: <1487257860-31115-1-git-send-email-agust@denx.de>
        <1487257860-31115-2-git-send-email-agust@denx.de>
        <CAAtXAHcpcwax-rH3quYF9QTOVfbTyxmpPLLbUyX=-aruQfADDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAtXAHcpcwax-rH3quYF9QTOVfbTyxmpPLLbUyX=-aruQfADDA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Moritz,

On Thu, 16 Feb 2017 09:36:08 -0800
Moritz Fischer moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org wrote:
...
>> +Example:
>> +       fpga_mgr_spi: fpga-spi@0 {  
>
>Maybe we can standardize them here to be fpga-mgr@X, that being said,
>I don't do what I suggested in the zynq fpga mgr bindings docs.

Yes, I can use fpga-mgr@X if that is preferred.

Thanks,
Anatolij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
