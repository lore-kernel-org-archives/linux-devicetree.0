From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [PATCH 0/3 - V2] Introducing Device Tree Overlays
Date: Wed, 6 Nov 2013 21:08:15 +0200
Message-ID: <C10E33D7-53F6-4A50-9B84-1149DDBDC46F@antoniou-consulting.com>
References: <1383676898-29819-1-git-send-email-panto@antoniou-consulting.com> <20131106190152.GA8662@breakpoint.cc>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131106190152.GA8662@breakpoint.cc>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@breakpoint.cc>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

On Nov 6, 2013, at 9:01 PM, Sebastian Andrzej Siewior wrote:

> On 05.11.13, Pantelis Antoniou wrote:
>> The following patchset introduces Device Tree overlays, a method
>> of dynamically altering the kernel's live Device Tree, along with
>> a generic interface to use it in a board agnostic manner.
> 
> In case this has been discussed and I missed it: Why are we doing this?
> Isn't it possible to d o the overlay thingy in u-boot and pass a
> complete device tree to the kernel?
> Are you trying to do something like hotplug-PCI where the PCI card can
> be replaced at runtime?
> 

It has been discussed.

We are doing it because

a) We tried to do it in u-boot and it has been a complete disaster.
Regular users just can't handle bootloader updates.

b) It is similar to that. It was originally created for the beaglebone,
which has a concept of capes (similar to Arduino shields).
http://circuitco.com/support/index.php?title=BeagleBone_Capes
Turns out it's really useful to anyone doing reconfigurable hardware too,
so that's why FPGA people are thinking of using it.

c) There are people that want to tinker with Linux based hardware boards
but are not kernel developers. This gives them a way to do so without
having to recompile the kernel and/or reboot while tinkering.
 
> Sebastian

Regards

-- Pantelis
