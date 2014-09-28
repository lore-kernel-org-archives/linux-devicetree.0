From: PERIER Romain <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/3] regulator: act8865: Add support to turn off all outputs
Date: Sun, 28 Sep 2014 17:04:26 +0200
Message-ID: <CABgxDoJJEH387h7mSBG+5wTwyT6UkhvLjRzoryFX8NZjarxUHQ@mail.gmail.com>
References: <1411834906-9533-1-git-send-email-romain.perier@gmail.com>
	<20140928103301.GN27755@sirena.org.uk>
	<CABgxDo+h2AYjAO4darK4+RTXqnhf4OqouGLfF2yuJCpu7r6tLg@mail.gmail.com>
	<20140928122543.GA27755@sirena.org.uk>
	<CABgxDo+Gor=xnOV83Oca6kez7Auyu95XpaOr7QW+iRHbtByGAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABgxDo+Gor=xnOV83Oca6kez7Auyu95XpaOr7QW+iRHbtByGAg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Well, I will think about it and I will propose a separated patch with
a generic property and helper functions.

2014-09-28 15:25 GMT+02:00 PERIER Romain <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> 2014-09-28 14:25 GMT+02:00 Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>> On Sun, Sep 28, 2014 at 02:00:54PM +0200, PERIER Romain wrote:
>>> 2014-09-28 12:33 GMT+02:00 Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>>
>>> > We really need to come up with a standard property for this and document
>>> > it rather than continuing to add individual device specific properties
>>> > all doing the same thing, and probably also some helper code and/or a
>>> > standard operation for this - there's a lot of drivers implementing the
>>> > same pattern here.
>>
>>> I completly agree about adding a unified and generic property for that purpose.
>>> I already proposed something for that on devicetree ML, see the thread
>>> "Proposal: generic property for system-power-controller".
>>> Unfortunately I did not get replies :) .
>>
>> Did you CC relevant maintainers and send a patch?
>
> No I did not propose patches as I was an open discussion. Perhaps I
> might propose something as part of my contribution for act8865... (at
> least for the property)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
