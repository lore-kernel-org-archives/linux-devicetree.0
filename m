From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 1/2] DT: add binding for mxs regulator
Date: Mon, 29 Sep 2014 08:00:50 +0200
Message-ID: <5428F592.3020809@i2se.com>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com> <1411779588-22031-2-git-send-email-stefan.wahren@i2se.com> <20140928102202.GM27755@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140928102202.GM27755-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

Am 28.09.2014 um 12:22 schrieb Mark Brown:
> On Sat, Sep 27, 2014 at 12:59:47AM +0000, Stefan Wahren wrote:
>> This patch adds the Device tree bindings for the Freescale MXS
>> on-chip regulators.
> Use subject lines matching the style for the subsystem.

sorry i'm not sure what's wrong with the subject lines.

Did you expect "[PATCH 1/2] regulator: add binding for mxs regulator"?

>
>> +Required regulator properties:
>> +- compatible: Must be "fsl,mxs-regulator"
>> +- reg: Absolute physical address of the register set for the regulator
>> +
>> +Any regulator property defined as part of the core regulator
>> +binding, defined in regulator.txt, can also be used.
> While this should be using compatibles to identify which regulator is
> being supported note that the binding doesn't document the fact that the
> code makes regulator-name mandatory or what values are required.

Is the following better?

- fsl,mxs-regulator-vddd
- fsl,mxs-regulator-vdda
- fsl,mxs-regulator-vddio

Thanks

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
