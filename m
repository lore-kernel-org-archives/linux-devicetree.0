From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: devicetree: dwc3: Add interrupt moderation
Date: Fri, 28 Oct 2016 13:30:07 +0300
Message-ID: <87mvhosr4g.fsf@linux.intel.com>
References: <cover.1477424426.git.johnyoun@synopsys.com> <e7a864e5a2af12d5a8d97f2591065f4aa85f86cb.1477424426.git.johnyoun@synopsys.com> <20161026105632.GG19965@leverpostej> <36413315-16eb-d690-b559-ab5ae103c5f9@synopsys.com> <20161028102350.GD5806@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161028102350.GD5806@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:
> On Thu, Oct 27, 2016 at 02:08:25PM -0700, John Youn wrote:
>> On 10/26/2016 3:57 AM, Mark Rutland wrote:
>> > On Tue, Oct 25, 2016 at 12:42:46PM -0700, John Youn wrote:
>> >> Add interrupt moderation interval binding for dwc3.
>
>> >> + - snps,imod_interval: the interrupt moderation interval.
>
>> > What is "interrupt moderation"? The cover mentions that this is to be
>> > used for some kind of workaround, but it's not clear to me what this i=
s,
>> > and as such, whether it makes sense to describe it in this manner.
>> >=20
>>=20
>> Interrupt moderation throttles the interrupt rate to be no faster than
>> a specified interval. It's an optional feature of the controller.
>
> Ok.
>
>> This series implements the feature and enables it as a workaround for
>> a particular version of the controller.
>
> ... as a workaround for *what*? Is there a bug in that IP version, or an

you didn't receive the entire series, I guess. Here's last patch in the
series:

 This is a workaround for STAR 9000961433 which affects only version
 3.00a of the DWC_usb3 core. This prevents the controller interrupt from
 being masked while handling events. Enabling interrupt moderation allows
 us to work around this issue because once the GEVNTCOUNT.count is
 written the IRQ is immediately deasserted and won't be asserted again
 until GEVNTCOUNT.EHB is cleared.

 Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
 ---
  drivers/usb/dwc3/core.c | 12 ++++++++++++
  1 file changed, 12 insertions(+)

 diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
 index 6733838..7fa0832 100644
 --- a/drivers/usb/dwc3/core.c
 +++ b/drivers/usb/dwc3/core.c
 @@ -1050,6 +1050,18 @@ static void dwc3_check_params(struct dwc3 *dwc)
		 dwc->imod_interval =3D 0;
	 }

 +	/*
 +	 * Workaround for STAR 9000961433 which affects only version
 +	 * 3.00a of the DWC_usb3 core. This prevents the controller
 +	 * interrupt from being masked while handling events. IMOD
 +	 * allows us to work around this issue. Enable it for the
 +	 * affected version.
 +	 */
 +	if (!dwc->imod_interval &&
 +	    (dwc->revision =3D=3D DWC3_REVISION_300A)) {
 +		dwc->imod_interval =3D 1;
 +	}
 +
	 /* Check the maximum_speed parameter */
	 switch (dwc->maximum_speed) {
	 case USB_SPEED_LOW:

> integration issue? Does the problem vary per-board?
>
> Generally, if there's a problem that needs to be worked around, we
> describe the problem in the DT (perhaps implicitly in the compatible
> string), and then the kernel chooses the workaround.

Regardless of the silicon erratum, interrupt moderation is a *feature*
of the IP, common to all instances since revision v3.00a (IIRC). John is
just using interrupt moderation in the context of implementing this
workaround. But the actual feature is valid also without the erratum.

Another thing to remember is that different applications (i.e. boards)
might want to moderate the interrupt for different periods. That's,
again, not related to the erratum at all.

We cannot use compatible to figure this one out. dwc3 does as much
runtime discovery as possible, but we cannot discover what is the
desired interrupt moderation interval for $this setup. It needs to be
passed in on a board-by-board basis.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYEyivAAoJEMy+uJnhGpkGo5EP/2LN7FvyKSRZPxO4NJ3N7E2F
2jRWdr9mgIBxjRRn21vuHMyKBHSwO7bcZ7eLKMfBtO32Q0bYexQgdvnZxIzWZGgX
MMWWhgi0WpcreDOdqClehrbTIenWM3Pq+jmTx7cQIFbUwRb8tOT0q22oCVOcX41T
M1/jX+7fx/Y5q48WtiXXf7US2OLIG8UOyweda4gPkcfAyG9cknxmGXr/d7q1lvSq
/6c8M4IRmsHGnnNSQg7qqWhPY5j0EZ/4p3d+tcDoFAHoNF3jOQLUUXgUc74wS3PN
9gW5qBjUOiw9rUSYO+z4Czl7tN7jVUSCR2cbpzYE+PKbyfhfRtmQlp1FwIhv8JhQ
+AWG0amoIFPs99gbbVYnGLlGfpVg3+Rqfw3/q5iPigKw2T1Q5B+g2HCHZNfpnRBu
TBlt68DHqSjtQRE4B0S7SYFzA0uBvdC7RVGOqpdNOKpDdEAxNzYJXkafKGiO4I3Z
ceHzAwTKBC/3X063U4wssIi1CH4yGMYoj561SpsqYEXMsAgtUusVfaGzVgkRcNZB
2uyBkgBChc8Rq4bB87EY3NKs6YIicPncQ4gNo1AdDwfjd90F4Y28QYv/4nJwDAPp
C6btxDQP8dk3UtexUtEeL34iRLZmxqJEmhawzhvJIkDGRpifgVIuekqaWClnhg+j
croCbZn9rAHIFfCMVxlD
=1xVI
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
