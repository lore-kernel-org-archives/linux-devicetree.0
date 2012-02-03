From: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Pinmux bindings proposal V2
Date: Sat, 4 Feb 2012 02:13:54 +0800
Message-ID: <CAA+hA=QFB7x0yv65LMuLx1exmiUAuB98D+9Fyyk9oeVu+7F2QQ@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB4CE@HQMAIL01.nvidia.com>
 <20120201143530.GA2203@S2101-09.ap.freescale.net>
 <74CDBE0F657A3D45AFBB94109FB122FF178E124AC5@HQMAIL01.nvidia.com>
 <CAA+hA=RpkP-FFAr8wqVPjSKEMvO_sRHmOK_9nUYfuW=ps0O_=Q@mail.gmail.com>
 <20120203173205.GB1426@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120203173205.GB1426-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "Sascha Hauer (s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org)" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 4, 2012 at 1:32 AM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> * Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [120202 11:36]:
>>
>> Actually i think i'd rather do not use config property, then i could
>> be more compact:
>> (anyway it's another issue and is flexible to be controlled by #pinmux-c=
ells)
>> pinctrl_usdhc4: pinconfig-usdhc4 {
>> =A0 =A0 =A0 =A0 /* 0: pin 1: group */
>> =A0 =A0 =A0 =A0 mux-entity =3D <0>;
>> =A0 =A0 =A0 =A0 func-name =3D "usdhc4func";
>> =A0 =A0 =A0 =A0 grp-name =3D "usdhc4grp";
>
> The func-name and grp-name should be optional here.
> This mux entry is already the group, and can be used as
> the group name.
For the case i discussed here, the mux entry is PIN.
(the mux-entity value is 0).
we introduce this value here for treating all pins is one group.
When do map parsing, only one pinmux map will be created.
So we need a grp-name.
And we also need a func-name here for construct pinmux map.

> And the function name can be generated
> dynamically in most cases. I'm currently using np->full_name
> of the driver claiming these pins as the function name.
>
Why i did not use np->name as function name is because the np->name
can be different
while actually these nodes may represent the same function but just
different pins, so the function name should be same.

>> =A0 =A0 =A0 =A0 mux =3D
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <MX6Q_SD4_CMD =A00 MX6Q_USDHC_PAD_CTRL>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <MX6Q_SD4_CLK =A00 MX6Q_USDHC_PAD_CTRL>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <MX6Q_SD4_DAT0 1 MX6Q_USDHC_PAD_CTRL>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <MX6Q_SD4_DAT1 1 MX6Q_USDHC_PAD_CTRL>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <MX6Q_SD4_DAT2 1 MX6Q_USDHC_PAD_CTRL>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <MX6Q_SD4_DAT3 1 MX6Q_USDHC_PAD_CTRL>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <MX6Q_SD4_DAT4 1 MX6Q_USDHC_PAD_CTRL>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <MX6Q_SD4_DAT5 1 MX6Q_USDHC_PAD_CTRL>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <MX6Q_SD4_DAT6 1 MX6Q_USDHC_PAD_CTRL>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <MX6Q_SD4_DAT7 1 MX6Q_USDHC_PAD_CTRL>;
>> };
>
> For listing basic pins this format works fine for me. It seems
> to have low overhead for parsing. And the width of the array
> can be driver specific.
>
> Looks like it's the binding for altenative states that's still a
> bit open..
>
Yes, it does not have states support.

> So how about let's first standardize on the mux format above?
>
I'm afraid it may be hard for us to standardize the mux format for a
standard binding in pinctrl core due to  hw difference.
I'm think the new way which i sent in this thread after the mail you replie=
d.
You can refer to them to see if it's reasonable for you too.

Regards
Dong Aisheng
