Return-Path: <SRS0=eEAX=N4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from cpanel4.indieserve.net ([199.212.143.9]:33240 "EHLO
        cpanel4.indieserve.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbeKRHvY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 18 Nov 2018 02:51:24 -0500
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:48902 helo=localhost.localdomain)
        by cpanel4.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.91)
        (envelope-from <rpjday@crashcourse.ca>)
        id 1gO7lu-0002El-2c
        for devicetree@vger.kernel.org; Sat, 17 Nov 2018 16:04:54 -0500
Date: Sat, 17 Nov 2018 16:04:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: should i be able to "dtx_diff" compare .dts files outside of kernel
 tree?
Message-ID: <alpine.LFD.2.21.1811171602340.4420@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: devicetree-owner@vger.kernel.org
To: Device Tree Mailing List <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


  once upon a time, i asked:

https://www.spinics.net/lists/devicetree/msg200409.html

a quick perusal of the dtx_diff script in the current kernel source
tree suggests i should be able to compare two .dts files as long as i
specify a source tree with "-s", but as i pointed out in that post,
that doesn't work.

  should it? the comments in the script seem to *imply* that that
should work. thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                  http://crashcourse.ca/dokuwiki

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
