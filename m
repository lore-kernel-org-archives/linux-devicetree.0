From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH V2] Adding DTB to architecture independent vmlinux
Date: Sun, 31 Oct 2010 23:05:45 -0400
Message-ID: <AANLkTikSWfA2i_hvQ9pS6eQBv=1r6fGXVPZtwWz4giG9@mail.gmail.com>
References: <4CC99628.6000002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CC99628.6000002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 28, 2010 at 11:26 AM, Dirk Brandewie
<dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 10/27/2010 05:57 PM, David VomLehn wrote:
[...]
>> You might then use:
>>
>> =A0 =A0 =A0 =A0obj-y +=3D $(addprefix .dtb.o,$(PLATFORM_DTB))
>>
>> to add blob names, but I'm not completely confident this is the way to g=
o.
>
> I am still trying to settle on the right way to specify the DTB to be lin=
ked
> in
> that won't generate a lot of hate from the build/distribution people where
> they
> are supporting multiple platforms with/without the need of the DTB.

Take a look at the arch/powerpc/boot/Makefile where multiple images
are produced depending on the build target.  There are cuImage.%
targets which link in a different .dtb file based on the % part of the
target.  That allows images for multiple machines to be build from a
single config, rather than depending on a magic setting in the .config
file.

g.
