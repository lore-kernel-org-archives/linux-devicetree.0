From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 05/13] arm64: enable building of all dtbs
Date: Thu, 8 Oct 2015 13:54:05 -0500
Message-ID: <CAL_JsqLrRc==SPbs6a1irkGA0rFYdJfUg-wWV8yq7MjGtRC58g@mail.gmail.com>
References: <1444326827-3565-1-git-send-email-robh@kernel.org>
 <1444326827-3565-6-git-send-email-robh@kernel.org> <CAMuHMdVDdNOp5z_TjwBVUDqZuZ0NZNAu7cJ6stsZqqXOBsY_tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVDdNOp5z_TjwBVUDqZuZ0NZNAu7cJ6stsZqqXOBsY_tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 8, 2015 at 1:15 PM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> On Thu, Oct 8, 2015 at 7:53 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> Enable building all dtb files when CONFIG_OF_ALL_DTBS is enabled. The dtbs
>> are not really dependent on a platform being enabled or any other kernel
>> config, so for testing coverage it is convenient to build all of the dtbs.
>> This builds all dts files in the tree, not just targets listed. This
>> is simpler for arm64 which has a bunch of sub-dirs.
>
> This doesn't look simpler than the arm(32) version?

I discussed this with Olof in the last version. In the ARM version, I
could have done just one line "dtb-$(CONFIG_OF_ALL_DTBS) += $(dtb-)"
to add all the disabled dtbs. On arm64, I would have to do that for
each sub-dir Makefile as well as make sure any new sub-dirs have this
line. In the end, I also prefer to build everything in the tree and
not rely on the dtbs to be explicitly listed.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
