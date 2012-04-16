From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Two different interrupt-parents
Date: Mon, 16 Apr 2012 09:55:09 -0400
Message-ID: <CAKON4OyLsh2Us4wrx3Wh+Uw2sT2sMTvgkYahL5reztL906wtWA@mail.gmail.com>
References: <CAKON4OwAix9D61kp9mDq0WVvthDKzm=FFz2AoFQWe1yqJJgf6A@mail.gmail.com>
 <C5ECD7A89D1DC44195F34B25E172658D0CE077@039-SN2MPN1-013.039d.mgd.msft.net>
 <CAKON4Ox9Bi=HYXU_eOjff0aaSuqPEbqbonm1VaKYOcSpx5-WfA@mail.gmail.com>
 <C5ECD7A89D1DC44195F34B25E172658D0CE0E6@039-SN2MPN1-013.039d.mgd.msft.net>
 <20120416045308.GH4625@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120416045308.GH4625-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sethi Varun-B16395 <B16395-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 16, 2012 at 12:53 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Mon, Apr 16, 2012 at 04:14:25AM +0000, Sethi Varun-B16395 wrote:
>> You can use a 4 cell interrupt specifier (we use that in case of embedde=
d power architecture platforms)
>> - First cell corresponds to one of the four cascade lines (coming from t=
he cascaded pic)
>> - Second cell provides the interrupt sense information
>> - Third one tells the interrupt subtype (in your case should be the casc=
ade power interrupt type)
>> - Fourth cell communicates the interrupt number corresponding to the cas=
caded pic.
>>
>> There would be a single interrupt parent, which is the system interrupt =
controller. You would have
>> to translate the four cell interrupt specifier and also add cascaded int=
errupt handling
>> for the shared interrupt line.
>
> No, don't do that.
>
> Use the interrupt-map technique described in the thread that got
> linked earlier.

If interrupts had syntax like GPIOs this problem wouldn't exist.


>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson



-- =

Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
