From: Anil Kumar <anilk4.v-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Reg:Trying to get the ADC working on the Beaglebone with 3.8
 kernel
Date: Tue, 12 Feb 2013 19:09:57 +0530
Message-ID: <CABYxbz4tnBM2v_QHKANV1bBCEWpyi_oS1DZA5X=2WdJjUFNATw@mail.gmail.com>
References: <000001ce0923$9d97f510$ad0fa8c0@mistral.in>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <000001ce0923$9d97f510$ad0fa8c0-HrUwqZBnLO6f0DUV/oxz1A@public.gmane.org>
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
To: Vijay S <vijay-EvXpCiN+lbve9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vijay,

On Tue, Feb 12, 2013 at 6:49 PM, Vijay S <vijay-EvXpCiN+lbve9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> Hi,
>
> Am trying to get the ADC working on the beagle bone. Have cloned/pulled the
> latest kernel from the following branch
> https://github.com/beagleboard/kernel/tree/3.8 , applied the patches and
> built the kernel.
>
>
>
> Have included the below structure under the am335x-bone-common.dtsi
> (attached herewith is the dts file for your reference)
>
>
>
> tscadc@44e0d000 {
>
>                                     status = "okay";
>
>                                     compatible = "ti,ti-tscadc";
>
>                                     reg = <0x44e0d000 0x1000>;
>
>                         interrupt-parent = <&intc>;
>
>                         interrupts = <16>;
>
>                         ti,hwmods = "adc_tsc";
>
>             };
>
>
>
> &tscadc {
>
>         tsc {
>
>               ti,wires = <4>;
>
>             ti,x-plate-resistance = <200>;
>
>                ti,steps-to-configure = <5>;
>
>              ti,wire-config = <0x00 0x11 0x22 0x33>;
>
>         };
>
>
>
>         adc {
>
>                 ti,adc-channels = <8>;
>
>         };
>

have you done pin mux for this ?

>
>
>
>
> The device is getting registered( [1.578678] input: ti-tsc as
> /devices/ocp.2/44e0d000.tscadc/tsc/input/input0
>
> [    1.586799] tsc tsc: Initialized OK) as can be seen from the attached
> kernel log(3.8_kernel_ts_adc_sys_iio_devices.txt).
>
>
>
> Am able to view the "tiadc" under the devices in the following path  cat
> /sys/devices/ocp.2/44e0d000.tscadc/tiadc/iio\:device0/  and cat
> /sys/bus/iio/devices/iio\:device0/ , but am not able to list out
> "in_voltageX_raw" in either of the paths.
>
>
>
> Can you please suggest if am missing anything?
>
>
>
> Regards,
>
> Vijay
>
>
>
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
