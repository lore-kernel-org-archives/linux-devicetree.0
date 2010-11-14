From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/4] of/fdt: add kernel command line option for dtb_compat
	string
Date: Sat, 13 Nov 2010 23:33:35 -0700
Message-ID: <AANLkTikue3exN3XKdR6QRGA69c6vn1KiVdOmxxqtEkd9@mail.gmail.com>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
	<855a5a11d04a7c1883675b6a77992c4af85222fd.1289520079.git.dirk.brandewie@gmail.com>
	<20101114062246.GD2355@angua.secretlab.ca>
	<2573ead1-944d-4ba5-ace3-12936693d872@SG2EHSMHS006.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <2573ead1-944d-4ba5-ace3-12936693d872-RaUQJvECHiv5op9OF0Koj7jjLBE8jN/0@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 13, 2010 at 11:26 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
>
>> > +=A0=A0 =A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 initial_boot_param=
s =3D blob;
>
>> Blech!=A0 I really need to get Stephen (cc'd) to respin his "of/fdt: Add
>> unflatten_partial_device_tree" patch that decouples the flattree
>> functions from initial_boot_params.=A0 Having to do it this way is just
>> plain ugly.
>
>> Stephen: nudge, nudge.
>
> If things have settled down, I'll dust them off again.
> Don't know if it will happen this week: I'm called for jury duty.

Ouch!  Have fun.

g.
