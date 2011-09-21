From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: initial device tree support
Date: Wed, 21 Sep 2011 17:17:28 +0100
Message-ID: <CA+wbFdcOSC6YfsmLndM9CCg2WC9GbQqHmgzk3r8JKs71Bsn8Xg@mail.gmail.com>
References: <1316596786-2539-1-git-send-email-dave.martin@linaro.org>
	<4E79E588.6010703@gmail.com>
	<CACxGe6sTYYXbpXvPb4C+y4JX0eRxLvwjbFycXA8Mjc-XWS1QUA@mail.gmail.com>
	<1316620877.4611.647.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316620877.4611.647.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-CfjtxxwdHycX+EX/Zwu52A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 5:01 PM, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> wrote:
> On Wed, 2011-09-21 at 15:57 +0100, Grant Likely wrote:
>> On Wed, Sep 21, 2011 at 7:24 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
>> > On 09/21/2011 04:19 AM, Dave Martin wrote:
>> >> =A0 =A0 =A0 * arm,amba-bus -- widely used by other boards and patchse=
ts, but
>> >> =A0 =A0 =A0 =A0 seems not to be documented.
>> >>
>> >
>> > This should be dropped. There's not really any bus component to an amba
>> > bus. All the probing info is within the primecell peripherals.
>>
>> No, if it is an AMBA bus, then it is entirely appropriate to declare
>> it as an amba bus, but to also be compatible with "simple-bus". =A0In
>> fact, it would be better to use a compatible string that specifies the
>> specific implementation of AMBA bus since there are several versions
>> of the spec.
>
> Dave asked me about details of the VE implementation. It's
> sort-of-complicated... ;-)
>
> 1. Core talks to Static Memory Controller via AMBA (AXI)
>
> =A0 SOC { core --AXI--> SMC }
>
> 2. SMC generates transaction on Static Memory Bus talking to the IO FPGA
>
> =A0 tile/motherboard connector { SMC --SMB--> IOFPGA }
>
> 3. Now, depending on the device being accessed:
>
> a) Transactions accessing SMSC9118, ISP1761, NOR Flash and PSRAM are
> routed directly to the devices
>
> =A0 IOFPGA { SMB --> SMSC9118 et al. }
>
> b) The rest of the traffic is converted back to AMBA (AHB/APB)
> transactions and sent to the devices connected to internal AMBA matrix.
>
> =A0 IOFPGA { SMB --> AHB/APB bus master --AHB/APB--> PL180 }
>
> I don't believe, though, that the DTS must reflect such level of
> details. That's why I think that:
>
> + =A0 =A0 =A0 motherboard {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "simple-bus";
>
> and
>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 peripherals@7,00000000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "arm,amba-bu=
s", "simple-bus";
>
> is the best description of the reality :-)

I wonder whether an OS will ever need to know this detail.

Am I right in understanding that these buses are just interconnect
logic, with no OS-visible control/configuration interface?

Cheers
---Dave
