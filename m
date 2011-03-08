From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 2/3] arm/dt: add very basic dts file for babbage board
Date: Tue, 8 Mar 2011 11:31:07 +0800
Message-ID: <AANLkTimSxsdWSvtWS00BbXOjvHS5g6CeYo+kH=K4VP7m@mail.gmail.com>
References: <1299503160-9910-1-git-send-email-jason.hui@linaro.org>
	<1299503160-9910-3-git-send-email-jason.hui@linaro.org>
	<20110307145136.GC9978@S2101-09.ap.freescale.net>
	<AANLkTi=NO+=wa8m980Q_uEMQDOXOUwy7h8Fzi4KZJ+a0@mail.gmail.com>
	<20110308031153.GA14370@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110308031153.GA14370-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Shawn,

On Tue, Mar 8, 2011 at 11:11 AM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Tue, Mar 08, 2011 at 10:20:33AM +0800, Jason Hui wrote:
>> Hi, Shawn,
>>
>> On Mon, Mar 7, 2011 at 10:51 PM, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wro=
te:
>> > Aha, Jason. =A0Grant and I put many comments on v1 of this patch, but =
it
>> > seems that v2 is identical to v1, except adding Rob Herring sign-off.
>>
>> Please compare with v1 and say it once again, It should include the
>
> Oops! =A0Sorry, I messed up with my local branches last night, probably
> because it was late :)
>
>> grant and your comments except the mxctty1
>> due to I think that it's not one issue, So, I did not take your comments.
>>
> I still think it's an issue that the dt kernel needs a different
> console cmdline from the non-dt one.

In fact, this is user defined, I think But why we need mxctty1 in dt
here, the reason is that,

uart3 will be probed first and then uart0, uart1, which lead to
mxctty0 ---> uart3,

mxctty1---> uart0 and mxctty2 --->uart1.

The debug uart of mx51 babbage board is uart0, so we need define
mxctty1 in the kernel command line.

We can put spba@70000000 at the back of aips@73f00000, but it will
make the memory address not sorted
from lower to higher.


spba@70000000 {
                #address-cells =3D <1>;
                #size-cells =3D <1>;
                compatible =3D "simple-bus";
                ranges =3D <0x0 0x70000000 0x100000>;

                imx-uart@c000 {
                        compatible =3D "fsl,imx51-uart";
                        reg =3D <0xc000 0x1000>;
                        interrupts =3D <0x21>;
                        rts-cts;
                        uart-clock =3D <&uart2_clk>, "uart";
                };
        };

        aips@73f00000 {
                #address-cells =3D <1>;
                #size-cells =3D <1>;
                compatible =3D "simple-bus";
                ranges =3D <0x0 0x73f00000 0x100000>;

                imx-uart@bc000 {
                        compatible =3D "fsl,imx51-uart";
                        reg =3D <0xbc000 0x1000>;
                        interrupts =3D <0x1f>;
                        fsl,has-rts-cts;
                        uart-clock =3D <&uart0_clk>, "uart";
                };

                imx-uart@c0000 {
                        compatible =3D "imx-uart";
                        reg =3D <0xc0000 0x1000>;
                        interrupts =3D <0x20>;
                        fsl,has-rts-cts;
                        uart-clock =3D <&uart1_clk>, "uart";
                };


>
>> But I observed that some comments as Grant suggest to use decimal not
>> hex value for #address-cells and #size-cells,
>> not applied to this file globally, I will fix it in the V3 patch if need.
>>
>> >
>> > On Mon, Mar 07, 2011 at 09:05:59PM +0800, Jason Liu wrote:
>> >> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> >> Singed-off-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> >> ---
>> >> =A0arch/arm/boot/dts/babbage.dts | =A0110 +++++++++++++++++++++++++++=
++++++++++++++
>> >> =A01 files changed, 110 insertions(+), 0 deletions(-)
>
> --
> Regards,
> Shawn
>
>
