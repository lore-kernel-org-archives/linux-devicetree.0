From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device Tree configuration for I2C-Multiplexer and its Clients
Date: Thu, 20 Aug 2009 09:27:07 -0600
Message-ID: <fa686aa40908200827t2d5273c9g84f58f09b471074f@mail.gmail.com>
References: <D839955AA28B9A42A61B9181506E27C401B337A5@SRVCHBER1212.ch.keymile.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <D839955AA28B9A42A61B9181506E27C401B337A5-AR0Msg4NagxrwccGHPhLvUpAGwC+dI/u0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Herzig, Christian" <Christian.Herzig-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: chris-jmrfutXsf6TiB9QmIjCX8w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 18, 2009 at 2:31 AM, Herzig,
Christian<Christian.Herzig-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org> wrote:
> i2c at 3000 {
> =A0 =A0 =A0 =A0#address-cells =3D <1>;
> =A0 =A0 =A0 =A0#size-cells =3D <0>;
> =A0 =A0 =A0 =A0cell-index =3D <0>;
> =A0 =A0 =A0 =A0compatible =3D "fsl-i2c";
> =A0 =A0 =A0 =A0reg =3D <0x3000 0x100>;
> =A0 =A0 =A0 =A0interrupts =3D <43 2>;
> =A0 =A0 =A0 =A0interrupt-parent =3D <&mpic>;
> =A0 =A0 =A0 =A0dfsrr;
>
> =A0 =A0 =A0 =A0mux at 70 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D <0>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "philips, pca9542";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x70>;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* and now the clients behind the multiple=
xer: */
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* channel 0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dtt at 48 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "national, =
lm75";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x48>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0at24 at 50 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "atmel, at2=
4c08";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x50>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* channel 1 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0at24 at 50 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "atmel, at2=
4c08";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x50>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0};
> };
>
> That can't work for reasons of naming and allocation. My proposal to
> describe the hardware:

It looks to me like you should be using this form:

 =A0 =A0mux@70 {
 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <2>;   /* Note this change */
 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D <0>;
 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "philips, pca9542";
 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x70>;

 =A0 =A0 =A0 =A0 =A0 =A0/* and now the clients behind the multiplexer: */

 =A0 =A0 =A0 =A0 =A0 =A0/* channel 0 */
 =A0 =A0 =A0 =A0 =A0 =A0dtt@0,48 {
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "national,lm75";
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D < 0 0x48 >; /* now reg is s=
pecified with 2 cells */
 =A0 =A0 =A0 =A0 =A0 =A0};
 =A0 =A0 =A0 =A0 =A0 =A0at24@0,50 {
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "atmel,at24c08";
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D < 0 0x50 >;
 =A0 =A0 =A0 =A0 =A0 =A0};

 =A0 =A0 =A0 =A0 =A0 =A0/* channel 1 */
 =A0 =A0 =A0 =A0 =A0 =A0at24@1,50 {
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "atmel,at24c08";
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D < 1 0x50 >;
 =A0 =A0 =A0 =A0 =A0 =A0};
 =A0 =A0};
