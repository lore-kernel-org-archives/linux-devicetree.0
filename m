From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/platform: depopulate devices in the reverse order of creation
Date: Wed, 14 Dec 2016 14:54:02 -0600
Message-ID: <CAL_Jsq+JdmKj88Tp=N+V781qj+muEB6nuGpjDCgiPsrzB9tWMg@mail.gmail.com>
References: <20161212183905.GA30702@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161212183905.GA30702-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 12, 2016 at 12:39 PM, Jason Gunthorpe
<jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org> wrote:
> If the DT has inter-dependencies, then the devices need to be removed
> in the right order to avoid removal problems.
>
> Assuming the DT is constructed so that EPROBE_DEFER doesn't happen
> during creating then a good way to avoid removal problems is reversing
> the order during depopulation.

I assume you mean by sorting the nodes to get lucky with the init
order. Not sure I want any patches that help that. I'm tempted to
randomize the device creation order instead.

> Signed-off-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> ---
>  drivers/of/platform.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> In my specific case I have a gpio driver, followed by a i2c bitbang
> using that driver. So gpiolib prints an error if it the gpio driver is
> removed before the gpio client..

Good news, functional dependencies are going into 4.10. Let's fix GPIO
and use that.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
