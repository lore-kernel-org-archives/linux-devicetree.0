Return-Path: <devicetree-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:63840 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754133Ab3GVGhP convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 22 Jul 2013 02:37:15 -0400
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp
	id 1V19kA-0002W1-Lz from Alison_Chaiken@mentor.com
	for devicetree@vger.kernel.org; Sun, 21 Jul 2013 23:37:14 -0700
From: "Chaiken, Alison" <Alison_Chaiken@mentor.com>
Subject: Re: [Ksummit-2013-discuss] [ATTEND] Handling of devicetree bindings
Date: Mon, 22 Jul 2013 06:37:13 +0000
Message-ID: <60BA5429A0E1584BA3633194F6F993B502B12F40@NA-MBX-03.mgc.mentorg.com>
References: <60BA5429A0E1584BA3633194F6F993B502AF6D65@NA-MBX-03.mgc.mentorg.com>,<1374425637.15077.8.camel@shinybook.infradead.org>,<60BA5429A0E1584BA3633194F6F993B502B10DBC@NA-MBX-03.mgc.mentorg.com>
In-Reply-To: <60BA5429A0E1584BA3633194F6F993B502B10DBC@NA-MBX-03.mgc.mentorg.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

I commented:
>> Assuredly if in a kernel update a driver adds new features which are
>> enabled by new properties described in the device-tree, updating both
>> the kernel and the device-tree at the same time makes sense?

David Woodhouse [dwmw2@infradead.org] inquired:
> the old kernel's driver simply didn't *use* the
> feature which was already (optionally) present. The later kernel *does*
> use the feature, and thus it needs to be described properly?

Precisely.   This case cames up frequently, as a board often (in principle) supports some new standards for which there is yet no available test peripheral.   Without hardware to test, no one creates a driver.    When there is no driver, no one creates DTS bindings.

> If so, that means the initial device-tree binding was *WRONG*. It
> omitted the description of this hardware feature, purely because the
> Linux driver at the time didn't happen to use it. Violating the cardinal
> rule that the device-tree description of the hardware SHALL NOT be
> dependent on any OS-specifics.

I take your point.    Ideally, a set of include files for a new board should be feature-complete , with more or less one DT node for every connector  on the board, whether or not there exists anything to plug in. Then the top-level board file would simply indicate the values of abstract properties and set status "okay" for hardware in-use.

Linus Walleij agrees:
# Varying parameters is not as big a thing as altering
# bindings. I should have been clear on this - altering a device
# tree to fit a board is fine. But altering device tree *bindings*
# is a sin.

Tomasz Figa explains:
@ - bindings should enter staging state after being introduced,
@ - from time to time a binding review meeting should take place (on IRC
@possibly) and discuss which of introduced staging bindings are ready to
@enter stable state,
@ - in stable state such binding would be considered an ABI.

In other words, David. Linus and Tomasz are suggesting that once a set of bindings has entered the stable branch, they are carved in stone equivalent to the way the "Thou Shalt not Break Userspace" commandment underlies the kernel's sysfs ABI.    Ideally,a kernel and device-tree binary that are part of a product release will be part of the stable branch.

The concept of having arch-level DTSI files that are included only by ISA-level DTSI files that are included only by CPU-level DTSI files might help this process.    When all the DT source is moved to a new repo and the directories are refactored, these all these most fundamental files can be put into stable branch.    The directory hierarchy then will make it clearer which files and associated bindings are part of stable ABI and are harder to modify.   And Documentation can express the idea that the DTB is the device-tree ABI towards the kernel and should be stable.

David continues:
> The older driver which doesn't use the optional feature should still work � just without
> *using* that feature, of course.
> If you ever encounter a scenario where you can't just use the latest
> device-tree, and an older kernel requires that you ship a contemporary
> device-tree to match it, then something has gone *catastrophically*
> wrong.

What can go catastrophically wrong is that the full functionality of a new driver will require new flexibility in some parameter that earlier implementations had assumed was invariant.    The new driver will want to read the parameter from the DTB that earlier implementations set in a driver's private data, or in a local include file, or even by a fuse.  Admittedly this example illustrates a newer driver requiring a newer DTB, not an older kernel requiring an older DTB.   Hopefully having a hierarchy of files will mean that only board-level files tend to get stuck in staging while those at higher levels would be patched rarely.

David continues:
> I think it's definitely worth having a session on device-tree bindings,
> to ensure that this subject is properly understood.

I hope that we will have an open discussion in Edinburgh that attendees who are not part of Kernel Summit may attend.   Pantelis Antoniou had mentioned a possible ELCE BoF session.

-- Alison

