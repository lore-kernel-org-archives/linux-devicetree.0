From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCH 2/2] uio: add default compatible string to uio_pdrv_genirq
Date: Thu, 21 Sep 2017 15:44:04 +0000
Message-ID: <30b8acb9d0d945a0b20991430a3275f1@svr-chch-ex1.atlnz.lc>
References: <20170921005326.30490-1-chris.packham@alliedtelesis.co.nz>
 <20170921005326.30490-3-chris.packham@alliedtelesis.co.nz>
 <CAHp75VfEUCeehndhiH2OJ_yq8jM2y5aNxQ06hcRngHOk1uugzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21/09/17 19:50, Andy Shevchenko wrote:=0A=
> On Thu, Sep 21, 2017 at 3:53 AM, Chris Packham=0A=
> <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> wrote:=0A=
> =0A=
> =0A=
>> -module_param_string(of_id, uio_of_genirq_match[0].compatible, 128, 0);=
=0A=
>> +module_param_string(of_id, uio_of_genirq_match[1].compatible, 128, 0000=
);=0A=
> =0A=
> 0 -> 0000 looks like bogus checkpatch warning.=0A=
> =0A=
=0A=
Yes. I changed it to satisfy checkpatch. I initially wasn't going to but =
=0A=
then I noticed plenty of 0000 attached to module_params. I'll switch it =0A=
back in v2.=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
