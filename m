From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Add support for named integer constants
Date: Thu, 8 Sep 2011 11:38:44 -0700
Message-ID: <CAPnjgZ1n-VLWNXT=tnO5+QdP=4XCnev_KPrvP91Mn-ZF4JwHHw@mail.gmail.com>
References: <1314739818-13904-1-git-send-email-swarren@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04B327A62D@HQMAIL01.nvidia.com>
	<CAPnjgZ0NzN510XJZ1ONAbMTS3vrrP8qCV8NYHq4_heZL+PizNg@mail.gmail.com>
	<20110908183211.GM2967@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110908183211.GM2967-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
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
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Thu, Sep 8, 2011 at 11:32 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Thu, Sep 08, 2011 at 06:09:27AM -0700, Simon Glass wrote:
>> Hi Stephen,
>>
>> On Fri, Sep 2, 2011 at 11:34 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
>> > Stephen Warren wrote at Tuesday, August 30, 2011 3:30 PM:
>> >> You may define constants as follows:
>> >>
>> >> /define/ TWO 2;
>> >> /define/ FOUR 4;
>> >> /define/ OTHER FOUR;
>> >>
>> >> And properties may use these values as follows:
>> >>
>> >> foo =3D <1 TWO 3 FOUR 5>;
>> >>
>> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> >
>> > David, Jon,
>> >
>> > Does this seem reasonable?
>> >
>> > I think the syntax is simple enough it wouldn't interfere with any more
>> > advanced expression/function/... support in the future, and it could be
>> > easily extended to allow e.g.:
>> >
>> > /define/ FOO "BAR";
>> > /define/ BAX [0af8dacb0];
>> > ...
>>
>> This seems very reasonable to me, and very useful. From the syntax it
>> looks like lower case symbols are allowed also, which is fine with me.
>>
>> I hope that this can go into dtc as we would definitely use it.
>
> What are the risks of symbol conflict with this approach? =A0I'm
> concerned that a poorly chosen /define/ name will break parsing in
> non-obvious ways. =A0Would it be better to have a every define reference
> to be explicit in the syntax?

Can you give an example of symbol conflict?

I vote against explicit syntax...things like $var are pretty ugly I
think. We will end up with Perl. Let's make these defines first class
citizens.

It should be clear enough since these will appear within a value -
i.e. I assume we will do:

/define/ ONE 1
...
/ {
   testing =3D <ONE TWO THREE>;
}

but not:

/define/ which testing
/ {
   which =3D <1 2 3>;
}

which does seem a little ambiguous (although not unresolveable by the
parser with the help of the symbol table).

Regards,
Simon

>
> g.
>
>
