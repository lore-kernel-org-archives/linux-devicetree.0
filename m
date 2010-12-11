From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: microblaze console init
Date: Sat, 11 Dec 2010 15:18:32 -0700
Message-ID: <AANLkTi=Ys++TwYA_Z6-s_bsDbyw+wKgvPitwRahYmB3=@mail.gmail.com>
References: <4D03F229.9070403@home.nl>
	<AANLkTinw3mqpmiUkzf9Drgg+f+b3hFBUoHLmtWSO75GY@mail.gmail.com>
	<4D03F803.6060903@home.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D03F803.6060903-CmkmPbn3yAE@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 11, 2010 at 3:15 PM, Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org> w=
rote:
> On 12/11/10 10:59 PM, Grant Likely wrote:
>>
>> On Sat, Dec 11, 2010 at 2:50 PM, Walter Goossens<waltergoossens-CmkmPbn3yAE@public.gmane.org>
>> =A0wrote:
>>>
>>> I do still have one concern, do I understand correctly that there is no
>>> way
>>> to do address-translation (the "ranges" stuff) on a flattenend tree,
>>> using
>>> the of_get_flat_dt_* functions? This would mean that this code would fa=
il
>>> to
>>> get the correct address for a uartlite connected to a bus that has
>>> address-translation.
>>
>> Correct, none of the flat tree core code tries to do any range
>> translation. =A0In fact, it does very little in the way of looking at
>> reg properties at all. =A0Only the absolute bare minimum required to get
>> through early boot. =A0It could be done, but there really hasn't been a
>> use case for it up to this point. =A0Instead, ranges can be translated
>> after the tree has been unflattened into the live form.
>>
>> g.
>>
> thanks for the quick response!
> I was afraid of this... I'm affraid I do need to use it in the nios code,
> well I don't need to but in order to be flexible (and use the design I'm
> working with right now) but I would prefer it. The way around this I
> currently use is a special parameter in chosen with the address of the
> "early uart" (it's only used for early printk).
> What's cleanest approach here? An extra property in "chosen" or range
> translation in the flatttened tree?

Implement ranges translation in the flat tree code.  It wouldn't be
very hard, and will be a lot more maintainable in the long run.

g.
