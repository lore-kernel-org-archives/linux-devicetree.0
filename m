Return-Path: <alexander.sverdlin@nsn.com>
Message-ID: <53A93907.6070408@nsn.com>
Date: Tue, 24 Jun 2014 10:38:31 +0200
From: Alexander Sverdlin <alexander.sverdlin@nsn.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] OF: Utility helper functions for dynamic nodes
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-6-git-send-email-pantelis.antoniou@konsulko.com> <53A85549.7040809@nsn.com> <6E91A461-4361-4A18-BE32-CECDD789C114@konsulko.com> <20140623183343.GA10389@heimdall> <78ACBAF6-A73E-4272-8D3A-258C4B10858C@konsulko.com> <53A93304.9000604@nsn.com> <C009B451-09D6-4DE6-B859-E8113B63801E@konsulko.com>
In-Reply-To: <C009B451-09D6-4DE6-B859-E8113B63801E@konsulko.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: ext Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Ioan Nicu <ioan.nicu.ext@nsn.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi!

On 24/06/14 10:19, ext Pantelis Antoniou wrote:

[...]

>> No, it's not bool... It's an existence of a void property. 
>>
> 
> The is no such thing as a void property. A property without contents is defined as a bool. 
> 
>>>From Documentation/devicetree/bindings/interrupts.txt
> 
> "A device is marked as an interrupt controller with the "interrupt-controller"
> property. This is a empty, boolean property."

Maybe, the comment here should be also corrected :)

If we refer back to ePAPR, there are several use-cases of "<empty>" properties, for example:

2.3.8 ranges
Property: ranges
Value type: <empty> or <prop-encoded-array> encoded as arbitrary number of triplets of (child-bus-
address, parent-bus-address, length).
Description:
The ranges property provides a means of defining a mapping or translation between the
address space of the bus (the child address space) and the address space of the bus node's
parent (the parent address space).
...
If the property is defined with an <empty> value, it specifies that the parent and child address
space is identical, and no address translation is required.

=> by no means, should <empty> here be considered a "boolean".

2.4.2.2 Interrupt-controller
Property: interrupt-controller
Value type: <empty>
Description:
The presence of an interrupt-controller property defines a node as an interrupt controller node.

Also, ePAPR has no single occurrence of "bool", so this is something out of specification scope of the
device-tree :)

>>> The use of of_get_property is a bug here. It is perfectly valid for a property to have a
>>> NULL value when length = 0.
>>
>> of_find_property() would be really correct in this particular case...

-- 
Best regards,
Alexander Sverdlin.
