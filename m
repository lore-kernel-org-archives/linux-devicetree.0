From: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/2] Character literal parsing
Date: Wed, 20 Jul 2011 09:23:36 -0700
Message-ID: <CAF6FioVMOxF7Vc74F6-yPGkwx7xS_xEa03Q2BpQewGaG=ZvkYQ@mail.gmail.com>
References: <1308871239-32683-1-git-send-email-robotboy@chromium.org>
	<8yawrgb3smr.fsf@huya.qualcomm.com>
	<BANLkTi=iUqMwag-A6t1ubDgSAN9xqWuTMwLG32EKKWuwVbigyg@mail.gmail.com>
	<20110720134238.GK6399@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110720134238.GK6399-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 20, 2011 at 6:42 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Jun 24, 2011 at 01:22:13PM -0700, Anton Staaf wrote:
>> On Fri, Jun 24, 2011 at 1:02 PM, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wro=
te:
>>
>> >
>> > Does this mean that the dtc inside the kernel is going to be the
>> > required tool to use to build device trees? =A0This change doesn't cha=
nge
>> > the DTB format, so it's as much of a concern, but was wondering if we'=
re
>> > intending to keep things compatible.
>> >
>>
>> To be honest, I don't know enough to say either way. =A0I am using the
>> character literals in a device tree that is used to configure a
>> single firmware image for multiple boards. =A0That device tree is not
>> currently passed on to the kernel.
>>
>> Your question makes me think that there are two device tree compilers th=
at I
>> should be paying attention to, is that the case? =A0Or was it a more gen=
eral
>> comment about diverging from a historic syntax for device tree
>> source files?
>
> Oh, yes, forgot to mention that.
>
> If you want to make extensions to dtc, you should do it to the
> upstream dtc at git://git.jdl.com/software/dtc.git. =A0The in-kernel
> version is just a irregularly updated snapshot of that one.

Yup, that's the repository I formed my patches against.  My
understanding was that this was the correct mailing list to send such
patches to.  But if there is another way to submit patches to the
upstream dtc repository please let me know.

Thanks,
    Anton

> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
