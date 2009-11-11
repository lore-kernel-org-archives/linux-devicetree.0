From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Re: [PATCH 3/3] mpc52xx/wdt: WDT uses GPT api
Date: Wed, 11 Nov 2009 13:18:36 -0700
Message-ID: <fa686aa40911111218g62bf8f50k99c786ec6f5421b4@mail.gmail.com>
References: <fa686aa40911101159y7bef3f9bte74e9aeb5c6e864b@mail.gmail.com>
	<1257884778.14374.5@antares>
	<fa686aa40911101307p12bba31s491ef1d8812ca033@mail.gmail.com>
	<16246194.1257928342802.JavaMail.ngmail@webmail19.ha2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <16246194.1257928342802.JavaMail.ngmail-hrWuGRo80rRiK3oW1guXusM6rOWSkUom@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: =?ISO-8859-1?Q?Albrecht_Dre=DF?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 11, 2009 at 1:32 AM, Albrecht Dre=DF <albrecht.dress-KvP5wT2u2U0@public.gmane.org> =
wrote:
> Hi Grant:
>
> O.k., thanks for your comments. =A0If Wim doesn't have any objections to =
it, I will provide a merged patch. =A0One consequence I forgot to mention i=
s that we loose the ability to build the wdt support as module, but I don't=
 think it's a real problem.

I'm not too worried about this.  It is also potentially possible to
rework the entire GPT driver as a module.  But there are non-trivial
architecture fiddly bits needed to make it safe to load IRQ
controllers in a module.

> I think we still should keep the kernel config option enable/disable the =
wdt support, which would mask out the wdt code if disabled. =A0Is that ok f=
or you?

Yup.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
