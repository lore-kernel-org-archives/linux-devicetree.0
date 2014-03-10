From: sundeep subbaraya <sundeep.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC] usb: gadget: Add xilinx axi usb2 device support
Date: Mon, 10 Mar 2014 19:06:19 +0530
Message-ID: <CALHRZuouwUh398PkmatQMyZNzrEreH-kGwJTTC7CsY_gdq8dbQ@mail.gmail.com>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local>
	<20140220182257.GF23217@saruman.home>
	<a39ce44a-2f92-4067-be6d-7311a78bb195@VA3EHSMHS013.ehs.local>
	<20140221153905.GE31902@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140221153905.GE31902-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 21, 2014 at 9:09 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Fri, Feb 21, 2014 at 11:27:07AM +0000, Subbaraya Sundeep Bhatta wrote:
>> > From the looks of it, I doubt this was actually tested, you need a lot
>> > of work on this driver.
>> Tested on both ARM and Microblaze architectures with Mass storage gadget.
>> Will send a v2 after addressing all your comments.
>
> clearly you didn't try to remove and reinsert the module or you would
> see a whole bunch of errors.
>

Yes you are correct. My console hung up as soon as i rmmod my driver.
Could you please point me where am wrong.

>> This email and any attachments are intended for the sole use of the
>> named recipient(s) and contain(s) confidential information that may be
>> proprietary, privileged or copyrighted under applicable law. If you
>> are not the intended recipient, do not read, copy, or forward this
>> email message or any attachments. Delete this email message and any
>> attachments immediately.
>
> remove this footer message, btw, when sending emails to public mailing
> lists.
>
Sure
> --
> balbi
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
