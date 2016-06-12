From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx6q-cm-fx6: fix the operation points
Date: Mon, 13 Jun 2016 01:04:15 +0200
Message-ID: <333d8139fc75434e87b49a479c91fd60@rwthex-s1-b.rwth-ad.de>
References: <cd3010c3a4144ec38f2cfd1bfbd1b2ad@rwthex-s1-b.rwth-ad.de>
 <c961c1e0cdde471daf1bdce2e8e7696b@rwthex-s2-a.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c961c1e0cdde471daf1bdce2e8e7696b-gtPewvpZjL+1MzRH+ruthl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, "Spinrath, Christopher" <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

thanks again for your review!

On 06/13/2016 12:49 AM, Fabio Estevam wrote:
> On Sun, Jun 12, 2016 at 12:19 PM,  <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:
> 
>> +&cpu0 {
>> +       /* Although the imx6q fuse indicates that 1.2GHz operation is possible,
>> +        * the module behaves unstable at this frequency. Hence, remove the
>> +        * 1.2GHz operation point here.
>> +        */
> 
> Just one minor comment.
> 
> From Documentation/CodingStyle:
> 
> "The preferred style for long (multi-line) comments is:
> 
>     /*
>      * This is the preferred style for multi-line
>      * comments in the Linux kernel source code.
>      * Please use it consistently.
>      *
>      * Description:  A column of asterisks on the left side,
>      * with beginning and ending almost-blank lines.
>      */
> "
> 
ups, I took only a quick look and picked the comment style for net/ ...
I will fix it and read more carefully next time.

Thanks,
Christopher

> Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
