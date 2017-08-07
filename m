From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] Removing full paths from DT full_name
Date: Mon, 7 Aug 2017 18:15:03 -0500
Message-ID: <CAL_Jsq+tarBMM-frN+V9GYa-ZAzfJO4sv2owdOS3Ks+urned1g@mail.gmail.com>
References: <20170725214427.25768-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170725214427.25768-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 25, 2017 at 4:44 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> This series is the last steps to remove storing the full path for every
> DT node. Instead, we can create full path strings dynamically as needed
> with printf %pOF specifiers (commit ce4fecf1fe15). There are a number of
> remaining direct users of full_name after this series. I don't believe
> there should be any functional impact for those users with the change to
> only the node name (+unit-address). The majority are for struct
> resource.name. This should only affect /proc/iomem display.
>
> Patches 1 and 2 can be applied now for 4.14. For patches 3 and 4, my
> target is 4.15 after all the dependencies have been merged.
>
> PPC folks, Please test! The PPC parts are untested. A git branch with
> all the dependencies is here[1].

PPC folks, any chance to test this?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
