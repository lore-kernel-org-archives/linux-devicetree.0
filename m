From: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: socfpga: Add SD card detect
Date: Thu, 14 Aug 2014 23:04:19 +0200
Message-ID: <20140814210419.GD26857@amd.pavel.ucw.cz>
References: <1408031491-15609-1-git-send-email-dinguyen@opensource.altera.com>
 <1408031491-15609-3-git-send-email-dinguyen@opensource.altera.com>
 <20140814185158.GD11558@amd.pavel.ucw.cz>
 <53ED22D0.3060404@opensource.altera.com>
 <20140814205941.GA26857@amd.pavel.ucw.cz>
 <53ED239A.8090905@gmail.com>
 <53ED23C4.4010004@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53ED23C4.4010004-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, vbridger-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu 2014-08-14 16:01:56, Dinh Nguyen wrote:
> 
> 
> On 8/14/14, 4:01 PM, Dinh Nguyen wrote:
> > 
> > 
> > On 8/14/14, 3:59 PM, Pavel Machek wrote:
> >> On Thu 2014-08-14 15:57:52, Dinh Nguyen wrote:
> >>>
> >>>
> >>> On 8/14/14, 1:51 PM, Pavel Machek wrote:
> >>>> On Thu 2014-08-14 10:51:30, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> >>>>> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >>>>>
> >>>>> Revision D of the SOCFGPA devkit has a GPIO line used for SD/MMC
> >>>>> card detect.
> >>>>
> >>>> Are there previous revisions outside Altera?
> >>>>
> >>>
> >>> Not with SD card detect.
> >>
> >> So this patch will break those revision C (and below) boards, by
> >> adding gpio for card detect that does not exists there, no?
> >>
> > 
> > No, the card detect line is muxed with DAT3, so it'll work fine on
> > previous boards that does have card detect.
> 
> Sorry...i'll work fine on previous boards that does NOT have card detect.

Thanks for clarifications and sorry for the noise.

Acked-by: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
