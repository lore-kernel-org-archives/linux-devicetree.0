From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] Removing full paths from DT full_name
Date: Wed, 26 Jul 2017 09:31:52 -0500
Message-ID: <CAL_JsqLOT3U2jFAyyJ0H0H0dOEpfdQLi_z+CLXnUkEGvUer8ew@mail.gmail.com>
References: <20170725214427.25768-1-robh@kernel.org> <5978A534.5030008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5978A534.5030008-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 9:20 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Rob,
>
> On 07/25/17 14:44, Rob Herring wrote:
>> This series is the last steps to remove storing the full path for every
>> DT node. Instead, we can create full path strings dynamically as needed
>> with printf %pOF specifiers (commit ce4fecf1fe15). There are a number of
>> remaining direct users of full_name after this series. I don't believe
>> there should be any functional impact for those users with the change to
>> only the node name (+unit-address). The majority are for struct
>> resource.name. This should only affect /proc/iomem display.
>
> I added a new dependency on full_name in:
>
>   [PATCH v4 3/3] of: overlay: add overlay symbols to live device tree
>
> You don't need to fix that -- I knew the removal of full_name was coming
> and expected to adapt to that change when it came, so I'll take care of
> it.  It will probably take me two or three weeks to get to it, but that
> shouldn't be a big deal since the affected code is a new feature that
> is not yet used.

Indeed, I had fixed up the print statements, but missed that. Thanks
for the heads up.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
