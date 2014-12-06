From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 4/4] arm64:numa: adding numa support for arm64 platforms.
Date: Sat, 6 Dec 2014 10:50:57 -0800
Message-ID: <CAFpQJXU89uwAkHyi+dvHmbZOvadO_EyQbrG8jMo5G3tnWP5qcw@mail.gmail.com>
References: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<1416605010-10442-5-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<5482ce36.c9e2420a.5d40.71c7SMTPIN_ADDED_BROKEN@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5482ce36.c9e2420a.5d40.71c7SMTPIN_ADDED_BROKEN-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 6, 2014 at 1:36 AM, Ashok Kumar <ashoks-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On Sat, Nov 22, 2014 at 02:53:30AM +0530, Ganapatrao Kulkarni wrote:
>> Adding numa support for arm64 based platforms.
>> creating numa mapping by parsing the dt node numa-map.
>>
>> Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> Ganapat,
>
> Can we get a simple version of this patchset with just the associativity parameter for the cpu and memory nodes
> upstream? The initial patchset can be with the assumption of a simple full mesh topology for the distance.  The
> hierarchical complex topologies and the DT nodes and properties for that can be added in a later patch, once the
> standard for that is agreed upon.
> We are planning to support ACPI based NUMA for                                                                        Broadcom Vulcan processors(http://www.broadcom.com/press/release.php?id=s797235).
> I am working on a patch to add support for the SRAT and SLIT ACPI tables based on your patch and I will post that
> patchset soon, so it will be helpful if the core changes are upstream.
>
to implement, ibm/ppc like implementation, we need efi-stub patch to
not remove the memory node from the dt.
current efi-stub parses dt file and removes memory nodes.
can i get the efi-stub patch to start with please?

> Thanks,
> Ashok
>

thanks
ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
