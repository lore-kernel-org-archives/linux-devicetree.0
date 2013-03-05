From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 6/9] rtc: stmp3xxx: add sysfs entries for persistent regs
Date: Tue, 5 Mar 2013 09:02:52 +0100
Message-ID: <20130305080252.GA7042@pengutronix.de>
References: <1362405948-12992-1-git-send-email-s.trumtrar@pengutronix.de>
 <1362405948-12992-7-git-send-email-s.trumtrar@pengutronix.de>
 <CACxGe6swW-UDH1cUw1D8P+gyhDC8nDZur-A_m_NBfeRUxcg9Jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6swW-UDH1cUw1D8P+gyhDC8nDZur-A_m_NBfeRUxcg9Jw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant!

On Mon, Mar 04, 2013 at 11:14:54PM +0800, Grant Likely wrote:
> On Mon, Mar 4, 2013 at 10:05 PM, Steffen Trumtrar
> <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > The persistent registers 1-5 are completely software defined. To have access
> > from userspace, export them via sysfs.
> >
> > Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Hi Steffen,
> 
> A few comments on this. First and foremost, any additions to the
> kernel sysfs interface must be accompanied with documentation in
> Documentation/ABI/. Second, adding attributes to an existing device

Okay. I forgot that and will add it in the next version.

> that has already been registered is almost guaranteed to be wrong. The
> attributes need to be added all at the same time so they are available
> immediately when the new device uevent is issued by the kernel.
> 
> Instead, the correct thing to do is add an attribute_group to the
> child device before the device gets registered. See the 'attributes'
> section of Documentation/driver-model/device.txt to see how to do
> this.
> 
> (I also see that the rtc core code is doing the wrong thing here also.
> rtc_sysfs_add_device(), rtc_sysfs_add_device() should also be replaced
> with an attribute group so that the sysfs files get added
> automatically; but that is outside the scope of this patch)
> 

Hm, I modeled it after other rtcs and the rtc_sysfs. Seems that I have to
rework this.

Thanks,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
