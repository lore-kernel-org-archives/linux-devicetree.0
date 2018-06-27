From: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH RFC 0/4] Adding DT functionality to w1 busses
Date: Wed, 27 Jun 2018 21:12:44 +0200
Message-ID: <31d55df2-b5ba-f37e-7566-c73f58ba9b43@zonque.org>
References: <20180619212744.794-1-daniel@zonque.org>
 <CAL_JsqLfzfJC=_NhJy=jFAqEgfi=cvjMcnkjdHdzfM2uhKGBAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLfzfJC=_NhJy=jFAqEgfi=cvjMcnkjdHdzfM2uhKGBAQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: zbr@ioremap.net, Mark Rutland <mark.rutland@arm.com>, szabolcs.gyurko@tlt.hu, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, June 26, 2018 11:39 PM, Rob Herring wrote:
> On Tue, Jun 19, 2018 at 3:27 PM, Daniel Mack <daniel@zonque.org> wrote:
>> In order to fully move battery-supplied devices over to devicetree, the
>> onewire subsystem must get some updates.
>>
>> Currently, the w1 bus system works like this. Device families, such as
>> battery controllers etc, are registered to the w1 core. Once a master
>> device is probed, it starts scanning the bus. Slave devices that are
>> revealed through this scan and that match previously registered
>> families are then registered, and their .add_slave() callback is
>> invoked.
>>
>> Some devices, such as the ds2760, use that callback to call
>> platform_device_alloc() at runtime with a fixed device name to
>> instanciate their only user. That user does the actual work, while the
>> slave device merely functions as an I/O proxy. In the user
>> implementation, the w1 slave device is accessible through
>> dev->parent.
> 
> Looks to me like you are letting the driver structure define the DT
> structure. This detail is all irrelevant to DT.
> 
>>
>> Now, for devicetree environments, this has to change a bit. First, slave
>> devices need to have a matching table so they can be listed as sub-nodes
>> of their master bus controller. Second, the core needs to match the
>> entries in these tables against the sub-nodes of the master node.
>> These two are trivial to do.
>>
>> The next question is how the w1 slave device and its user(s) are linked
>> together. I'm proposing a DT layout with the following example:
>>
>>          onewire {
>>                  compatible = "w1-gpio";
>>
>>                  w1_slave: slave@0 {
>>                          compatible = "maxim,w1-ds2760";
>>                  };
>>          };
>>
>>          battery-supply {
>>                  compatible = "maxim,ds2760-supply";
>>                  w1-slave = <&w1_slave>;
>>          };
> 
> This should just be one node and a child of the 1-wire master.

Yeah, you're right. This also makes the patch set much simpler.

Thanks for the feedback - I'll send another round of patches.



Daniel
