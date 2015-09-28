From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: License for ARM device tree file
Date: Mon, 28 Sep 2015 21:26:08 +0100
Message-ID: <20150928202607.GF21513@n2100.arm.linux.org.uk>
References: <DM2PR0301MB07343BCB0B5059C96CA31438BA4F0@DM2PR0301MB0734.namprd03.prod.outlook.com>
 <20150928192931.GE21513@n2100.arm.linux.org.uk>
 <CADRPPNQniPRmLq4WmSPU818=PafUV99djC9JveajMVdxARz0KA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CADRPPNQniPRmLq4WmSPU818=PafUV99djC9JveajMVdxARz0KA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sharma Bhupesh <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Peter Newton <Peter.Newton-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 28, 2015 at 03:19:05PM -0500, Li Yang wrote:
> On Mon, Sep 28, 2015 at 2:29 PM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> > However, we can't dictate to people what license they wish to submit
> > their work under; though, we can make the decision whether to accept
> > it under the license terms or not.
> 
> But I'm wondering if we submit a device tree patch using other GPL
> compatible permissive license(like GPL/3-clause-BSD dual license)
> which doesn't include any other device tree files, will it still be
> acceptable or not?

I don't see why it wouldn't be acceptable.  The only thing that matters
for Linux itself is that it's GPL v2 compatible since the kernel is a
GPL v2 project.

> > I think the problem will come if we try to mix a file that's licensed
> > one way, which includes files licensed under a different set of
> > licenses... if you want to use a file licensed under BSD 3-clause but
> > don't want to agree to the GPL license (so you're only bound by the
> > BSD 3-clause license) and that file includes some GPL/X11 licensed
> > files, then what?
> 
> Permissive licenses like X11 and BSD 3-clause should be compatible
> with each other right?

My point above is that you'd have to accept both X11 and BSD 3-clause
in that situation, if you wanted to reject GPL.  I don't wish to get
into a discussion whether X11 and BSD 3-clause are mutually compatible
with each other, that's lawyer territory. :)

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
