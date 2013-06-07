From: Henrik =?ISO-8859-1?Q?Nordstr=F6m?= <henrik@henriknordstrom.net>
Subject: Re: [Arm-netbook] getting allwinner SoC support upstream (was Re:
 Uploading linux (3.9.4-1))
Date: Fri, 07 Jun 2013 12:26:57 +0200
Message-ID: <1370600817.9983.7.camel@localhost>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com>
	 <1370475609.20454.44.camel@localhost>
	 <CAPweEDwS3tR=wh-bZJb3vqR8fVQra=3XxDitowGRdH9c7WRfmQ@mail.gmail.com>
	 <1733666.lHUBcfUXq9@flatron>
	 <CAPweEDzYLDzh_-OWU61dtVhajZ40QpQgZKHFYDsh3FgF=r9_ag@mail.gmail.com>
	 <20130606131042.GN18614@n2100.arm.linux.org.uk>
	 <CAPweEDyYt+pN+UaFuqWL5RrHpyuq_4So-tArmx3dr=0wLS+hwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPweEDyYt+pN+UaFuqWL5RrHpyuq_4So-tArmx3dr=0wLS+hwQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "luke.leighton" <luke.leighton@gmail.com>
Cc: Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>, Russell King - ARM Linux <linux@arm.linux.org.uk>, devicetree-discuss <devicetree-discuss@ozlabs.org>, Stephen Warren <swarren@wwwdotorg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, debian-arm@lists.debian.org, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, linux-arm-kernel@lists.infradead.org, debian-kernel@lists.debian.org
List-Id: devicetree@vger.kernel.org

fre 2013-06-07 klockan 09:02 +0100 skrev luke.leighton:

>  ok.  so.  we come back to the question again: what shall i propose to
> them that they consider doing, and what benefit would it be to them to
> do so?

Just tell them that the kernel is moving to a different configuration
syntax called Device Tree, but apart from updating kernel drivers to the
new way of configuring things it only have minor impact on their
envionment. It is still possible to use the fex file for all board
configuration details, only requires a small tool for translating fex to
device tree.

The change only impacts kernel, and a small change to their SDK build
scripts to also build the device tree from the fex.

It is no big deal really in structural terms. There is far bigger
structural changes in the kernel which coincides with this and will
require some developer time to adjust for. Had they upstreamed their
changes earlier then...

Regards
Henrik
