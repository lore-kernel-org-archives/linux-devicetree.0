From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2 2/2] fpga manager: Add Xilinx slave serial SPI driver
Date: Tue, 21 Feb 2017 21:24:37 +0100
Message-ID: <20170221212437.2911d74e@crub>
References: <1487600724-17607-1-git-send-email-agust@denx.de>
        <1487600724-17607-3-git-send-email-agust@denx.de>
        <2d412ae7-4163-9943-6d98-2d6387df7789@xilinx.com>
        <20170221152444.34b5d9f4@crub>
        <19e0b5d1-bbf6-25ac-2698-6074ebafcf05@xilinx.com>
        <20170221161723.358975f7@crub>
        <ce0d7ba7-fa05-ad55-407c-3903553ace65@xilinx.com>
        <20170221163907.75ba4330@crub>
        <3a30638c-68f6-8c2b-95b7-c8c700fe4867@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3a30638c-68f6-8c2b-95b7-c8c700fe4867-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 21 Feb 2017 19:53:40 +0100
Michal Simek michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org wrote:
...
>There is one thing I have checked ml505 - old virtex 5 board which has
>this interface.
>http://www-inst.eecs.berkeley.edu/~cs150/fa13/resources/ml50x_schematics.pdf
>
>And I was chatting with one board guy and I think that done pin should
>be optional not required because not all boards export it.
>
>Then there is a question how to find out that programming was done and
>that's something what I don't know. But will try to find out if you can
>send any sequence over spi to find it out instead of gpio done pin.

maybe the boards without DONE pin use INIT_B pin with external pull-up
for CRC error reporting after configuration? Not sure if this is a
reliable way to ensure the configuration has completed.

Thanks,
Anatolij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
