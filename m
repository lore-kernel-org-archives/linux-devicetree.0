From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: Implement CONFIG_CMDLINE_EXTEND
Date: Wed, 18 Nov 2015 10:09:31 -0600
Message-ID: <CAL_JsqLiXQsjf_Op_MtHDM_4t-Nz1fK8KRPoFi1e+ftdjLZJ2g@mail.gmail.com>
References: <1447838885-9888-1-git-send-email-p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447838885-9888-1-git-send-email-p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Walker <danielwa-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 18, 2015 at 3:28 AM, Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Add an option to extend built-in command line with one obtained from
> the device tree.
>
> This option is very useful for, for example, switching between some
> stable and development version, when one of them requires additional
> arguments (e. g. to turn on some extra debug). It can be annoying to
> reprogram command line in the bootloaded every time.
>
> Actually, this patch introduces the necessary support to all
> architectures using the device tree, however only arm64 Kconfig is
> modified, because this is the only platform i can test.

There is work to make the cmdline options and handling generic[1].
There are lots of sharp corners here and I'd like to sort out the
generic support before adding more combinations.

Rob

[1] http://www.spinics.net/lists/arm-kernel/msg449844.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
