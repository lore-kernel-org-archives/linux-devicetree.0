From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 4/9] drivers/of: Allow IRQ code to work properly on
	architectures without NO_IRQ
Date: Tue, 10 Aug 2010 12:29:41 -0600
Message-ID: <AANLkTi=TuuOCfU7mK0SxRF4U-M2S4r+u7ocLWpwkiNEj@mail.gmail.com>
References: <11fcb9aa-72df-45bb-b79f-3e463c32dc71@SG2EHSMHS005.ehs.local>
	<AANLkTikdrgxj3UoMfCzUEB2D7rdbtCnkTwHPbr_JsAcb@mail.gmail.com>
	<696fa87a-7034-4c92-8ad3-ccbcc0eb3fd6@SG2EHSMHS005.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <696fa87a-7034-4c92-8ad3-ccbcc0eb3fd6-RaUQJvECHitEus+KprP3J7jjLBE8jN/0@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 10, 2010 at 11:57 AM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
>
>> -----Original Message-----
>> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gr=
ant Likely
>> Sent: Tuesday, August 10, 2010 10:55 AM
>> To: Stephen Neuendorffer
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: Re: [PATCH v2 4/9] drivers/of: Allow IRQ code to work properly =
on architectures without
>> NO_IRQ
>>
>> On Fri, Jul 23, 2010 at 4:15 PM, Stephen Neuendorffer
>> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> > Sane architectures don't rely on NO_IRQ. =A0The device tree code shoul=
dn't
>> > require it either.
>>
>> I'm going to sit and think on this for a bit. =A0I've got the same
>> problem in MIPS, and I want to use the same solution in both cases.
>
> Agreed... I want to reiterate that the bulk of these changes are trying t=
o make the problems
> concrete: I love the fact that the patches are getting smaller as the pro=
blems get fixed in a
> general way.

:-)

My favorite patches are the ones that just go away.

g.
