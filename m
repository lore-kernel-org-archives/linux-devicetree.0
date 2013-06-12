From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: microblaze device-tree description - pair intc/buses and timers
Date: Wed, 12 Jun 2013 14:19:18 +0200
Message-ID: <51B86746.5040601@monstr.eu>
References: <51A35E6D.5040706@monstr.eu>
 <20130611130236.D2ACA3E0A90@localhost> <51B72F4B.9030700@monstr.eu>
 <20130611222225.9753A3E0D8D@localhost> <51B8157D.5000407@monstr.eu>
 <CACxGe6skAtfzcNFX=0upAWqr6td+7wYsPxvo1q6Q9khn4N=Y6Q@mail.gmail.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8869449679258972657=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6skAtfzcNFX=0upAWqr6td+7wYsPxvo1q6Q9khn4N=Y6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Edgar Iglesias <edgari-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Peter Crosthwaite <pcrost-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8869449679258972657==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2OFKXASQNGPWAKIWQTNWX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2OFKXASQNGPWAKIWQTNWX
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/12/2013 11:16 AM, Grant Likely wrote:
> On Wed, Jun 12, 2013 at 7:30 AM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:=

>> On 06/12/2013 12:22 AM, Grant Likely wrote:
>>> On Tue, 11 Jun 2013 16:08:11 +0200, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> w=
rote:
>>> It would mean every device driver needs to be polled. As long as the
>>> polling frequency is high enough for the work load then it should be
>>> okay. I don't see a problem with there being no interrupt controller,=

>>> unless there needs to be a dummy one just to keep the kernel happy.
>>
>> Interesting. I have tried to compile the fragment below by dtc
>> and there is no warning. It also means that there is missing checking
>> in DTC for interrupt-cells.
>>
>> What I am worried about is that request_irq in the driver will require=

>> irq chip functions which there are not.
>=20
> A driver cannot call request_irq if it doesn't have an irq number to
> call it with, and it won't have an IRQ number if there is no irq
> specifier in the DT, so you should be fine in that regard.

That's correct but in my example there was interrupt listed and connected=

because it also says that interrupt is enabled directly on the IP.

I have also started to think how to properly describe clocksource
driver because it is also uniq in the system because all cpus
should have access to this IP.
It means that not every timer could be possible to use for this purpose.
What we have for single microblaze and multi cpu system is just extension=

of this is that we are using special name for this clocksource timer
which is called system-timer.
Do you think that this rule is fine or any additional description should
be made?

Clockevent is easy because the first suitable timer can be used for it
or the most accurate one.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2OFKXASQNGPWAKIWQTNWX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlG4Z0cACgkQykllyylKDCGTIwCgijlqtQ12xKF7RcGprEkSZCvf
XfwAn2Qolb8m8t3jvd2l6P6EkQDBTMUu
=1AYi
-----END PGP SIGNATURE-----

------enig2OFKXASQNGPWAKIWQTNWX--

--===============8869449679258972657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8869449679258972657==--
