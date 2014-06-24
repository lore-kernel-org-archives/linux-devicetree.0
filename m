Return-Path: <alexander.sverdlin@nsn.com>
Message-ID: <53A93E25.2090209@nsn.com>
Date: Tue, 24 Jun 2014 11:00:21 +0200
From: Alexander Sverdlin <alexander.sverdlin@nsn.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] OF: Utility helper functions for dynamic nodes
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-6-git-send-email-pantelis.antoniou@konsulko.com> <53A85549.7040809@nsn.com> <6E91A461-4361-4A18-BE32-CECDD789C114@konsulko.com> <20140623183343.GA10389@heimdall> <78ACBAF6-A73E-4272-8D3A-258C4B10858C@konsulko.com> <53A93304.9000604@nsn.com> <C009B451-09D6-4DE6-B859-E8113B63801E@konsulko.com> <53A93907.6070408@nsn.com> <2CAE7215-7D2D-454A-A6FD-6E93FAE8F1F7@konsulko.com>
In-Reply-To: <2CAE7215-7D2D-454A-A6FD-6E93FAE8F1F7@konsulko.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: ext Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Ioan Nicu <ioan.nicu.ext@nsn.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi!

On 24/06/14 10:54, ext Pantelis Antoniou wrote:
> The fact of the matter is that use of of_get_property() where the intended use is to check
> for the existence of a property (that might be empty) is incorrect IMO. of_find_property might
> work, as well as the more correct form, where we know the property is a boolean, of_property_read_bool().
> 
> The pointer returned from of_get_property() is not usable in any form. Whether it does 
> contains a NULL or not value is immaterial. That it works at all is a side-effect of how the
> flattening code assigns value pointers.
> 
> My vote is to just fix all the call sites using this questionable idiom.

I fully agree with you here, this assumption that value!=NULL is simply not obvious.
Let's wait, what Grant says, I can prepare a tree-wide patch, I think...

-- 
Best regards,
Alexander Sverdlin.
