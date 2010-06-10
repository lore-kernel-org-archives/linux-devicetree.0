From: "M. Warner Losh" <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/6] of/device: populate platform_device (of_device)
	resource table on allocation
Date: Thu, 10 Jun 2010 09:13:57 -0600 (MDT)
Message-ID: <20100610.091357.513168276793712624.imp@bsdimp.com>
References: <20100608194809.GA32732@oksana.dev.rtsoft.ru>
	<1276150663.1962.43.camel@pasglop>
	<AANLkTilpUi1cazljWSFbzliY78RKyHUlvBshUD3NPHPv@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTilpUi1cazljWSFbzliY78RKyHUlvBshUD3NPHPv-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

In message: <AANLkTilpUi1cazljWSFbzliY78RKyHUlvBshUD3NPHPv-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
            Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> writes:
: On Thu, Jun 10, 2010 at 12:17 AM, Benjamin Herrenschmidt
: <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
: >
: >> You just introduced an unnamed structure of device + resources,
: >> it isn't declared anywhere but in the code itself (either via
: >> &foo[1] or buf + sizeof(*foo)).
: >>
: >> You're not the only one who hacks (or at least have to
: >> understand) the OF stuff, so let's try keep this stuff
: >> readable?
: >>
: >> I told you several ways of how to improve the code (based on
: >> the ideas from drivers/base/, so the ideas aren't even mine,
: >> fwiw).
: >
: > I tend to agree with Anton here.
: 
: The reason I'm confident doing it that way is that it is *not* a
: structure.  There is no structure relationship between the resource
: table and the platform_device other than they are allocated with the
: same kzalloc() call.  All the code that cares about that is contained
: within 4 lines of code.  I'm resistant to using a structure because it
: is adds an additional 5-6 lines of code to add a structure that won't
: be used anywhere else, and is only 4 lines to begin with.

I tend to agree with Grant here.  The idiom he's using is very wide
spread in the industry and works extremely well.  It keeps the
ugliness confined to a couple of lines and is less ugly than the
alternatives for this design pattern.  It is a little surprising when
you see the code the first time, granted, but I think its expressive
power trumps that small surprise.

Warner
