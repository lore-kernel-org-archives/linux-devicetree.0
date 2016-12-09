From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RESEND PATCH v2 0/7] drm/vc4: VEC (SDTV) output support
Date: Fri, 9 Dec 2016 08:45:41 +0100
Message-ID: <20161209084541.0e89e533@bbrezillon>
References: <1480686493-4813-1-git-send-email-boris.brezillon@free-electrons.com>
        <68783643.33021.1481268157922@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <68783643.33021.1481268157922-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 9 Dec 2016 08:22:37 +0100 (CET)
Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:

> Hi,
> 
> > Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> hat am 2. Dezember 2016 um 14:48 geschrieben:
> > 
> > 
> > Sorry for the noise, but I forgot to Cc the DT maintainers.
> > 
> > Here is the 2nd version of the VC4/VEC series.
> > 
> > We still miss the two clock patches mentioned by Eric in the first
> > version to make the encoder work no matter the setting applied by the
> > bootloader.  
> 
> are there any advices to test this feature?

Apply these patches [1][2][3][4] in addition to this series, and you
should see the SDTV output when running modetest (this is what I used
to test/debug the driver).

This is the command I use to test the SDTV output in NTSC mode

modetest -s 39:720x480

> 
> Is it possible to use an old Raspberry Pi B (256 MB RAM) for this?

I did most of my test on a RPi-2, but IIRC, Eric tested it on a RPi
(don't know which model).

> 
> Thanks
> 
> Stefan

[1]https://patchwork.kernel.org/patch/9442127/
[2]https://patchwork.kernel.org/patch/9456911/
[3]https://patchwork.kernel.org/patch/9456909/
[4]https://patchwork.kernel.org/patch/9456731/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
