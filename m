From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Request review of device tree documentation
Date: Tue, 15 Jun 2010 20:13:15 -1000
Message-ID: <4C186B7B.1060308@firmworks.com>
References: <4C13430B.5000907@firmworks.com>	<1276339529.1962.184.camel@pasglop>	<1276339684.1962.186.camel@pasglop>	<4C13B618.1030006@firmworks.com>	<1276383132.1962.195.camel@pasglop>	<AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0@mail.gmail.com>	<4C146F18.9030008@firmworks.com>	<AANLkTikls3hjXOmKFqG2D_9GaJSjOXNuuRXPlanAjo5E@mail.gmail.com>	<20100614124438.GF9323@yookeroo>	<alpine.LFD.2.00.1006141044510.13427@xanadu.home>	<20100614160201.GD9550@shareable.org>
	<4C165FD1.6080505@firmworks.com> <4C186AA8.4040709@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4C186AA8.4040709-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jamie Lokier <jamie-yetKDKU6eevNLxjTenLetw@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Dan Malek <ppc6dev-7kUUosv42bfn7oBBQGLwdg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Mike Rapoport wrote:
> Mitch Bradley wrote:
>
>> The second topic is the hypothetical use of OFW as a HAL. That will 
>> not happen for several reasons.  The opposition to the idea is 
>> widespread and deeply held, and there are good arguments to support 
>> that opposition.   Furthermore, the economic conditions necessary for 
>> the creation of such a HAL do not exist in the ARM world, nor indeed 
>> in the Linux world in general.  (The necessary condition is the 
>> ability for one company to impose a substantial change by fiat - 
>> essentially a monopoly position.)
>>
>> Shall we agree, then, that any further discussion of the HAL issue is 
>> "just for fun", and that nobody needs to feel threatened that it 
>> would actually happen?
>
> I've recently worked with vendor versions of U-Boot for advanced ARM 
> SoCs. There is already *huge* chunk of HAL code in those versions. And 
> if there would be possibility to have callbacks into the firmware 
> these chunks would only grow, IMHO.

How can there be HAL code in U-Boot unless there is already the 
possibility to have callbacks into the firmware?

It is not HAL if it can't be called.

>
>
>> The potential for "vendors breaking out of the debugging use case and 
>> turning it into a HAL" is miniscule, because
>>
>> a) The callback is disabled by default
>> b) The technical challenges of the callback interface limit its 
>> applicability to specific "wizard user" scenarios
>> c) OFW is unlikely to achieve sufficient market penetration for the 
>> HAL thing to be worth doing
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
