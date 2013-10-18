From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH] of/lib: Export fdt routines to modules
Date: Fri, 18 Oct 2013 09:30:32 -0700
Message-ID: <52616228.80002@caviumnetworks.com>
References: <1381966065-16854-1-git-send-email-mbohan@codeaurora.org> <525F2397.40203@caviumnetworks.com> <20131017002731.GA22830@codeaurora.org> <525F6D83.1050808@roeck-us.net> <20131017235132.GA6241@codeaurora.org> <52608457.5040609@roeck-us.net> <20131018025405.GA3722@codeaurora.org> <33103C16-6472-4AAE-ADB8-50807CC96C85@antoniou-consulting.com> <52615A64.9040803@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <52615A64.9040803@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Pantelis Antoniou <panto@antoniou-consulting.com>, Michael Bohan <mbohan@codeaurora.org>, Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, ralf@linux-mips.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, david.daney@cavium.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/18/2013 08:57 AM, Rob Herring wrote:
[...]
>
> Unflattening is definitely the right
> direction to go here.
>

I wonder if that is really true.

The device tree in question is very short lived, and used to control the 
configuration of some hardware device when loading the driver.

The use of it is completely contained within a single driver (at least 
that is my understanding), it is not information that needs to be shared 
system wide.

Given that it is a driver implementation issue, rather than making 
things work nicely system wide, I don't think it really matters what is 
done.

It may be that the overhead of unflattening the tree and then freeing 
it, is much greater than just extracting a few things from the FDT.

That said, I don't really have a preference for what is done.  My 
original questions were targeted at understanding this particular use case.

David Daney
