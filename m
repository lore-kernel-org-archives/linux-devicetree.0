From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: USB support for device tree
Date: Fri, 4 Nov 2011 12:08:21 -0400
Message-ID: <CACxGe6t92kbn7Mgn77AK2wFyT+BRxSY-YU7W9hY_tQpa4+o+pw@mail.gmail.com>
References: <4EB3A165.8060300@codeaurora.org> <20111104154356.GA30439@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20111104154356.GA30439@kroah.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Pavan Kondeti <pkondeti@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 4, 2011 at 11:43 AM, Greg KH <greg@kroah.com> wrote:
> On Fri, Nov 04, 2011 at 01:55:09PM +0530, Pavan Kondeti wrote:
>> Hi
>>
>> I am working on adding USB device tree support for MSM platform. =A0=
One of
>> our chip set has 2 hsusb cores. The first core is configured as otg =
and
>> the other core is configured in host only mode (EHCI compliant). Are=
 the
>> below device node names Okay? Please suggest.
>
> Why do you need to name the speed of the device and the host? =A0That
> doesn't really matter if you plug a low-speed device into that super
> speed host controller, right?
>
> I'm not familiar with device tree naming conventions, but is this
> something you do for network devices? =A0If not, I'd not recommend it=
 for
> USB controllers either.

I'd like to comment, but I wasn't cc'd on the original email so I
don't know what is being proposed.  Pavan, can you please resend your
question and cc devicetree-discuss and me?

thanks,
g.
