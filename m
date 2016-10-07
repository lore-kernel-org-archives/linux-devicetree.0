From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC 0/2] Juniper DT based connector driver
Date: Fri, 7 Oct 2016 17:30:14 +0200
Message-ID: <20161007153014.GC10482@kroah.com>
References: <1475853372-21997-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1475853372-21997-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Alon Ronen <aronen@juniper.net>, Debjit Ghosh <dghosh@juniper.net>, Dhruva Diveneni <ddevineni@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, Yu-Lin Lu <ylu@juniper.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 07, 2016 at 06:16:10PM +0300, Pantelis Antoniou wrote:
> Introduce a Juniper PTX router series DT overlay based
> connector driver.
> 
> This is submitted as an RFC since some OF infrastructure
> patches (like changeset helpers etc) are not yet mainlined.

staging drivers almost always need to at least build (or if not, have a
good reason why not.)

So don't post code until people can at least test-build it, otherwise no
one will care about it.  Would you review such code?

thanks,

greg k-h
