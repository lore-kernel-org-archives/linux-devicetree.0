From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] Device Tree Bindings for Freescale TDM controller
Date: Sat, 17 Mar 2012 16:07:29 +0000
Message-ID: <CAOZdJXVU=1bW8_OTMecJHuWaa6_023UnUsfQTX8MGqd3E4SRAg@mail.gmail.com>
References: <1331861451-15427-1-git-send-email-poonam.aggrwal@freescale.com>
 <4F63868D.1030507@freescale.com>
 <ACB6D0C0104CFF42A45A5D82A0DD4F3D09D518@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <ACB6D0C0104CFF42A45A5D82A0DD4F3D09D518-RL0Hj/+nBVDYdknt8GnhQq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Content-ID: <753B82FEA654CF468CCBD8D3C6380330-725oAoX4OcF2GV6JINhBVAC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Aggrwal Poonam-B10812 <B10812-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Singh Sandeep-B37400 <B37400-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 17, 2012 at 2:33 AM, Aggrwal Poonam-B10812
<B10812-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>
>> > + =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,p1010-tdm", "fsl,mpc8315-tdm=
";
>> > + =A0 =A0 =A0 =A0 =A0 reg =3D <0x16000 0x200 0x2c000 0x2000>;
>> > + =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <0>;
>>
>> Show a real clock-frequency, perhaps with a comment saying it's typically
>> filled in by boot software.

> Okay.

Scott, are you suggesting that Poonam put a non-zero number in the DTS
for clock-frequency?  If so, then I don't think that's a good idea, if
U-Boot will always override it.

-- =

Timur Tabi
Linux kernel developer at Freescale
