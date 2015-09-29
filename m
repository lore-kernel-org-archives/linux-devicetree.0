From: Alexander Popov <alex.popov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] powerpc/512x: add LocalPlus Bus FIFO device driver
Date: Tue, 29 Sep 2015 09:34:07 +0300
Message-ID: <560A30DF.9050900@linux.com>
References: <1443115737-3948-1-git-send-email-alex.popov@linux.com>
 <1443115737-3948-2-git-send-email-alex.popov@linux.com>
 <56049CD0.7080104@tabi.org> <56093CE5.5070301@linux.com>
 <56093E1D.4080008@tabi.org>
Reply-To: alex.popov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56093E1D.4080008-N01EOCouUvQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur Tabi <timur-N01EOCouUvQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Popov <alex.popov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28.09.2015 16:18, Timur Tabi wrote:
> Alexander Popov wrote:
>> The only question I have: why calling dma_unmap_single() from within
>> a spinlock is a bad practice?
> 
> I don't know, but usually functions that allocate or free memory cannot be
> called from within a spinlock.  You need to check that.  Since the MPC5121
> is a single-core CPU, you might not notice if you're doing something wrong.

I've double-checked the code and LDD and don't see any reason to avoid
calling dma_unmap_single() from interrupt context and within spinlock.

Please correct me if I'm wrong.
Thanks.

Best regards,
Alexander
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
