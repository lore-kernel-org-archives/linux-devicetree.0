From: Matt Ranostay <mranostay@gmail.com>
Subject: Re: [PATCH] leds: leds-pca963x: workaround group blink scaling issue
Date: Sat, 15 Oct 2016 05:00:51 -0700
Message-ID: <CAKzfze8s4E4x70bAoXd8_cctUeih4dwareM7=dpc7GsQq3agWQ@mail.gmail.com>
References: <CGME20161013131622eucas1p2e419c58b25f2c61da22d390f2adfacfd@eucas1p2.samsung.com>
 <1476364572-26849-1-git-send-email-matt@ranostay.consulting>
 <ac8bb319-8ad2-65fe-e8bb-6fd9af61f046@samsung.com> <CAKzfze_d5rQ-MaNL1BbGXrdHG+UDNa=us68eoH_AJ-EKLnzCvw@mail.gmail.com>
 <924a896d-b3f2-5fed-62ba-a731e79e1567@samsung.com> <20161014142047.imm4idfetphlp5od@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161014142047.imm4idfetphlp5od@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Matt Ranostay <matt@ranostay.consulting>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 14, 2016 at 7:20 AM, Tony Lindgren <tony@atomide.com> wrote:
> * Jacek Anaszewski <j.anaszewski@samsung.com> [161013 23:37]:
>> On 10/13/2016 04:20 PM, Matt Ranostay wrote:
>> > On Thu, Oct 13, 2016 at 4:05 PM, Jacek Anaszewski
>> > <j.anaszewski@samsung.com> wrote:
>> > > Why DT property? Is it somehow dependent on the board configuration?
>> > > How this period-scale value is calculated? Is it inferred empirically?
>> > >
>> >
>> > We empirically discovered and verified this with an logic analyzer on
>> > multiple batches of this part.
>> > Reason for the DT entry is we aren't 100% sure that it is always going
>> > to be the same with different board revs.
>> >
>> > Could be that parts clock acts differently with supply voltage.   This
>> > has been calculated by setting it an expected value, and measuring the
>> > actual result with the logic analyzer.
>>
>> I'd like to have DT maintainer's ack for this.
>>
>> Cc Rob and Mark.
>
> How about do this based on the compatible property instead? If there
> are multiple manufacturers for this part and only a certain
> parts have this issue we should have multiple compatible properties.
>

I could only find that NXP as the manufacturer of that part. It is
possible since the clock is internal to the chipset that the vdd of
2.5V is doing something undefined.

> Then if it turns out all of them need this scaling there's no need
> to update the binding.

Understandable.

>
> Regards,
>
> Tony
