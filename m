From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/7] UDC: Rename amd5536udc driver file based on IP
Date: Fri, 31 Mar 2017 12:49:51 +0300
Message-ID: <87wpb5ixmo.fsf@linux.intel.com>
References: <1490698929-10915-1-git-send-email-raviteja.garimella@broadcom.com> <1490698929-10915-3-git-send-email-raviteja.garimella@broadcom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490698929-10915-3-git-send-email-raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:

> This patch renames the amd5536udc.c that has the core driver
> functionality of Synopsys UDC to snps_udc_core.c
>
> The symbols exported here can be used by any UDC driver that uses
> the same Synopsys IP.
>
> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

unfortunately, this patch doesn't apply:

Applying: UDC: Rename amd5536udc driver file based on IP
error: corrupt patch at line 235
Patch failed at 0001 UDC: Rename amd5536udc driver file based on IP
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Can you rebase on testing/next and resend?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAljeJj8ACgkQzL64meEa
mQYzsg//Qx6qcolnhBjzRi87jKzHBiWMzr4PPiBY4nGzZFuBsC2ddOyGF3sGh5fc
nTV5yj/CMpB0BfE9/CcQA4TmaNLsBJ+gq542xpMmuHe4HqGeh7V0YEYnKnPKNYJ9
d842rDxvtggigYc14+sZQ6FVA73QQ2+w+qFQOo1KzF9m77AgeYoLUju6U0SqXT6y
Oa26AywcEI/rjjSjHpQzhDPAbmCKkqcBrEWpv4PcqXCHZZT3reTfLpCfu9mhEuOR
g8TMT9vu2wHTFNYFA46G7CXHOdTwqhzPlRo+JUfh7zggP3RF/CmIXaafq/Q5GTS8
M/AElAhIULUSMZNW+OAU7LCn4Ii8V+0WeiKbl4Lz5lJECNjcgbO1pXv9eMwygZwS
bAR9rKIghq3V7exnErYWrgIHQDHBnp+2QoVB3wIReNatLupsvr98ZPHzOYhb0voZ
qUN3nITynAT6hENHFWZH0MJDqebyduOaenDYgpbkvYoAfxRfJhlzGMy3LWe46q49
h0KNy14wu3YL3LKazx/cQ113URM4IUsrVdg2MzS1yXWzgauy0TfUzkZGRUP7vWfr
CG6eVeck5PCRC3XEHNIFUuptRik9mGfXjqyDxT4jznkgejWg6qhOXHmm1sT7KQgD
fe/+B1so1V0yZUay0HIVgPMJi4wmTvoEWhEepcXEh3pxKTSH8KQ=
=aZhy
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
