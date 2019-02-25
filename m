From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Allwinner SID THS calibration data cell representation?
Date: Mon, 25 Feb 2019 21:37:55 +0100
Message-ID: <dfbe9a71-ccab-2415-fe5b-6944df721bff@gmail.com>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-28-embed3d@gmail.com>
 <20180904184623.e4386b8e6b657b1b25e90c09@bidouilliste.com>
 <55579dd6-625d-e71b-1482-4592dccac665@gmail.com>
 <20180906115114.inc6dhqhy47obo25@flea>
 <CAGb2v65p0G83BVODsxxnXmiSCwuuwPFtY2k2ZV1F5xoFKrJjWQ@mail.gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBD257DPK24NRBJVE2HRQKGQEV3YZMGI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v65p0G83BVODsxxnXmiSCwuuwPFtY2k2ZV1F5xoFKrJjWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Quentin Schulz <quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 19.02.19 08:54, Chen-Yu Tsai wrote:
> Sorry for resurrecting an old discussion, but since someone posted patches
> for H5 and H6, I thought we should resolve this. I'm working on patches to
> fix / replace the big-endian issue.
> 
> On Thu, Sep 6, 2018 at 7:51 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>>
>> On Thu, Sep 06, 2018 at 01:47:47PM +0200, Philipp Rossak wrote:
>>> On 04.09.2018 18:46, Emmanuel Vadot wrote:
>>>>> +                 /* Data cells */
>>>>> +                 thermal_calibration: calib@234 {
>>>>> +                         reg = <0x234 0x8>;
>>>>> +                 };
>>>>    You are declaring 8 bytes of calibration data but to my knowledge it's
>>>> only 2 bytes per sensor, so 2 bytes for H3.
>>>>    Am I missing something ?
>>>>
>>>>    Thanks,
>>>
>>> Emmanuel you are right, it is 2 bytes per Sensor and should be 2 bytes for
>>> H3, but the thermal calibration data field is on all chips 64 bit wide - so
>>> 8 bytes. So I'm reading here the complete calibration data field.
>>
>> Having one cell per channel would make more sense I guess.
> 
> Would it? The 2 32-bit words directly map onto the registers 0x74 / 0x78 in
> the THS. As far as the SID is concerned, their is just one consumer for this
> data, the thermal sensor. How the thermal sensor uses that data is really not
> its concern. And the thermal sensor is really just copying the data from the
> e-fuses into its registers. Nothing more.

Using 2 32-bit words for the THS would be also ok (from my perspective).
> 
> Furthermore, with the register access interface, the e-fuses are read/write
> 32 bits at a time. Seems to me it would make more sense to enforce a 32-bit
> word size, so cells should be multiples of 32 bits.
> 
For THS I'm ok with that.

> Regards
> ChenYu
> 
Regards,
Philipp
