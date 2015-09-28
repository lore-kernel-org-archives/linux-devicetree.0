From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: License for ARM device tree file
Date: Mon, 28 Sep 2015 20:29:31 +0100
Message-ID: <20150928192931.GE21513@n2100.arm.linux.org.uk>
References: <DM2PR0301MB07343BCB0B5059C96CA31438BA4F0@DM2PR0301MB0734.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <DM2PR0301MB07343BCB0B5059C96CA31438BA4F0-Cwg/PA1lyPnRfvLtmsd4/5wN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Leo <LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sharma Bhupesh <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Peter Newton <Peter.Newton-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 28, 2015 at 07:14:30PM +0000, Li Leo wrote:
> I saw some discussion going on last year about the permissive license
> to be used in ARM device tree files.  I know a lot of files have been
> changed to use GPLv2/X11 license.  But may I know if GPLv2/BSD 3-clause
> dual license is still a valid license to use in ARM device tree files.
> It has been our standard permissive license used for a long time in
> many components like device trees in Power architecture.

It would have been nice to have had some input at the time that what
little discussion there was happened.

I'm sorry, but at this point I'm of the opinion that the window for
discussing what license we switch to has been had, and the matter is
settled; those who didn't take part in the discussion have themselves
to blame if they don't like the outcome.

What I'm saying is that I doubt anyone has the stomach to go through
another set of license changes on the existing files to suit some
late-commer to the party.

However, we can't dictate to people what license they wish to submit
their work under; though, we can make the decision whether to accept
it under the license terms or not.

I think the problem will come if we try to mix a file that's licensed
one way, which includes files licensed under a different set of
licenses... if you want to use a file licensed under BSD 3-clause but
don't want to agree to the GPL license (so you're only bound by the
BSD 3-clause license) and that file includes some GPL/X11 licensed
files, then what?

IANAL.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
