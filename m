From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v2 1/3] ipmi: add an Aspeed BT IPMI BMC driver
Date: Tue, 20 Sep 2016 08:57:51 +0200
Message-ID: <40c37244-b404-45cb-f5ba-758715734227@kaod.org>
References: <1474022367-21029-1-git-send-email-clg@kaod.org>
 <1474022367-21029-2-git-send-email-clg@kaod.org>
 <08e9b30f-6c35-8418-a8b0-0b63639dd36d@acm.org>
 <9ce54c4c-e8ae-7ac2-de9c-71402dfa4c39@kaod.org>
 <299986a2-498e-fbff-d52b-f9c0d5c10aec@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <299986a2-498e-fbff-d52b-f9c0d5c10aec@acm.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: minyard@acm.org, openipmi-developer@lists.sourceforge.net, Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Alistair Popple <alistair@popple.id.au>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, Rocky Craig <rocky.craig@hp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

>>> The spec says:
>>>
>>>     The BMC must not return a given response once the corresponding
>>>     Request-to-Response interval has passed. The BMC can ensure this
>>>     by maintaining its own internal list of outstanding requests through
>>>     the interface. The BMC could age and expire the entries in the list
>>>     by expiring the entries at an interval that is somewhat shorter than
>>>     the specified Request-to-Response interval....
>> This is clearly not handled in the driver.
>>
>> For this purpose, we could maintain a request expiry list using the seq
>> field of the BT message. Update the list in the read and write operations
>> and arm a timer to garbage collect any left overs. As for the errno in
>> the write when a response had timeout'ed, may be ETIMEDOUT ?
> 
> I think that would work, though I don't think you really need an
> error response in this case.
> 
> I was thinking more just a timeout in the write function.  Ideally
> the timeout would be calculated at receive time and then be
> passed in on every write, to preserve the request-to-response
> time for slow messages.  I like the simplicity of the driver the
> way it is.
> 
> The trouble is that there is no easy way to pass in a timeout
> in a write operation.  You could pass in a structure where the
> first part is a 32-bit timeout, or something like that.  Or
> maybe just a fixed timeout and assume every message is
> handled in a short enough time that it meets the spec
> requirement.  But that doesn't handle slowness on the
> host side.  You can send the message via an ioctl,  which
> again isn't terribly ideal.
> 
> It would be nice if there was a write function which was
> able to pass metadata, but AFAIK that's only available on
> sockets.
> 
>> For configuration of the maximum response time, a sysfs file would do
>> I think.
>>
>> Do you want that in v3 also ? I have some experimental patches for it,
>> that I can send as follow ups.
> 
> I'm fine either way.

OK. So I will send a v3 with minimal changes, as openbmc has been using 
this driver for a while now. We will discuss the response expiration on 
the next patchset.

I have pushed the patches here :

	https://github.com/legoater/linux/commits/aspeed

Thanks,

C.
