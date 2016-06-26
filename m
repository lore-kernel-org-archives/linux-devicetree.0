From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] iio: potentiometer: mcp4531: New parts and device
 tree
Date: Sun, 26 Jun 2016 15:53:59 +0100
Message-ID: <dc5c67de-56bb-ee6a-1783-be9062cc1e7c@kernel.org>
References: <1466492137-32683-1-git-send-email-florian.vaussard@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466492137-32683-1-git-send-email-florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21/06/16 07:55, Florian Vaussard wrote:
> Hello,
> 
> This series first adds support for parts missing from mcp4531 driver
> (MCP454x, MCP456x, MCP464x and MCP466x). It then introduces the necessary
> device tree binding to perform DT boot.
> 
> Tested with MCP4561-103 and MCP4561-503 (DT boot).
> 
Series looks good to me other than the various bits Peter pointed out.

Thanks,

Jonathan
> Best regards,
> Florian
> 
> Florian Vaussard (3):
>   iio: potentiometer: mcp4531: Add support for MCP454x, MCP456x, MCP464x
>     and MCP466x
>   iio: potentiometer: mcp4531: Add device tree binding documentation
>   iio: potentiometer: mcp4531: Add device tree binding
> 
>  .../bindings/iio/potentiometer/mcp4531.txt         |  84 +++++++++++
>  drivers/iio/potentiometer/Kconfig                  |   6 +-
>  drivers/iio/potentiometer/mcp4531.c                | 155 ++++++++++++++++++++-
>  3 files changed, 242 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/potentiometer/mcp4531.txt
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
