From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: RFC: Host-endian device tree format
Date: Wed, 19 Jan 2011 09:07:23 -0700
Message-ID: <AANLkTikjXBeDsrdVopY20hYM2GrMwTy1+hAZp7d6Cvh_@mail.gmail.com>
References: <AANLkTi=AdwaW5vvm1TzNxcNrjYiJ3dOEjwoZrm-koxuw@mail.gmail.com>
	<AANLkTikoZj1WSpE8QNSRiF3oFL4qAb68kNnCKdExvBz7@mail.gmail.com>
	<AANLkTi=xdJ_c3LvCFkeqBRNDf6TSC40Fjxihm9eSeMmf@mail.gmail.com>
	<alpine.LFD.2.00.1101191031481.8580@xanadu.home>
	<AANLkTi==KLWXAv79u32ioQ9eSr7JEii7fW93WPPNdAez@mail.gmail.com>
	<alpine.LFD.2.00.1101191101230.8580@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1101191101230.8580-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 19, 2011 at 9:05 AM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> w=
rote:
> On Wed, 19 Jan 2011, Grant Likely wrote:
>
>> On Wed, Jan 19, 2011 at 8:41 AM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org=
> wrote:
>> > On Wed, 19 Jan 2011, Dave Martin wrote:
>> >> On Wed, Jan 19, 2011 at 1:41 PM, Grant Likely <grant.likely@secretlab=
.ca> wrote:
>> >> > The dtb isn't so much bigendian as it is network byte order.
>> >>
>> >> (For me, "network byte order" is a euphemism ... <insert
>> >> unconstructive rant here>)
>> >
>> > I concur.
>>
>> meh. it's all about conventions. =A0When talking about external data, it
>> is far more important for everyone to agree on the same representation
>> than it is to tailor to each platforms preferences.
>
> Exactly what I said, using different words.
>
>> That said, rant
>> away! =A0I love a good tangent.
>
> The actual problem is not that DT chose to use big endian ordering, but
> rather that BE ordering was invented in the first place. =A0;-)

hahahahaha

g.


-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
