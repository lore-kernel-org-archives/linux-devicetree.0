From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RFC 2/2] net: qualcomm: new Ethernet over SPI driver for QCA7000
Date: Wed, 30 Apr 2014 11:32:05 +0200
Message-ID: <6454465.sI3RdtNGTO@wuerfel>
References: <1398707697-43785-1-git-send-email-stefan.wahren@i2se.com> <4693879.NBTVQb29rJ@wuerfel> <5360AFC7.6020107@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <5360AFC7.6020107@i2se.com>
Sender: netdev-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: davem@davemloft.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, f.fainelli@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 30 April 2014 10:09:43 Stefan Wahren wrote:
> >
> > You print a 'netdev_warn' message here when the queue is full, expecting
> > this to be rare. If the device is so slow, why doesn't this happen
> > all the time?
> > 
> Until now, i never experienced that the queue runs full. But i will do
> some tests to reproduce this.

You could try making the queue shorter to see if you get into this case.
However, when using netdev_sent_queue(), it might become harder to trigger,
so better try this first.

	Arnd
