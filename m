From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC][PATCH 1/2] powerpc/85xx: create dts components to build
 up an SoC
Date: Thu, 20 Oct 2011 16:42:39 +0000
Message-ID: <CAOZdJXWtnBB5=DahG8LGQpeP7or0VZv78duhtPiORk3WOir8gQ@mail.gmail.com>
References: <1319095467-6229-1-git-send-email-galak@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1319095467-6229-1-git-send-email-galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Content-Language: en-US
Content-ID: <6E9B39D76F07344D814663AD6530306A-KZfg59tc24wqcZcGjlUOXw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ok, your other patch makes more sense now.

On Thu, Oct 20, 2011 at 2:24 AM, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wro=
te:

> +++ b/arch/powerpc/boot/dts/fsl/pq3-duart-0.dtsi
> @@ -0,0 +1,8 @@
> +&serial0 {
> + =A0 =A0 =A0 cell-index =3D <0>;
> + =A0 =A0 =A0 device_type =3D "serial";
> + =A0 =A0 =A0 compatible =3D "ns16550";
> + =A0 =A0 =A0 reg =3D <0x4500 0x100>;
> + =A0 =A0 =A0 clock-frequency =3D <0>;
> + =A0 =A0 =A0 interrupts =3D <42 2 0 0>;
> +};

How about we put all serial devices into one pq3-duart.dtsi file, and
let the parent dtsi file reference just the ones that it needs?

-- =

Timur Tabi
Linux kernel developer at Freescale
