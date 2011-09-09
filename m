From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Add support for named integer constants
Date: Thu, 8 Sep 2011 20:27:04 -0700
Message-ID: <CAPnjgZ3spz6KLFP-zud_zcE10e=fjoyz49bUoAKdZ6+MMrNodQ@mail.gmail.com>
References: <1314739818-13904-1-git-send-email-swarren@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04B327A62D@HQMAIL01.nvidia.com>
	<CAPnjgZ0NzN510XJZ1ONAbMTS3vrrP8qCV8NYHq4_heZL+PizNg@mail.gmail.com>
	<CAPnjgZ0gUvPSbVb+2+ohmDrqgYukb7+JQKY6P4C_mY0QGp83Gg@mail.gmail.com>
	<20110909013521.GD21002@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110909013521.GD21002-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Thu, Sep 8, 2011 at 6:35 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
[snip]
>> [in a separate email since I don't want to pollute my comments on
>> Stephen's nice patch with separate ravings]
>>
>> Thinking of bitfields, we already have a problem with the way GPIOs
>> are specified. Typically we do something like:
>>
>> something =3D <&gpio 46 5>
>>
>> and define the third parameter to be three bits (direction, initial
>> value, polarity). It would be nice to be able to do something like:
>>
>> something =3D <&gpio 46 INPUT,ACTIVE_LOW>
>> something-else =3D <&gpio 46 OUTPUT,HIGH>
>>
>> instead. That would avoid having to explicitly have expressions
>> containing | or define all combinations like this:
>
> I really don't like the idea of adding an extra explicit syntax for
> bitfields. =A0I much prefer just implementing integer expressions, which
> would allow the same thing through |.

Well that's fine as well. In fact much better since that's on my wish
list too. It will be interesting to try out these new toys and see how
if affects some of the problems we have had with fdt on our platforms.

My justification for explicit bitfield support is that they are
essentially flags which could just occupy a whole cell each, but for
space/efficiency reasons we decide they should be packed together into
a single cell. So the syntax between these two options should perhaps
be similar. With integer expressions, this works, since we convert
<&gpio 147 1 2 4> to <<&gpio 147 1 | 2 | 4> if you see what I mean. It
is the <&gpio 147 7> that I don't like. With Stephen's /define/ patch
we should be able to do things like <&gpio 147 INPUT | ACTIVE_LOW>.

Regards,
Simon

>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
