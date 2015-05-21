From: Jonathan Richardson <jonathar@broadcom.com>
Subject: Re: [PATCH 2/2] misc: Add initial Digital Timing Engine (DTE) driver
 for cygnus
Date: Thu, 21 May 2015 10:48:32 -0700
Message-ID: <555E1A70.90305@broadcom.com>
References: <5543CD73.2030902@broadcom.com> <20150501203004.3add2c95@lxorguk.ukuu.org.uk> <9193036.7UYD2OGJHk@wuerfel> <554D1649.2030106@broadcom.com> <20150513153544.GC2065@localhost.localdomain> <5553AAEA.30503@broadcom.com> <20150513202716.GA15878@localhost.localdomain> <5553DD7D.8090905@broadcom.com> <20150514113054.GB1580@localhost.localdomain> <555D1ADA.8070308@broadcom.com> <20150521063303.GA1558@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150521063303.GA1558@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Darren Edamura <dedamura@broadcom.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 15-05-20 11:33 PM, Richard Cochran wrote:
> On Wed, May 20, 2015 at 04:38:02PM -0700, Jonathan Richardson wrote:
>>
>> Richard, this design isn't going to work. We need to have both kernel
>> and user space consumers.
> 
> But you did not implement even a single kernel consumer.
> 
>> We don't want all GPIO's in a common timestamp
>> buffer either, as it presents problems I mentioned previously. Currently
>> the network input is a gpio.
> 
> That won't work.  Consider what happens when the MAC drops a packet.
> 
>> After some discussion here I think we'll
>> have to keep this driver out of the kernel for now.
> 
> Fine with me.

We'll keep this discussion and try to figure out the best interface
keeping in mind what you've said as we move further along with it. Not a
wasted discussion. Requirements of this need to be better defined and
thought out also.

Thanks,
Jon

> 
> Thanks,
> Richard
> 
