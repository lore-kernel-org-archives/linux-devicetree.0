From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Pinmux bindings proposal V2
Date: Fri, 3 Feb 2012 09:32:05 -0800
Message-ID: <20120203173205.GB1426@atomide.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB4CE@HQMAIL01.nvidia.com>
 <20120201143530.GA2203@S2101-09.ap.freescale.net>
 <74CDBE0F657A3D45AFBB94109FB122FF178E124AC5@HQMAIL01.nvidia.com>
 <CAA+hA=RpkP-FFAr8wqVPjSKEMvO_sRHmOK_9nUYfuW=ps0O_=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAA+hA=RpkP-FFAr8wqVPjSKEMvO_sRHmOK_9nUYfuW=ps0O_=Q@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "Sascha Hauer (s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org)" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [120202 11:36]:
> 
> Actually i think i'd rather do not use config property, then i could
> be more compact:
> (anyway it's another issue and is flexible to be controlled by #pinmux-cells)
> pinctrl_usdhc4: pinconfig-usdhc4 {
>         /* 0: pin 1: group */
>         mux-entity = <0>;
>         func-name = "usdhc4func";
>         grp-name = "usdhc4grp";

The func-name and grp-name should be optional here.
This mux entry is already the group, and can be used as
the group name. And the function name can be generated
dynamically in most cases. I'm currently using np->full_name
of the driver claiming these pins as the function name.

>         mux =
>                 <MX6Q_SD4_CMD  0 MX6Q_USDHC_PAD_CTRL>
>                 <MX6Q_SD4_CLK  0 MX6Q_USDHC_PAD_CTRL>
>                 <MX6Q_SD4_DAT0 1 MX6Q_USDHC_PAD_CTRL>
>                 <MX6Q_SD4_DAT1 1 MX6Q_USDHC_PAD_CTRL>
>                 <MX6Q_SD4_DAT2 1 MX6Q_USDHC_PAD_CTRL>
>                 <MX6Q_SD4_DAT3 1 MX6Q_USDHC_PAD_CTRL>
>                 <MX6Q_SD4_DAT4 1 MX6Q_USDHC_PAD_CTRL>
>                 <MX6Q_SD4_DAT5 1 MX6Q_USDHC_PAD_CTRL>
>                 <MX6Q_SD4_DAT6 1 MX6Q_USDHC_PAD_CTRL>
>                 <MX6Q_SD4_DAT7 1 MX6Q_USDHC_PAD_CTRL>;
> };

For listing basic pins this format works fine for me. It seems
to have low overhead for parsing. And the width of the array
can be driver specific.

Looks like it's the binding for altenative states that's still a
bit open..

So how about let's first standardize on the mux format above?

Then we can enhance it later for describing alternative states?
 
Regards,

Tony
