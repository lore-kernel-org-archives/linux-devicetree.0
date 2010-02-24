From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] driver-core: Add device node pointer to struct device
Date: Wed, 24 Feb 2010 15:09:24 -0700
Message-ID: <fa686aa41002241409x4bcdabfet43e410eb8c480166@mail.gmail.com>
References: <20100224210514.16289.86611.stgit@angua>
	<20100224214442.GB18437@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100224214442.GB18437-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kay.sievers-tD+1rO4QERM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 24, 2010 at 2:44 PM, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org> wrote:
> On Wed, Feb 24, 2010 at 02:10:30PM -0700, Grant Likely wrote:
>> Greg and Kay,
>>
>> This is a patch from a larger series of OF related cleanup patches. =A0T=
his
>> one adds a new 'of_node' member to struct device, conditional upon
>> CONFIG_OF. =A0The goal is to move of_node out of archdata because all
>> arches using CONFIG_OF need it.
>>
>> Before I commit too much effort down this path, I want to get your
>> feedback. =A0Do you have any objections to this change to struct device?
>>
>> @@ -414,6 +415,9 @@ struct device {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0override */
>> =A0 =A0 =A0 /* arch specific additions */
>> =A0 =A0 =A0 struct dev_archdata =A0 =A0 archdata;
>> +#ifdef CONFIG_OF
>> + =A0 =A0 struct device_node =A0 =A0 =A0*of_node;
>> +#endif
>
> No objection from me, but do we really need the #ifdef here?

I added the #ifdef because it is complete dead weight when CONFIG_OF
is not set.  However, I'll defer to your preference here on what looks
cleaner w.r.t. maintenance.

>> Full patch follows...
>
> Do you want to take this patch through your tree? =A0If so, feel free to
> add:
> =A0 =A0 =A0 =A0Acked-by: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>

I'll take it through my tree.  I've got a lot of related patches that
it should be grouped with, and I'm going to defer it to the 2.6.35
merge window so that it can get some linux-next exposure.

> to the patch.
>
> If not, let me know and I'll take it through my tree.
>
> Glad to see this work coming along, nice job.

Thanks!

Cheers,
g.
