From: Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v19 05/12] fpga-mgr: add fpga image information struct
Date: Wed, 28 Sep 2016 23:34:51 -0500
Message-ID: <CANk1AXTbKhiSu3XN4HgTM_rBBQ315qseH06RzojOOZrV74M7yQ@mail.gmail.com>
References: <20160928182200.15800-1-atull@opensource.altera.com>
 <20160928182200.15800-6-atull@opensource.altera.com> <CAAtXAHcdSsVUE4hQ6isCp7_35ZKb60EAKAgtGwBR41apwPpe=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAtXAHcdSsVUE4hQ6isCp7_35ZKb60EAKAgtGwBR41apwPpe=g@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Cyril Chemparathy <cyril.chemparathy-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>, Matthew Gerlach <mgerlach-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2016 at 6:41 PM, Moritz Fischer
<moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org> wrote:
Hi Moritz,

> Hi Alan,
>
> generally ok with the change.

Cool!

>
> On Wed, Sep 28, 2016 at 11:21 AM, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
>
>> -int fpga_mgr_buf_load(struct fpga_manager *mgr, u32 flags, const char *buf,
>> -                     size_t count)
>> +int fpga_mgr_buf_load(struct fpga_manager *mgr, struct fpga_image_info *info,
>> +                     const char *buf, size_t count)
>
> Doesn't this break the both socfpga and zynq if [6/12] and [7/12] are
> not part of this commit?
> i.e shouldn't 5,6 and 7 be a single commit?

Yeah, squashing those would improve bisectability.

Alan
aka atull

>
> Cheers,
> Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
