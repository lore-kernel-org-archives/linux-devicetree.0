From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 3/8] of/fdt: Add unflatten_partial_device_tree
Date: Tue, 16 Nov 2010 16:44:59 -0800
Message-ID: <db162abd-e702-4d34-ac3a-ee6ce512f98d@VA3EHSMHS009.ehs.local>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<91a7e060-e748-47d5-aa7d-4fc45343d212@SG2EHSMHS005.ehs.local>
	<AANLkTikbhjZshaetoTX6kXHwt_SobYUG69cuDZd0gArF@mail.gmail.com>
	<58c8fb4d-50d9-45bb-9a09-9cd04033a912@SG2EHSMHS008.ehs.local>
	<AANLkTimE=YjDsr5em8ttAJkRzjZ6XMF_Hts0w0EpPzqx@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <AANLkTimE=YjDsr5em8ttAJkRzjZ6XMF_Hts0w0EpPzqx-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


> >> > @@ -521,12 +539,12 @@ int __init early_init_dt_scan_chosen(unsigned =
long node, const char *uname,
> >> >
> >> > =A0 =A0 =A0 =A0early_init_dt_check_for_initrd(node);
> >> >
> >> > +#ifdef CONFIG_CMDLINE
> >> > =A0 =A0 =A0 =A0/* Retreive command line */
> >> > - =A0 =A0 =A0 p =3D of_get_flat_dt_prop(node, "bootargs", &l);
> >> > + =A0 =A0 =A0 p =3D of_get_flat_dt_prop(node, "bootargs", &l, initia=
l_boot_params);
> >> > =A0 =A0 =A0 =A0if (p !=3D NULL && l > 0)
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strlcpy(cmd_line, p, min((int)l, COMM=
AND_LINE_SIZE));
> >> >
> >> > -#ifdef CONFIG_CMDLINE
> >>
> >> Why is this being changed?
> >
> > Because it requires a cmd_line global, which all architectures (especia=
lly x86) don't seem to have)
> > Probably if the early stuff get's factored out, then this problem goes =
away.
> =

> I'm considering changing this so that cmd_line is set with an
> arch-specific callback.

I don't think I ever saw a patch for this.  Have you done more than think a=
bout this?

Steve


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
