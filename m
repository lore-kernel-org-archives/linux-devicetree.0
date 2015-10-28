From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v12 3/6] fpga: add simple-fpga-bus
Date: Wed, 28 Oct 2015 09:28:13 -0700
Message-ID: <CAAtXAHdry3_A9ow-w5KQg80ECyaAuSGVit9ygcM7Ffc9yiysMA@mail.gmail.com>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com>
	<1445983755-24007-4-git-send-email-atull@opensource.altera.com>
	<20151028100714.GB7779@jcartwri.amer.corp.natinst.com>
	<CAAtXAHcaSZaKhYtVFbUEuO+boMh_PgUaOGVtjO_5MDkpcLcmWA@mail.gmail.com>
	<20151028161859.GJ8245@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151028161859.GJ8245-ew3lsbMjNqt5wtABiV/Xjqyly8cj88Ttqxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 28, 2015 at 9:18 AM, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org> wrote:
> On Wed, Oct 28, 2015 at 08:37:51AM -0700, Moritz Fischer wrote:
>> On Wed, Oct 28, 2015 at 3:07 AM, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org> wrote:
>> > On Tue, Oct 27, 2015 at 05:09:12PM -0500, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
>> >> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>> >>
>> >> The Simple FPGA bus uses the FPGA Manager Framework and the
>> >> FPGA Bridge Framework to provide a manufactorer-agnostic
>> >> interface for reprogramming FPGAs that is Device Tree
>> >> Overlays-based.
>> >
>> > Do you intend the "simple-fpga-bus" to be used on Zynq as well?  The
>> > whole concept of the socfpga's "FPGA Bridge" doesn't map to the Zynq at
>> > all, from what I can tell.
>>
>> For Zynq the zynq-fpga driver takes care of the level shifters on full
>> reconfiguration,
>> and doesn't for partial reconfiguration. Now depending on which parts
>> of the fabric
>> are partial reconfigured (say AXI masters), one might run into issues
>> with a setup like that.
>>
>> My first plan was to counter that by using zynq-reset to hold the
>> reset high during
>> reconfiguration of that part of the FPGA.
>>
>> I'm happy to rethink that part and maybe redo the level shifters and
>> resets together in a bridge
>> driver under devicetree control gives finer grained control.
>
> There is already a framework which is used to describe and manipulate
> level shifting/other IO properties, and that is pinctrl, and if we
> wanted to use an appropriate abstraction, I think pinctrl would be the
> best bet.

Alright, I'll investigate that. Again, for the non-partial reconfig
case I'm happy
with the behavior as implemented, for the partial reconfig I just
haven't run into
issues with not dealing with the level shifters.

> Implementing the FPGA Bridge interface in the Zynq driver because it's
> what the core expects is just backwards.  It's an abstraction inversion.

Yeah, you're probably right.

Thanks,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
