From: Sebastian Frias <sf84@laposte.net>
Subject: Re: ARM, SoC: About the use DT-defined properties by 3rd-party
 drivers
Date: Mon, 12 Sep 2016 18:29:06 +0200
Message-ID: <57D6D7D2.7030507@laposte.net>
References: <57BDAF2E.10502@laposte.net>
 <CAOZdJXVjsR3NTWiJX33yT3jYk=FU65raWoMooTLD7OMN3sqP-A@mail.gmail.com>
 <57D69FB1.2020801@laposte.net> <20160912123809.GB13741@leverpostej>
 <57D6AA54.6000208@laposte.net> <20160912135549.GA14165@leverpostej>
 <CANCZdfri+T59FA4XTaH5JbW0BaJHt3w5eaSkpD8NrJn6nZrZbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANCZdfri+T59FA4XTaH5JbW0BaJHt3w5eaSkpD8NrJn6nZrZbA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Warner Losh <imp@bsdimp.com>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, Mason <slash.tmp@free.fr>, Timur Tabi <timur@tabi.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Warner,

On 09/12/2016 04:26 PM, Warner Losh wrote:
> On Mon, Sep 12, 2016 at 8:01 AM, Mark Rutland <mark.rutland@arm.com> wrote:
>>> Since the question seems understood, do you have an example of other SoC's
>>> doing something similar?
>>
>> I do not have an example. I know that others are using DT for data
>> beyond what Linux or another OS requires, but it's my understanding that
>> that is typically in a separate DTB.
> 
> Just to clarify: FreeBSD uses, for the most part, the DTB's that the
> 'vendor' ships, which is quite often the same ones included in Linux.
> There's some exceptions where the bindings weren't really hardware
> independent, or where the abstraction model was really Linux specific
> (for things like the HDMI stack).
> 
> However, with the advent of overlays, one would think that a vendor
> could easily include an overlay with the DTB data for the devices they
> don't wish to, or cannot for other reasons release. It seems like the
> perfect mechanism to comply with the rules about inclusion of nodes in
> the DTS. Vendors are free to document these nodes and don't require
> the Linux kernel include them in the Documents directory to do so.
> There have been recent efforts to move this documentation to a third
> party to maintain.

This is very interesting, do you have a more concrete example of such
usage?

The overlay technique could be a solution, but so is forking and
distributing a non-documented DT. That's why I'd put this solution a
little bit lower than just exposing the entire HW description through
the DT.

Best regards,

Sebastian
