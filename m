From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv2 2/3] ARM: zynq: dt: Updated devicetree for Zynq 7000
 platform.
Date: Mon, 19 Oct 2015 16:09:09 +0200
Message-ID: <5624F985.8050905@xilinx.com>
References: <1445035350-3569-1-git-send-email-moritz.fischer@ettus.com>
 <1445035350-3569-3-git-send-email-moritz.fischer@ettus.com>
 <20151018175324.GH12756@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151018175324.GH12756-ew3lsbMjNqt5wtABiV/Xjqyly8cj88Ttqxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/18/2015 07:53 PM, Josh Cartwright wrote:
> On Fri, Oct 16, 2015 at 03:42:29PM -0700, Moritz Fischer wrote:
>> Added addtional nodes required for FPGA Manager operation
>> of the Xilinx Zynq Devc configuration interface.
>>
>> Reviewed-by: S=F6ren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
>> ---
>>
>> v2: No changes
>>
>> ---
>>  arch/arm/boot/dts/zynq-7000.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zy=
nq-7000.dtsi
>> index dc0457e..1a5220e 100644
>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>> @@ -294,6 +294,11 @@
>>  		devcfg: devcfg@f8007000 {
>>  			compatible =3D "xlnx,zynq-devcfg-1.0";
>>  			reg =3D <0xf8007000 0x100>;
>> +			interrupt-parent =3D <&intc>;
>=20
> You shouldn't need interrupt-parent here.  In fact, I suspect it can =
be
> removed from all sibling nodes as well.

Correct. But I tend to do it vice-versa. To remove it from amba node an=
d
keep it in every IP here. The reason is simple to let everybody know
that setting up right interrupt controller is something what they have
to care. If you have more interrupt controllers in the system it can be
messy.

But again. Please remove this patch from this series. This will go to
mainline through arm-soc but 1/3 and 3/3 will go through Greg. That's
why please do not include it here.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
