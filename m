From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: DTC failure on /memreserve/ if moved after /include/
Date: Mon, 2 May 2011 14:13:49 -0600
Message-ID: <BANLkTi=Ur35u2A0YouKTWk4CLCNzeXvTKg@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B1BF@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0497F1B1BF-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

cc'ing David Gibson and Jon Loeliger who both can do a better job of
answering this question.

g.


On Mon, May 2, 2011 at 12:54 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> The following from tegra-harmony.dts compiles fine:
>
> =A0 =A0/dts-v1/;
>
> =A0 =A0/memreserve/ 0x1c000000 0x04000000;
> =A0 =A0/include/ "tegra250.dts"
>
> =A0 =A0/ {
>
> However, if I re-order this as follows:
>
> =A0 =A0/dts-v1/;
> =A0 =A0/include/ "tegra250.dts"
>
> =A0 =A0/memreserve/ 0x1c000000 0x04000000;
>
> =A0 =A0/ {
>
> Then dtc fails:
>
> =A0 =A0 =A0DTC =A0 =A0 arch/arm/boot/tegra-harmony.dtb
> =A0 =A0DTC: dts->dtb =A0on file "arch/arm/boot/dts/tegra-harmony.dts"
> =A0 =A0Error: arch/arm/boot/dts/tegra-harmony.dts:4.1-13 syntax error
> =A0 =A0FATAL ERROR: Unable to parse input tree
> =A0 =A0make[1]: *** [arch/arm/boot/tegra-harmony.dtb] Error 1
>
> Is this a dtc bug, or does the DTS syntax actually disallow this?
>
> Thanks.
>
> --
> nvpublic
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
