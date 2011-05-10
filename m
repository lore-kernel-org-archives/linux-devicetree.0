From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Multiple ic2 muxes in a device tree
Date: Tue, 10 May 2011 12:54:16 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04986AA009@HQMAIL01.nvidia.com>
References: <1B936DB9F22546409EE7E2F50AE76BEE02031931@dragon.enablence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1B936DB9F22546409EE7E2F50AE76BEE02031931-9O/25/N66ri8qk8cMQiaxVaTQe2KTcn/@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: James Baldwin <James.Baldwin-x63MV80W0Hll57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

James Baldwin wrote at Tuesday, May 10, 2011 1:24 PM:
> I have the following i2c topology and specify the devices as follows:
> i2c@3100 {
> =A0=A0=A0=A0=A0=A0=A0 #address-cells =3D <1>;
> =A0=A0=A0=A0=A0=A0=A0 #size-cells =3D <0>;
> =A0=A0=A0=A0=A0=A0=A0 cell-index =3D <1>;
> =A0=A0=A0=A0=A0=A0=A0 compatible =3D "fsl-i2c";
> =A0=A0=A0=A0=A0=A0=A0 reg =3D <0x3100 0x100>;
> =A0=A0=A0=A0=A0=A0=A0 interrupts =3D <15 0x8>;
> =A0=A0=A0=A0=A0=A0=A0 interrupt-parent =3D <&ipic>;
> =A0=A0=A0=A0=A0=A0=A0 dfsrr;
> =

> =A0=A0=A0=A0=A0=A0=A0 temp-sensor@49 {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "national,lm=
73";
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x49>;
> =A0=A0=A0=A0=A0=A0=A0 };
> =

> =A0=A0=A0=A0=A0=A0=A0 eeprom@54 {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0compatible =3D "at24,24c02";
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x54>;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pagesize =3D <4>;
> =A0=A0=A0=A0=A0=A0=A0 };
> =

> =A0=A0=A0=A0=A0=A0=A0 mux@77 {

Bear in mind I'm very new to devicetree, but in:
http://www.mail-archive.com/linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org/msg03910.html
it was suggested to name this node "i2cmux" not "mux".

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #address-cells =3D <2>;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D <0>;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "philips,pca=
9547";
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0reg =3D <0x77>;
> =

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mux@0,70 {

... and this node "i2c" not "mux".

The implication was the the node names actually have an effect on the
parsing, and need to match the type of object represented. Does renaming
them following those conventions help?

> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #ad=
dress-cells =3D <2>;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #si=
ze-cells =3D <0>;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 com=
patible =3D "philips,pca9547";
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg=
 =3D <0 0x70>;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 };
>...

-- =

nvpublic
