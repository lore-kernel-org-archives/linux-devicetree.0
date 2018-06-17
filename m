Return-Path: <SRS0=fTn5=JD=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: leds: Add bindings for lltc,lt3593
From: Daniel Mack <daniel@zonque.org>
References: <20180617114929.719-1-daniel@zonque.org>
 <468ab3aa-80cd-3525-3c89-7e5c4e7e8b9e@gmail.com>
 <ca6a8440-0dd2-1690-05a9-735e1381020a@zonque.org>
Message-ID: <2be30c64-77d6-9107-86d7-81f1651c2f34@zonque.org>
Date: Sun, 17 Jun 2018 22:08:29 +0200
MIME-Version: 1.0
In-Reply-To: <ca6a8440-0dd2-1690-05a9-735e1381020a@zonque.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sunday, June 17, 2018 09:52 PM, Daniel Mack wrote:
> On Sunday, June 17, 2018 09:39 PM, Jacek Anaszewski wrote:

>> Please do not make an excuse for a single LED. Let's keep the bindings
>> consistent across all LED class drivers, i.e. each LED should have
>> a dedicated child node. Even there is a single output available.
> 
> Okay, I can do that. But you do agree with the decision to only support
> one single LED in the driver and the binding? The hardware chip can only
> drive one single LED, but of course, the driver could support multiple
> chips with a single device node and different sub-nodes. In fact the
> driver did support this via pdata before this series.
> 
> I believe, however, that this is against the principles of how
> device-trees are supposed to describe the hardware, so I changed it. And
> as I wrote in the commit log, the only mainline user only uses one LED
> anyway, so the change won't cause any regression.

And btw, that one user of the driver is soon to be replaced by a 
device-tree based version, and once that's finished, I'll send another 
patch to kill pdata handling from this driver entirely.

So the question is only how the DT bindings should look like, the pdata 
bits are just kept around for legacy compat and don't matter.


Thanks,
Daniel
