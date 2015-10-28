From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 3/5] mtd: ofpart: update devicetree binding specification
Date: Tue, 27 Oct 2015 19:45:57 -0500
Message-ID: <CAL_JsqKz63fqfDAwLv8u0dJL1eBxKd-41k7LgU96ku4Ke=383A@mail.gmail.com>
References: <cover.1439911625.git.hramrach@gmail.com> <e47db0c8eeaeb11353bcb2f4dcd138e813c3ecd7.1439911625.git.hramrach@gmail.com>
 <20151011200402.GE3696@localhost> <CAL_JsqJ4Ha7R92=6xkwYXZjpEprjWoVxyXM6cG=yykVoTMH-vw@mail.gmail.com>
 <20151027225000.GA64073@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151027225000.GA64073@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Michal Suchanek <hramrach@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 5:50 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi Rob,
>
> Thanks for the review.
>
> On Mon, Oct 26, 2015 at 11:35:24PM -0500, Rob Herring wrote:
>> On Sun, Oct 11, 2015 at 3:04 PM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>> > Hi DT maintainers,
>> >
>> > It's a bit hypocritical of me, since I've been a slow reviewer as well,
>> > but... can we get some review on this one? Usually, I'm comfortable
>> > taking driver DT bindings without your review, but this one is a bit
>> > more generic and is more far-reaching than the average driver.
>>
>> Sorry, missed this one. This would be a good one to send to
>> devicetree-spec to BTW.
>
> I'm not very familiar with that list. With the intention of getting into
> an ePAPR (or similar) spec? Or just for additional review? If the
> former, would you suggest codifying both the old and the new, or just
> the new?

I would say it is for anything not driver specific. It was created to
separate out the driver binding firehose from the common bindings and
get more non-Linux participation on those. Perhaps it was poorly
named. I want to improve the split in docs so the appropriate list is
used.

Sending to both devicetree and devicetree-spec is fine.

Rob
