From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] devicetree: add binding for Sigma Designs SMP86xx interrupt controller
Date: Fri, 20 Nov 2015 16:27:04 +0000
Message-ID: <yw1xtwogd4br.fsf@unicorn.mansr.com>
References: <1447958026-3015-1-git-send-email-mans@mansr.com>
	<1447958026-3015-2-git-send-email-mans@mansr.com>
	<20151120162304.GA28663@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151120162304.GA28663@rob-hp-laptop> (Rob Herring's message of
	"Fri, 20 Nov 2015 10:23:04 -0600")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Thu, Nov 19, 2015 at 06:33:45PM +0000, Mans Rullgard wrote:
>> This adds a binding for the secondary interrupt controller in
>> Sigma Designs SMP86xx and SMP87xx chips.
>>=20
>> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../interrupt-controller/sigma,smp8642-intc.txt    | 47 +++++++++++=
+++++++++++
>>  1 file changed, 47 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-cont=
roller/sigma,smp8642-intc.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/=
sigma,smp8642-intc.txt b/Documentation/devicetree/bindings/interrupt-co=
ntroller/sigma,smp8642-intc.txt
>> new file mode 100644
>> index 0000000..f82cddf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/sigma,s=
mp8642-intc.txt
>> @@ -0,0 +1,47 @@
>> +Sigma Designs SMP86xx/SMP87xx secondary interrupt controller
>> +
>> +Required properties:
>> +- compatible: should be "sigma,smp8642-intc"
>> +- reg: physical address of MMIO region
>> +- interrupt-parent: phandle of parent interrupt controller
>> +- interrupt-controller: boolean
>> +
>> +One child node per control block with properties:
>> +- sigma,reg-offset: offset of registers from main base address
>
> Your driver defines these offsets too.
>
> Do you expect to have many different variations here? If not, I would=
=20
> get rid of all the child nodes and just hard code it in the driver.

Then how will other DT nodes reference the correct one?

--=20
M=E5ns Rullg=E5rd
mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
