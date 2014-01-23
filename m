From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Culling traffic volume on devicetree mailing list
Date: Thu, 23 Jan 2014 08:53:34 -0600
Message-ID: <CAL_JsqL7SHFB2Pg6u0+1ZdeDSRaBS5S_=K8gWGcjbq3MpgyvFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 23, 2014 at 5:03 AM, Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org> wrote:
> On Wed, 2014-01-22 at 10:35 -0800, Olof Johansson wrote:
>> > devicetree-spec: For discussing 'core' device tree bindings. ie.
>> > anything that would be a candidate for putting into an ePAPR type
>> > spec. Individual device bindings would continue to be posted to
>> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, but anything affecting subsystems or
>> > generic patterns should be posted to this new list.
>>
>> I predict that it will be hard for someone posting a patch to tell if
>> they should send it to this list or some other list. It might be
>> convenient for you guys to ignore the high-volume list and just focus
>> on this one, but for the people who post patches it just makes it more
>> complicated. IMHO.
>
> The issue with the current list is that it is too much of a firehose of
> Linux patches for other non-Linux consumers of DTB e.g. BSD folks, me
> with my Xen hat, see [0] for the intersection of those two which
> prompted me to mention this on the call.
>
> The firehose means that these people don't subscribe and therefore lack
> visibility into what is going on with the core bindings (e.g. BSD seems
> to have a different binding for gic interrupts, mentioned in the linked
> thread).
>
> I don't think the intention of the split was/should be that "core"
> Linux/DTB people should only subscribe to -spec@, rather that it be a
> more targeted list which non-Linux/DTB folks can be involved with to
> discuss core binding issues and standardisation etc.
>
> It seems like devicetree@ would be the right default destination for any
> patch and so should be what is listed in MAINTAINERS etc.
>
> Anyone who is doing actual core/spec work appropriate to -spec@ is
> either going to be involved enough to know this themselves or can be
> asked to CC the other list too as part of the first round of review. The
> number of patches which would need to go to -spec should be a pretty
> small fraction.
>

One approach would be to just try to reduce the firehose a bit.

The list gets lots of patches which are not new bindings because we
trigger on any dts change and any patch with of_get_property or
of_match_table. I'm guessing the latter was mainly to catch missing
documentation, but it is clear that we are failing at that as we are
at about 50% documented compatible strings in a new kernel (hopefully
my checkpatch addition will improve that).

I think dts files are pretty well reviewed by platform maintainers and
lots of changes are just new boards using existing bindings. There
should be little for DT maintainers to review there. This was
discussed and agreed to at the ARM summit.

So something like this:

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c20792..4e485c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6267,8 +6267,6 @@ S:        Maintained
 F:     drivers/of/
 F:     include/linux/of*.h
 F:     scripts/dtc/
-K:     of_get_property
-K:     of_match_table

 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 M:     Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
@@ -6279,7 +6277,6 @@ M:        Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
 L:     devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:     Maintained
 F:     Documentation/devicetree/
-F:     arch/*/boot/dts/
 F:     include/dt-bindings/

 OPENRISC ARCHITECTURE
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
