From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 03/11] mfd: syscon: Add atmel-smc registers definition
Date: Mon, 1 Dec 2014 10:43:42 +0100
Message-ID: <547C384E.80705@atmel.com>
References: <1415203287-21517-1-git-send-email-boris.brezillon@free-electrons.com>	<1415203287-21517-4-git-send-email-boris.brezillon@free-electrons.com>	<20141110095728.GJ21424@x1> <20141201103838.4a7a0ffa@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141201103838.4a7a0ffa@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 01/12/2014 10:38, Boris Brezillon a =E9crit :
> Hi Lee,
>=20
> Sorry for the late reply.
>=20
> On Mon, 10 Nov 2014 09:57:28 +0000
> Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>=20
>> On Wed, 05 Nov 2014, Boris Brezillon wrote:
>>
>>> Atmel AT91 SoCs have a memory range reserved for SMC (Static Memory
>>> Controller) configuration.
>>> Expose those registers so that drivers can make use of the smc sysc=
on
>>> declared in at91 DTs.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>>  include/linux/mfd/syscon/atmel-smc.h | 60 ++++++++++++++++++++++++=
++++++++++++
>>>  1 file changed, 60 insertions(+)
>>>  create mode 100644 include/linux/mfd/syscon/atmel-smc.h
>>
>> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Any idea who will take this set?
>=20
> I guess you could take patch 1 to 4 and Nicolas would take the other
> ones (unless there's a maintainer for memory controller drivers).
> Or, if we don't want to have dependency issues, Nicolas can take all =
of
> them.
>=20
> Nicolas, any preference ?

Yes, I'd prefer to take the whole series. So add your Acked-by tags and
I take all in one of my at91-x.yy-drivers branches.

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
