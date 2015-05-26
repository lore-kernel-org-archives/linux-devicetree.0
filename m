From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv1 0/2] Adding driver for Xilinx LogiCORE IP mailbox.
Date: Tue, 26 May 2015 09:12:48 -0700
Message-ID: <CAAtXAHfFfeJtjHvVTG7r0DNg_LNgVD2RCR4B6VxB5afh39ndhg@mail.gmail.com>
References: <1432317791-26851-1-git-send-email-moritz.fischer@ettus.com>
	<5562BB92.60808@xilinx.com>
	<000101d096f2$97457cf0$c5d076d0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <000101d096f2$97457cf0$c5d076d0$@com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 25, 2015 at 6:56 AM, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Monday, May 25, 2015 3:05 PM, Michal Simek wrote:
>> On 05/22/2015 08:03 PM, Moritz Fischer wrote:
>> > This patchset adds mailbox framework integration for the Xilinx LogiCORE IP
>> > mailbox.  The Xilinx LogiCORE IP mailbox is a fpga softcore that allows
>> > interprocessor communication between AXI4 stream / memory mapped
>> > processors.
>> >
>> > Changes from v0:
>> > ---------------------
>> >
>> > - Several stylistic issues
>> > - Dropped superfluous intr_mode member
>> > - Really masking the IRQs on mailbox_shutdown
>> > - No longer using polling by accident in non-IRQ mode
>> > - Swapped doc and driver commits
>>
>> Changes update should be in every particular patch.
>> Also v1 is used to the first version that's why this one should be v2.


Thanks for the feedback. I guess making the next round v2 would be
less confusing,
than restarting the entire patchset from v1?

> Right, I agree with Michal Simek's opinion.
> If there are 'Changes update' in each patch, it makes people review
> the patches more easily. In addition, normally, 'v0' is not used.

Sorry about that again.
>
> Best regards,
> Jingoo Han
>
>>
>> Thanks,
>> Michal
>

Thanks,
Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
