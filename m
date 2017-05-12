From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v5 1/3] Documentation: dt: net: add mt76 wireless device binding
Date: Fri, 12 May 2017 18:27:08 +0300
Message-ID: <87fuga6qpf.fsf@purkki.adurom.net>
References: <20170207202035.64224-1-nbd@nbd.name>
        <20170207202035.64224-2-nbd@nbd.name>
        <20170215223324.r7cgljfqkulyuany@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170215223324.r7cgljfqkulyuany@rob-hp-laptop> (Rob Herring's
        message of "Wed, 15 Feb 2017 16:33:24 -0600")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Tue, Feb 07, 2017 at 09:20:33PM +0100, Felix Fietkau wrote:
>> Signed-off-by: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
>
> Commit msg? Also, use "dt-bindings: net: " for the subject prefix.

Felix, are you planning to submit v6? Now that we are close to -rc1
release it's the best time to get this driver merged.

Also in patch 3 it would be good to have longer commit log, for example
describing what works (and what not), what modes are supported etc.

I applied this to pending branch for kbuild bot testing:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git/log/?h=pending

-- 
Kalle Valo
