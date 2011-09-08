From: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/3] dtc: Support character literals in bytestrings
Date: Thu, 8 Sep 2011 09:02:33 -0700
Message-ID: <CAF6FioURFeRZ5Oe3-QUA9Ww4_tiZ0iKyUcioLvuYC=CJcCXC9Q@mail.gmail.com>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-4-git-send-email-robotboy@chromium.org>
	<20110908035149.GO30278@yookeroo.fritz.box>
	<20110908070716.GC15955@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110908070716.GC15955-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2011 at 12:07 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Thu, Sep 08, 2011 at 01:51:49PM +1000, David Gibson wrote:
>> On Wed, Sep 07, 2011 at 04:15:40PM -0700, Anton Staaf wrote:
>> > With this patch the following property assignment:
>> >
>> > =A0 =A0 property =3D ['a' 2b '\r'];
>> >
>> > is equivalent to:
>> >
>> > =A0 =A0 property =3D [61 2b 0d];
>>
>> So, I still have some reservations about this syntax.
>>
>> It occurred to me: do you actually need to intermix character and
>> hexbyte values that much? =A0Could I suggest an alternate sytax as:
>>
>> =A0 =A0 =A0 property =3D 'a', [2b], 'r';
>>
>> The new character literals sufficiently distinct not to cause problems
>> here, and it maintains the , =3D=3D bytestring append behaviour we alrea=
dy
>> have.
>>
>> Thoughts?
>
> Does it matter much? =A0I'm happy with either. =A0Is there a downside to
> the first syntax?

I don't think it matters that much, though in my use case of encoding
a keyboard mapping table I do actually intermix character literals and
two character hex values a lot.  In particular, I use 00 to indicate a
key that is not present in the scan matrix.  I also use hex values
with the top bit set to indicate special characters, such as modifiers
or arrow keys.  So I guess I have a slight preference for my original
syntax, which has another advantage of looking a bit more C-like.
Though I could certainly use the alternate syntax as well.  One last
thought, the alternate syntax will require quite a few additional
commas and square brackets, most likely causing my tables to wrap and
thus get become even longer in the dts file.

Thanks,
    Anton

> g.
>
>
