From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/flattree: Use common ALIGN() macro instead of
	archspecific _ALIGN
Date: Fri, 25 Jun 2010 17:46:52 -0600
Message-ID: <AANLkTik5MsUycP_OVJyr__zbCeqIsKvkhc8MoAdco5En@mail.gmail.com>
References: <20100625220300.6903.3519.stgit@angua>
	<b392c10f-78bb-466d-a3e0-cf5b95edb4cb@VA3EHSMHS014.ehs.local>
	<AANLkTilvOpCVrbT4YPaw3NZUCnKgUN7IUQzQGMfihbSG@mail.gmail.com>
	<bb9a6620-ccf1-4f5b-a1cd-97f93bad4baa@SG2EHSMHS007.ehs.local>
	<AANLkTik_lg0H4-ajyuCmH9LwhY0nAfo4-sax8ETC984h@mail.gmail.com>
	<5facd128-d48a-4b9e-9b4e-83cabcf33921@SG2EHSMHS003.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5facd128-d48a-4b9e-9b4e-83cabcf33921-RaUQJvECHis6W+Ha+8ZLibjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 25, 2010 at 5:36 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
>
>> -----Original Message-----
>> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gr=
ant Likely
>> Sent: Friday, June 25, 2010 4:34 PM
>> To: Stephen Neuendorffer
>> Cc: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org; microblaze-uclinux@itee.=
uq.edu.au; devicetree-
>> discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; jeremy.kerr@cano=
nical.com;
>> sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
>> Subject: Re: [PATCH] of/flattree: Use common ALIGN() macro instead of ar=
chspecific _ALIGN
>>
>> On Fri, Jun 25, 2010 at 5:18 PM, Stephen Neuendorffer
>> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> >> -----Original Message-----
>> >> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of=
 Grant Likely
>> >> Sent: Friday, June 25, 2010 4:16 PM
>> >> To: Stephen Neuendorffer
>> >> Cc: benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org; microblaze-uclinux@it=
ee.uq.edu.au; devicetree-
>> >> discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; jeremy.kerr@c=
anonical.com;
>> >> sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
>> >> Subject: Re: [PATCH] of/flattree: Use common ALIGN() macro instead of=
 archspecific _ALIGN
>> >>
>> >> On Fri, Jun 25, 2010 at 4:49 PM, Stephen Neuendorffer
>> >> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> >> > Grant,
>> >> >
>> >> > I need this for the PCI project. =A0I also have a couple of other
>> >> > generalizations of the drivers/of code
>> >> > to get it to run after boot time in an X86 system...
>> >>
>> >> Send me your patches! =A0:-) =A0Get them to me soon and I'll queue th=
em up
>> >> for the next merge window.
>> >>
>> >> g.
>> >
>> > Dangit, I just got the code compiling, and now I find out that X86 doe=
sn't support out_be32()... =A0:)
>> > You'd think that somewhere somebody might have realized that all the d=
uplicated driver macros that
>> > do that are a bad idea...
>>
>> :-)
>>
>> I think iowrite32be should be cross-arch safe. =A0in_*, out_* was mostly
>> a powerpc/sparc thing.
>>
>> g.
>
> See.. I told you it was a good idea to have that abstracted.. :)

'course the real problem is not the access macros, but rather the fact
that sometime the xilinx registers are wired up as big-endian, and
sometimes as little-endian.

g.
