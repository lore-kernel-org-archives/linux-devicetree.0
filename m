From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: rockchip: convert smp bringup to CPU_METHOD_OF_DECLARE
Date: Mon, 26 May 2014 12:21:46 -0700
Message-ID: <CAOesGMhvLHryv6HXYq=YpnGJWVyyECLVQ3UXoyE2ugyxYBUfXw@mail.gmail.com>
References: <1632873.urGeGsUMPH@diego>
	<1878147.CvhHSZhTas@diego>
	<20140526181315.GA27093@quad.lixom.net>
	<77845932.xlUTKoJDWT@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <77845932.xlUTKoJDWT@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 26, 2014 at 12:20 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> =
wrote:
> Am Montag, 26. Mai 2014, 11:13:15 schrieb Olof Johansson:
>> On Thu, Mar 27, 2014 at 01:06:32AM +0100, Heiko St=C3=BCbner wrote:
>> > With the newly introduced CPU_METHOD_OF_DECLARE is not necessary a=
nymore
>> > to reference the relevant smp_ops in the board file, but instead i=
t can
>> > simply be set by the enable-method property of the cpu nodes.
>> >
>> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>>
>> Applied, however:
>> > ---
>> >
>> > changes since v1:
>> >   - add a short description to the enable-method binding
>> >
>> >  Documentation/devicetree/bindings/arm/cpus.txt | 2 ++
>> >  arch/arm/boot/dts/rk3066a.dtsi                 | 1 +
>> >  arch/arm/boot/dts/rk3188.dtsi                  | 1 +
>> >  arch/arm/mach-rockchip/core.h                  | 2 --
>> >  arch/arm/mach-rockchip/platsmp.c               | 3 ++-
>> >  arch/arm/mach-rockchip/rockchip.c              | 1 -
>> >  6 files changed, 6 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/arm/cpus.txt
>> > b/Documentation/devicetree/bindings/arm/cpus.txt index 333f4ae..f5=
2a9ac
>> > 100644
>> > --- a/Documentation/devicetree/bindings/arm/cpus.txt
>> > +++ b/Documentation/devicetree/bindings/arm/cpus.txt
>> > @@ -185,6 +185,8 @@ nodes to be present and contain the properties
>> > described below.>
>> >                         "qcom,gcc-msm8660"
>> >                         "qcom,kpss-acc-v1"
>> >                         "qcom,kpss-acc-v2"
>> >
>> > +                       "rockchip,rk3066-smp" - cpu-core handling =
of Socs
>> > +                                   from Rockchip starting with rk=
3066
>>
>> Nobody else has a comment here, so I removed this one.
>>
>> I noticed that the list is unsorted, in particular the new marvell e=
ntries
>> were appended instead of inserted at the right location, which cause=
d a
>> merge conflict. Sigh. I'll do a separate commit on top to sort the l=
ist,
>> since we seem to have the new out-of-order additions in our tree.
>
> I added the comment after Mark Rutland noted:
>
> "We should document what what these actually mean, so as to be a hard=
ware
> description and not a Linux internals description."
>
> But I'm fine with it either way :-)

Ah! Well, I suggest a pass through to document all of them then :)
However, the compatible strings should be documented elsewhere in the
tree so they should just be possible to reference.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
