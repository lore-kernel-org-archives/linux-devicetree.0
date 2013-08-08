Return-Path: <devicetree-owner@vger.kernel.org>
Received: from jdl.com ([208.123.74.7]:37280 "EHLO jdl.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757837Ab3HHOQu (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Thu, 8 Aug 2013 10:16:50 -0400
Received: from jdl (helo=jdl.com)
	by jdl.com with local-esmtp (Exim 4.72)
	(envelope-from <jdl@jdl.com>)
	id 1V7R1G-0005xF-8e
	for devicetree@vger.kernel.org; Thu, 08 Aug 2013 09:16:50 -0500
Message-Id: <E1V7R1G-0005xF-8e@jdl.com>
Subject: The DTC, kernel.org, and You
Date: Thu, 08 Aug 2013 09:16:50 -0500
From: Jon Loeliger <jdl@jdl.com>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


Folks,

I am pleased to announce a new official location
for the Linux Kernel Device Tree Compiler (dtc)!

I have pushed a clone of the dtc repository to git.kernel.org !
While I forsee maintaining a clone copy on git.jdl.com, the
new official location will move to git.kernel.org.

Right now, you can clone from kernel.org like this:

    $ git clone git://git.kernel.org/pub/scm/linux/kernel/git/jdl/dtc.git

Eventually there should also be a clone available here too:

    $ git clone git://git.kernel.org/pub/scm/utils/dtc/dtc.git

The latter is not available yet, so use the former.

Enjoy,
jdl
