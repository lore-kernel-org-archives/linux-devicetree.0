From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/8] of/fdt: Add unflatten_partial_device_tree
Date: Tue, 16 Nov 2010 18:48:18 -0700
Message-ID: <AANLkTim82Y9S=W1bhi7N5JkiSmqui1HsNvTaztz3+oSX@mail.gmail.com>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<91a7e060-e748-47d5-aa7d-4fc45343d212@SG2EHSMHS005.ehs.local>
	<AANLkTikbhjZshaetoTX6kXHwt_SobYUG69cuDZd0gArF@mail.gmail.com>
	<58c8fb4d-50d9-45bb-9a09-9cd04033a912@SG2EHSMHS008.ehs.local>
	<AANLkTimE=YjDsr5em8ttAJkRzjZ6XMF_Hts0w0EpPzqx@mail.gmail.com>
	<db162abd-e702-4d34-ac3a-ee6ce512f98d@VA3EHSMHS009.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <db162abd-e702-4d34-ac3a-ee6ce512f98d-+Ck8Kgl/v0/TR3wEnDZ30LjjLBE8jN/0@public.gmane.org>
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

On Tue, Nov 16, 2010 at 5:44 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
>> >> > @@ -521,12 +539,12 @@ int __init early_init_dt_scan_chosen(unsigned=
 long node, const char *uname,
>> >> >
>> >> > =A0 =A0 =A0 =A0early_init_dt_check_for_initrd(node);
>> >> >
>> >> > +#ifdef CONFIG_CMDLINE
>> >> > =A0 =A0 =A0 =A0/* Retreive command line */
>> >> > - =A0 =A0 =A0 p =3D of_get_flat_dt_prop(node, "bootargs", &l);
>> >> > + =A0 =A0 =A0 p =3D of_get_flat_dt_prop(node, "bootargs", &l, initi=
al_boot_params);
>> >> > =A0 =A0 =A0 =A0if (p !=3D NULL && l > 0)
>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strlcpy(cmd_line, p, min((int)l, COM=
MAND_LINE_SIZE));
>> >> >
>> >> > -#ifdef CONFIG_CMDLINE
>> >>
>> >> Why is this being changed?
>> >
>> > Because it requires a cmd_line global, which all architectures (especi=
ally x86) don't seem to have)
>> > Probably if the early stuff get's factored out, then this problem goes=
 away.
>>
>> I'm considering changing this so that cmd_line is set with an
>> arch-specific callback.
>
> I don't think I ever saw a patch for this. =A0Have you done more than thi=
nk about this?

Nope!

g.
