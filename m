From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] [RFC] OF: probe order dependency aware of_platform_populate
Date: Wed, 8 Apr 2015 10:42:42 +0200
Message-ID: <CAMuHMdWVTsog2_9iyUEBWm-7xonvNibTTbOY5YxvpAhffUXdcg@mail.gmail.com>
References: <1418731891-24768-1-git-send-email-pantelis.antoniou@konsulko.com>
	<20150319191834.5346CC40A35@trevor.secretlab.ca>
	<8E250936-B06C-40B4-8C34-557D2361CAF6@konsulko.com>
	<CAMuHMdU=Zh00DnkAdAJBaAVn8LthYoRoGCVdFAhxQmWaEGHfkw@mail.gmail.com>
	<1B3AF599-4A64-4FB0-BFB0-0C0544917C6C@konsulko.com>
	<CAMuHMdWgAzkAJ-ix9NYc46yJRGPHCpmimOjF=HUYprxdgtzkaw@mail.gmail.com>
	<20150402023803.E6A4DC4076D@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150402023803.E6A4DC4076D-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Thu, Apr 2, 2015 at 4:38 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Mon, 30 Mar 2015 15:27:27 +0200
> , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>  wrote:
>> On Tue, Mar 24, 2015 at 6:56 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> >> On Mar 24, 2015, at 07:50 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> >> IIUC, this would fix the issue I worked around in "ARM: shmobile: r8a73a4:
>> >> Move pfc node to work around probe ordering bug"?
>> >> https://git.kernel.org/cgit/linux/kernel/git/horms/renesas.git/commit/?h=r8a73a4-ccf-and-multiplatform-for-v4.1&id=e4ba0a9bddff3ba52cec100414d2f178440efc91

> There are two ways to fix this so that .dtb order doesn't matter. The
> dirty hack is to change the pfc driver to use subsys_initcall (level 4)
> or later so that it happens after the devices are registered. The second

I've just tried that, and it doesn't work.

> solution is to make the pfc drivers able to return -EPROBE_DEFER, but
> that also requires fixing deferred probe to start retrying devices
> before late_initcall time. Right now there is a holdoff flag that

All the pfc driver can detect is that some platform_device.resource[i] are
empty (resource_type zero). Returning -EPROBE_DEFER won't help,
as the resource won't change later.

The problem is not the initialization order of the device drivers, but the
creation order of the platform devices.

of_device_alloc() silently (except for the pr_debug() message) ignores
any failures to setup IRQ resources. Hence platform devices for interrupt
providers must be created before platform devices for interrupt consumers,
which is what the reordering in DT fixes.

See also the information in the commit message linked at the top.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
