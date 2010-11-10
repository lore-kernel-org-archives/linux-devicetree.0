From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [sodaville] [RFC] [PATCH V3 0/2] Adding DTB to architecture
	independent vmlinux
Date: Wed, 10 Nov 2010 11:55:23 -0700
Message-ID: <AANLkTimgLO0vAQiF4uwHkHnz7SHxiq+KD2iUYV_Y8-Fk@mail.gmail.com>
References: <cover.1289411770.git.dirk.brandewie@gmail.com>
	<4CDAE874.1000707@linux.intel.com> <4CDAED3C.6010304@gmail.com>
	<4CDAEA26.6040206@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CDAEA26.6040206-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 10, 2010 at 11:53 AM, H. Peter Anvin <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrot=
e:
> On 11/10/2010 11:06 AM, Dirk Brandewie wrote:
>> On 11/10/2010 10:46 AM, H. Peter Anvin wrote:
>>> On 11/10/2010 10:52 AM, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>>>
>>>> The DTB's have been moved into the .init.data section.
>>>
>>> Writeable? =A0(As opposed to .init.rodata)?
>>>
>>
>> That is what I remember from the conversation with Grant but I could be
>> mistaken. =A0It is simple enough to move as long as the interested parti=
es agree :-)
>>
>
> Obviously. =A0I'd like to see it readonly unless there is an explicit
> reason not to, of course.

Definitely it should be ro

g.
