From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Relicense DTS files I created to the
 ISC
Date: Sat, 28 Jan 2017 12:59:09 +0100
Message-ID: <07ed9fdf-b37d-9b99-a0c0-f18a6bb29c08@hauke-m.de>
References: <20170128115135.6841-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170128115135.6841-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/28/2017 12:51 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> It's preferred to have DT source files licensed under BSD compatible
> license. All new BCM5301X DTS files use ISC so let's also relicense old
> ones to it.
> 
> Except for me only Hauke was ever touched these files in his commit
> 9faa5960eef3 ("ARM: BCM5301X: add NAND flash chip description") and
> commit bb1d8fba1965 ("ARM: BCM5301X: add NAND flash chip description for
> Asus RT-AC87U").
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Acked-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>

> ---
> Hauke: can you ack this patch, please?
> ---
>  arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts        | 12 +++++++++++-
>  arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts        | 12 +++++++++++-
>  arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts     | 12 +++++++++++-
>  arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts        | 12 +++++++++++-
>  arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts | 12 +++++++++++-
>  arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts  | 12 +++++++++++-
>  arch/arm/boot/dts/bcm47081.dtsi                    | 12 +++++++++++-
>  arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts        | 12 +++++++++++-
>  arch/arm/boot/dts/bcm4709-netgear-r7000.dts        | 12 +++++++++++-
>  arch/arm/boot/dts/bcm4709-netgear-r8000.dts        | 12 +++++++++++-
>  arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      | 12 +++++++++++-
>  11 files changed, 121 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
> index d241cee4bfcc..3bf8db4d103f 100644
> --- a/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
> +++ b/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts
> @@ -4,7 +4,17 @@
>   *
>   * Copyright (C) 2015 Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   *
> - * Licensed under the GNU/GPL. See COPYING for details.
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> + * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> + * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> + * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> + * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
> + * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> + * PERFORMANCE OF THIS SOFTWARE.
>   */
>  
>  /dts-v1/;
> diff --git a/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts
> index b0e62042f62f..33b0ae6290cb 100644
> --- a/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts
> +++ b/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts
> @@ -4,7 +4,17 @@
>   *
>   * Copyright (C) 2015 Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   *
> - * Licensed under the GNU/GPL. See COPYING for details.
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> + * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> + * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> + * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> + * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
> + * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> + * PERFORMANCE OF THIS SOFTWARE.
>   */
>  
>  /dts-v1/;
> diff --git a/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts
> index ae0199f6c7a2..5dae6a7ee134 100644
> --- a/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts
> +++ b/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts
> @@ -4,7 +4,17 @@
>   *
>   * Copyright (C) 2014 Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   *
> - * Licensed under the GNU/GPL. See COPYING for details.
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> + * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> + * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> + * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> + * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
> + * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> + * PERFORMANCE OF THIS SOFTWARE.
>   */
>  
>  /dts-v1/;
> diff --git a/arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts
> index db8608be0ee7..7a95c67d3962 100644
> --- a/arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts
> +++ b/arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts
> @@ -4,7 +4,17 @@
>   *
>   * Copyright (C) 2014 Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   *
> - * Licensed under the GNU/GPL. See COPYING for details.
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> + * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> + * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> + * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> + * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
> + * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> + * PERFORMANCE OF THIS SOFTWARE.
>   */
>  
>  /dts-v1/;
> diff --git a/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts b/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts
> index d51586d95b9a..a6d15cce0545 100644
> --- a/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts
> +++ b/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts
> @@ -4,7 +4,17 @@
>   *
>   * Copyright (C) 2014 Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   *
> - * Licensed under the GNU/GPL. See COPYING for details.
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> + * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> + * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> + * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> + * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
> + * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> + * PERFORMANCE OF THIS SOFTWARE.
>   */
>  
>  /dts-v1/;
> diff --git a/arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts b/arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts
> index de041b8c3342..8bef6429feee 100644
> --- a/arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts
> +++ b/arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts
> @@ -4,7 +4,17 @@
>   *
>   * Copyright (C) 2015 Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   *
> - * Licensed under the GNU/GPL. See COPYING for details.
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> + * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> + * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> + * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> + * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
> + * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> + * PERFORMANCE OF THIS SOFTWARE.
>   */
>  
>  /dts-v1/;
> diff --git a/arch/arm/boot/dts/bcm47081.dtsi b/arch/arm/boot/dts/bcm47081.dtsi
> index c5f7619af4a6..7bcd536198fc 100644
> --- a/arch/arm/boot/dts/bcm47081.dtsi
> +++ b/arch/arm/boot/dts/bcm47081.dtsi
> @@ -4,7 +4,17 @@
>   *
>   * Copyright © 2014 Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   *
> - * Licensed under the GNU/GPL. See COPYING for details.
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> + * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> + * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> + * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> + * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
> + * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> + * PERFORMANCE OF THIS SOFTWARE.
>   */
>  
>  #include "bcm5301x.dtsi"
> diff --git a/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts
> index eaca6876db0f..70421f916f15 100644
> --- a/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts
> +++ b/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts
> @@ -4,7 +4,17 @@
>   *
>   * Copyright (C) 2015 Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   *
> - * Licensed under the GNU/GPL. See COPYING for details.
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> + * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> + * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> + * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> + * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
> + * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> + * PERFORMANCE OF THIS SOFTWARE.
>   */
>  
>  /dts-v1/;
> diff --git a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
> index f459a98a72c6..84b3f36b0b25 100644
> --- a/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
> +++ b/arch/arm/boot/dts/bcm4709-netgear-r7000.dts
> @@ -4,7 +4,17 @@
>   *
>   * Copyright (C) 2015 Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   *
> - * Licensed under the GNU/GPL. See COPYING for details.
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> + * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> + * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> + * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> + * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
> + * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> + * PERFORMANCE OF THIS SOFTWARE.
>   */
>  
>  /dts-v1/;
> diff --git a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
> index 8e39a84e5bf9..92e16a24758c 100644
> --- a/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
> +++ b/arch/arm/boot/dts/bcm4709-netgear-r8000.dts
> @@ -4,7 +4,17 @@
>   *
>   * Copyright (C) 2015 Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   *
> - * Licensed under the GNU/GPL. See COPYING for details.
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> + * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> + * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> + * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> + * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
> + * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> + * PERFORMANCE OF THIS SOFTWARE.
>   */
>  
>  /dts-v1/;
> diff --git a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
> index 64ded7643e9f..5263b3368f1f 100644
> --- a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
> +++ b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
> @@ -4,7 +4,17 @@
>   *
>   * Copyright (C) 2016 Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   *
> - * Licensed under the GNU/GPL. See COPYING for details.
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> + * REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> + * AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> + * INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> + * LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
> + * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> + * PERFORMANCE OF THIS SOFTWARE.
>   */
>  
>  /dts-v1/;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
