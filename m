From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: RFC: Host-endian device tree format
Date: Thu, 20 Jan 2011 09:28:08 +0000
Message-ID: <AANLkTi=EmCaTJ6esSZvJDe2-Z-GR8OvvBQ7k1_Qz7qMj@mail.gmail.com>
References: <AANLkTi=AdwaW5vvm1TzNxcNrjYiJ3dOEjwoZrm-koxuw@mail.gmail.com>
	<AANLkTikoZj1WSpE8QNSRiF3oFL4qAb68kNnCKdExvBz7@mail.gmail.com>
	<AANLkTi=xdJ_c3LvCFkeqBRNDf6TSC40Fjxihm9eSeMmf@mail.gmail.com>
	<alpine.LFD.2.00.1101191031481.8580@xanadu.home>
	<AANLkTi==KLWXAv79u32ioQ9eSr7JEii7fW93WPPNdAez@mail.gmail.com>
	<AANLkTim7F8PBd_4zmQY7717N7CoiGvvyX473CL=6qCaj@mail.gmail.com>
	<20110119234755.GA20128@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110119234755.GA20128@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 19, 2011 at 11:47 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Jan 19, 2011 at 04:09:39PM +0000, Dave Martin wrote:
>> On Wed, Jan 19, 2011 at 3:52 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org=
> wrote:
>> > On Wed, Jan 19, 2011 at 8:41 AM, Nicolas Pitre <nicolas.pitre@linaro.o=
rg> wrote:
>> >> On Wed, 19 Jan 2011, Dave Martin wrote:
>> >>> On Wed, Jan 19, 2011 at 1:41 PM, Grant Likely <grant.likely@secretla=
b.ca> wrote:
>> >>> > The dtb isn't so much bigendian as it is network byte order.
>> >>>
>> >>> (For me, "network byte order" is a euphemism ... <insert
>> >>> unconstructive rant here>)
>> >>
>> >> I concur.
>> >
>> > meh. it's all about conventions. =A0When talking about external data, =
it
>> > is far more important for everyone to agree on the same representation
>> > than it is to tailor to each platforms preferences. =A0That said, rant
>> > away! =A0I love a good tangent.
>>
>> I guess a good example of what I mean is ELF - the endianness of an
>> ELF image is discoverable, and cross tools do exist -- but because ELF
>> images are strongly bound to their target platform, running the image
>> takes precedence over the simplicity of the tools: so the images are
>> specified in such a way that they can always be host-endian for the
>> machine they run on, without creating format ambiguities.
>
> Yes, there's no technical impediment to making a little-endian dtb
> format. =A0In fact dtc and libfdt were written with this possibility in
> mind, to the extent that there are hooks / functions in the right
> places to make this reasonably straightforward.
>
> The fact that there are actually two questions here - the endianness
> of the framing dtb format, and the endianness of the property values
> themselves complicates the issue.
>
>> Of course, it's stretching things rather a lot to claim that fdt
>> parsing is performance critical ... or that ELF cross tools work well
>> in all host/target combinations ... rather it's a niggle.
>
> But, there is just no point in creating a variant format. =A0The
> performance cost is completely negligible (even using the rather
> stupid conversion macros from libfdt which gcc generates horrible code
> for).
>
> The simplicity of having only one variant for tools to deal with wins,
> no contest.

All good arguments, everyone-- thanks for the background.

Like I said, I'm happy for things to stay the way they are.

Cheers
---Dave
