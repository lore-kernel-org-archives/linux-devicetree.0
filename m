From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Date: Tue, 16 Jun 2009 06:53:17 -0600
Message-ID: <fa686aa40906160553m2f0e7cc4n644c3893573845f@mail.gmail.com>
References: <1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
	<1245087807.3185.0@antares> <20090616091801.GC21321@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090616091801.GC21321-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, =?ISO-8859-1?Q?Albrecht_Dre=DF?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 16, 2009 at 3:18 AM, Wolfram Sang<w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Mon, Jun 15, 2009 at 07:43:20PM +0200, Albrecht Dre=DF wrote:
>> Am 05.06.09 14:05 schrieb(en) Wolfram Sang:
>>> Create an of-aware driver using the now exported generic functions
>>> from plat-ram.c. Also add the documentation for the binding.
>>> Partitions are not yet supported. Tested on a phyCORE-MPC5200B-IO.
>>
>> Dumb question: what is the current status of this patch? =A0I ask because
>
> I don't know.
>
> David wondered if 'of_physmap' could be used, so I wrote what I experienc=
ed
> during development. I can't tell if this helped the case.
>
> Grant wondered if we need a bankwidth. IMHO it is needed for now, but I d=
on't
> know if this is a common agreement.

I'm not happy about the use case though.  It probably shouldn't appear
in this binding, or if it does it should be tagged as an optional
property.  It is only in the 5200 localplus case that bank-width is
needed to figure out how to apply the workaround.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
