From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: Update to upstream version 53bf130b1cdd
Date: Mon, 7 Mar 2016 15:10:25 -0800
Message-ID: <CAOesGMhCMMf_3g-pT4G_fB9NHx1=TLwU_qKK+UjO_GJYMjSEAA@mail.gmail.com>
References: <1457104420-18350-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457104420-18350-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Mar 4, 2016 at 7:13 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> Sync to upstream dtc commit 53bf130b1cdd ("libfdt: simplify
> fdt_node_check_compatible()"). This adds the following commits from
> upstream:
>
> 53bf130 libfdt: simplify fdt_node_check_compatible()
> c9d9121 Warn on node name unit-address presence/absence mismatch
> 2e53f9d Catch unsigned 32bit overflow when parsing flattened device tree offsets
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> As usual, this is just an automated copy of upstream dtc into the kernel
> tree. The changeset is small enough that I have left it here.
>
> The main reason for this sync is to pick-up the new unit-address
> warnings.

This spews a crazy amount of warnings on a multi_v7_defconfig build.

I'd prefer to see most of those warnings fixed _before_ we introduce
it by default. Otherwise we just add a huge amount of noise that will
hide any real valid warnings that are now brought up.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
