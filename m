From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Boolean properties
Date: Thu, 8 Dec 2011 17:51:12 -0800
Message-ID: <CAPnjgZ0sg3jf9SiGV1fQ1KuwXyTQ8yfKdwo4ROaCfWGuzu=J0A@mail.gmail.com>
References: <CAPnjgZ1BevAt3==ZcQKn_f7xudrcKE+ks0YpHwBFqTXg2uc7Jw@mail.gmail.com>
 <20111206231216.GB7631@truffala.fritz.box>
 <CAPnjgZ1q7EH=dbdqDqwe76xSf7-YLNUprqzC-vrbAZo+FYEtiQ@mail.gmail.com>
 <20111209011551.GB5750@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111209011551.GB5750-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Thu, Dec 8, 2011 at 5:15 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Dec 06, 2011 at 04:01:20PM -0800, Simon Glass wrote:
>> Hi David,
>>
>> On Tue, Dec 6, 2011 at 3:12 PM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Mon, Dec 05, 2011 at 04:29:22PM -0800, Simon Glass wrote:
>> >> Hi,
>> >>
>> >> As I understand it, boolean properties in the device tree are defined
>> >> as follows:
>> >>
>> >> - if the property is present, then it is true
>> >> - if the property is absent, then it is false
>> >
>> > That's the common convention. =A0Although an individual binding could
>> > define something else, and I think some already do define a
>> > boolean~=3Dint approach instead (e.g. the ibm,dfp cpu property). =A0In
>> > some cases that's anticipating future expansion to values other than 0
>> > and 1.
>>
>> OK I didn't know that.
>>
>> >
>> >> The fdtget and fdtput utilities deal with reading and changing these.
>> >> At present fdtget returns the value of the property and is not
>> >> suitable for boolean properties. fdtput allows setting of a property
>> >> value but not removing it.
>> >>
>> >> To deal with boolean properties these utilities need to change. One
>> >> option is to use something like:
>> >>
>> >> $ fdtget -t f /path/to/node property
>> >> (prints 'true' or 'false')
>> >> $ fdtput -t f /path/to/node property false/true
>> >> $ fdtput -t f /path/to/node property 0/1
>> >> (deletes the property for false and 0; adds it with no value for true=
 and 1)
>> >>
>> >> (Unfortunately the 'b' type is taken for byte at present, so it is
>> >> unclear to be so far what letter we should use for 'f' in the -t flag)
>> >
>> > Hrm. =A0Rather than treating this as a boolean "type", I think it would
>> > be less ambiguous to instead add options to explicitly delete a
>> > property (either e.g. fdtput -d or a new fdtdel), and to create an
>> > empty valued property.
>>
>> That was my first thought, but I thought it would be painful since
>> callers would need to do something like:
>>
>> if [ $value -eq 0 ]
>> =A0 =A0fdtput -d /path/to/node property
>> else
>> =A0 =A0fdtput /path/to/node property <some tag that means nothing>
>> =A0 =A0 (or maybe =A0 =A0fdtput -z /path/to/node property)
>> fi
>>
>> so better IMO to provide boolean support in the tool. But it does
>> illustrate that presence/absence is not always ideal.
>
> Hrm. =A0I think that's a lesser evil than having a data "type" that can
> actually completely delete the property.

Well isn't that the nature of the boolean property. In a way that is
exactly my point, that to change a boolean property to zero you have
to delete it. This is not something that fdtput would mandate, merely
make easier for the user. I agree it is odd, and really that is my
point.

>
>> >> But first I would like to suggest that we support boolean properties
>> >> with a value, i.e. change to:
>> >>
>> >> - if the property is absent, then it is false
>> >> - if the property is present, then it is true
>> >> =A0 =A0 - unless the property has a 0 value, iwc it is false
>> >
>> > So the first question here is who/what exactly constitutes "we" here -
>> > kernel, u-boot, dtc? =A0Using the above logic sounds like a good idea
>> > for fdt readers on the "be liberal in what you accept" principle. =A0B=
ut
>> > it's something I'd like to see Mitch Bradley and/or Segher comment on
>> > - they'd have a better idea of whether there's existing practice that
>> > might break with that.
>>
>> I mean device tree users (kernel, u-boot) rather than dtc (which I
>> suspect would be unaffected).
>
> Well, like I say, I have no in principle objection to using this as
> the usual boolean test, but actually changing it is obviously
> something you'd need to convince the maintainers of the relevant
> projects.

OK will see about that...

>
>> >> There are three reasons:
>> >> 1. it is very confusing for the poor user to set a property value to 0
>> >> and have it come back as 'true' from a function that checks these
>> >> sorts of things. This is particularly true since fdt properties do not
>> >> have types, or even type hints. =A0The function I have in mind is
>> >> something like this (modified to fit the discussion):
>> >>
>> >> /**
>> >> =A0* Look up a boolean property in a node and return it.
>> >> =A0*
>> >> =A0* A boolean properly is true if present in the device tree and fal=
se if not
>> >> =A0* present (regardless of any property data/value).
>> >> =A0*
>> >> =A0* @param blob =A0 =A0 =A0 =A0FDT blob
>> >> =A0* @param node =A0 =A0 =A0 =A0node to examine
>> >> =A0* @param prop_name =A0 name of property to find
>> >> =A0* @return 1 if the properly is present; 0 if it isn't present
>> >> =A0*/
>> >> int fdtdec_get_bool(const void *blob, int node, const char *prop_name=
);
>> >>
>> >> An alternative might be to print an error (and refuse to return a
>> >> value) when a boolean property has a value:
>> >>
>> >> =A0* @return 1 if the properly is present; 0 if it isn't present, -1 =
if
>> >> it has any data (and is therefore illegal as a boolean property)
>> >
>> > Kind of a pain for C.
>>
>> I don't like it either. But we currently have a situation where a zero
>> value is considered true, and this can be confusing. I would prefer to
>> expand the meaning.
>
> Actually, on further thought, I don't mind the above so much, because
> even if you use it without checking for the error value, you'll at
> least get the right behaviour for the unambiguous cases.

Yes that's right. Of course you will get the 'right' behaviour when
the value is 0 (i.e. the boolean will be considered true).

>
>> >> 2. it allows us to adjust the boolean value without requiring a change
>> >> in the size of the device tree blob (faster, easier)
>> >>
>> >> 3. Related to 2 it allows us to put template values in the fdt which
>> >> can then be *optionally* updated in the build system or in U-Boot to
>> >> the required value before passing to the kernel.
>> >>
>> >> I presume this discussion has happened before - can anyone please
>> >> point me to the thread?
>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson

Regards,
Simon
