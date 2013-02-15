From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] of/pci: Provide support for parsing PCI DT ranges property
Date: Fri, 15 Feb 2013 14:16:17 +0100
Message-ID: <CACRpkdYbzuONVyUZ5V9t5D6nux9G9p1QRS+w7AO-cFZFBGMRFA@mail.gmail.com>
References: <1360570940-17086-1-git-send-email-thierry.reding@avionic-design.de>
	<1360570940-17086-2-git-send-email-thierry.reding@avionic-design.de>
	<20130213225311.37FFB3E3557@localhost>
	<20130214165341.GA29199@arm.com>
	<20130214191745.GA13875@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130214191745.GA13875@avionic-0098.mockup.avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Andrew Murray <andrew.murray@arm.com>, Grant Likely <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

n Thu, Feb 14, 2013 at 8:17 PM, Thierry Reding
<thierry.reding@avionic-design.de> wrote:
> On Thu, Feb 14, 2013 at 04:53:41PM +0000, Andrew Murray wrote:
>> Thierry,
>>
>> If you don't have much bandwidth I'd be quite happy to take this on - this
>> would be beneficial for my eventual patchset. I can start by refactoring common
>> implementations of pci_process_bridge_OF_ranges or similar across the
>> architectures as per Grant's suggestion? I didn't do this when I first posted
>> the patch as I was concerned about the testing effort.
>
> Absolutely! Since it was your patch in the first place you're just as
> well suited to do this if you want to and have the time.

I am working on device tree patches for the Integrator/AP with it's
PCIv3 bridge, and I also follow this with great interest. I was almost
going to start the copy/paste cycle but now I think it's better if
I wait for this to happen.

Yours,
Linus Walleij
