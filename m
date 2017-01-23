From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 10/18] ARM64: dts: meson-gxbb: Reorder nodes
Date: Mon, 23 Jan 2017 17:56:24 +0100
Message-ID: <d58f8343-8369-95ac-3c21-ba8f35e7ac89@suse.de>
References: <20170120222118.21476-1-afaerber@suse.de>
 <20170120222118.21476-11-afaerber@suse.de>
 <20170123165208.4ujwm6rjz2b3dom5@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170123165208.4ujwm6rjz2b3dom5@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 23.01.2017 um 17:52 schrieb Rob Herring:
> On Fri, Jan 20, 2017 at 11:21:10PM +0100, Andreas Färber wrote:
>> Sort nodes referenced by label alphabetically.
> 
> Seems to be pointless churn.

We are constantly adding new nodes, so this avoids duplicates, mismerges
and uncertainties of where things should be added. Thought that would be
obvious, as I've been asked to do it elsewhere.

It also helps with diff -u'ing .dts files to see actual differences.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
