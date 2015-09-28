From: Timur Tabi <timur-N01EOCouUvQ@public.gmane.org>
Subject: Re: [PATCH v3 2/3] powerpc/512x: add a device tree binding for
 LocalPlus Bus FIFO
Date: Mon, 28 Sep 2015 08:26:55 -0500
Message-ID: <5609401F.3010603@tabi.org>
References: <1443115737-3948-1-git-send-email-alex.popov@linux.com>
 <1443115737-3948-3-git-send-email-alex.popov@linux.com>
 <560492C1.307@tabi.org> <56093F89.1020004@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56093F89.1020004-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alex.popov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Alexander Popov wrote:
> I've just followed devicetree/bindings/dma/dma.txt...
> This "rx-tx" doesn't mean much but it could show that LocalPlus Bus FIFO
> uses a single DMA read-write channel. Should I really drop it?

Hmmm, I'm not sure.  Is there anything else (besides your driver) that 
parses this device tree node?

dma.txt says this:

	"The specific strings that can be used are defined in the binding of 
the DMA client device."

So this looks like it's driver-specific, but it is a required property.
I guess you should keep it, but I think you should get a second opinion.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
