From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Mon, 05 May 2014 09:06:14 +0200
Message-ID: <53673866.9000105@ahsoftware.de>
References: <20131115095717.GC1709@e106331-lin.cambridge.arm.com> <20131118150052.GC24408@sirena.org.uk> <20131119091216.GA4412@netboy> <20131120064056.GB5272@netboy> <20131121192136.GA16735@n2100.arm.linux.org.uk> <20131121204704.E4487C40753@trevor.secretlab.ca> <CAHkRjk5MstjD9JFk+co8k89i8geJBmSF6uObhGdmWSe0GJHo8g@mail.gmail.com> <97692EF2-013E-4E4B-BC16-E0915D67EFEC@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <97692EF2-013E-4E4B-BC16-E0915D67EFEC-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 22.11.2013 13:00, schrieb Pantelis Antoniou:

> As one that's going to be dealing with this, please don't take the DTS
> files from the kernel.
>
> If you do this, I can guarantee that within a year almost no ARM board using DT
> will boot a mainline kernel.
>
> The reason is that vendors have enough trouble (and failing) tracking a single
> tree, adding yet another will just end to the vendor trees as far as the eye can see.
>
> Maybe, maybe, EVMs from silicon vendors will still boot, but I doubt any other
> customer board will work.

A bit late (I don't follow the ML (or what happens in the ARM world) 
closely, but as I've recently read that ARM64 will go UEFI and ACPI, I 
wonder what was the reasoning behind that decision.

Does anyone really assume we will become high quality UEFI and ACPI 
blobs from vendors? And such with reasonable support/update periods?

For me that sounds like someone asked dreamers and was unable to adjust 
those answers in regard to reality.

Regards,

Alexander Holler
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
