From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Device Tree Blob (DTB) licence
Date: Thu, 28 May 2015 14:34:29 +0100
Message-ID: <20150528133429.GD2067@n2100.arm.linux.org.uk>
References: <1430820315.19516.26.camel@opteya.com>
 <CAL_Jsq+T5c7qornpRVCduEjUSCeM+0xqbtVYovtH76y=4BqhLQ@mail.gmail.com>
 <1432289148.5304.58.camel@opteya.com>
 <1432322832.5304.63.camel@opteya.com>
 <CAOS_Y6Q37ps+VEnzUZ_uwX++qrRm9Hgx45Q_pmiZSLSNjmKwZg@mail.gmail.com>
 <55670AD4.8020705@melag.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55670AD4.8020705-d/C+FbuhHiA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Enrico Weigelt, metux IT consult" <weigelt-d/C+FbuhHiA@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Yann Droneaud <ydroneaud-RlY5vtjFyJ3QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 28, 2015 at 02:32:20PM +0200, Enrico Weigelt, metux IT consult wrote:
> Am 25.05.2015 um 09:14 schrieb Rob Landley:
> 
> >Personally, I'm sad we're starting to get ACPI for arm but if device
> >tree data files are only available under GPL, people will hold their
> >nose and deploy ACPI.
> 
> What's the big deal with having DTS/DTB under GPL ?

It's really quite simple.  Other open source projects won't touch
_our_ DTB with a barge pole through fear of GPL contamination.

So what we'll end up with is other projects creating their own DTB
descriptions for the same hardware, with different properties (which
they'll do in an effort to ensure that it isn't a "derived work" of
the GPL version) and the whole thing turning into a right mess - and
a poor experience for users because they then end up with OS specific
DT files.

Alternatively, as Rob points out, people will just go the ACPI route
to avoid the GPL contamination problem.

It doesn't matter what the legal issues actually are: if people think
that there is the possibility of GPL contamination - even across to
other differently licensed open source software, they won't touch the
GPL'd code/data and they'll come up with an alternative solution.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
